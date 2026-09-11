<!-- 状態：草案（未投稿）。投稿先・Phonetic の扱いは投稿前に判断。日本語の背景は docs/localisation-ja.md -->

# Change request (draft): Add a "Representation" data element to CLUSTER.structured_name.v1 (and an equivalent for organisation names)

*Draft for openEHR Discourse / CKM change request — Shinji KOBAYASHI, NPO openEHR Japan (skoba@moss.gr.jp), 2026-09-11. Status: draft for review before posting.*

## Summary

We request that `openEHR-EHR-CLUSTER.structured_name.v1` gain an optional, coded data element **Representation** that records which writing system or representational form a given instance of the structured name is expressed in — *ideographic*, *syllabic* or *alphabetic* (with free text for other forms). Because the CLUSTER already sits in `0..*` slots (e.g. `CLUSTER.person.v1` / Structured name), this single element lets one person carry several representations of the same name side by side, each explicitly labelled, without relying on template node names.

We also ask the editors to consider the equivalent for organisation names in `openEHR-EHR-CLUSTER.organisation.v1`, where *Name* is a single `0..1` element and therefore cannot be repeated per representation.

## Why this is an international requirement, not a Japanese one

In Japan every clinical and administrative form records a person's name twice: in kanji (ideographic) and as *furigana* — the reading of the name written in katakana (syllabic). The reading is not derivable from the kanji (the same characters can be read in several ways), so it is an independent data item, mandatory for identification, sorting, phonetic search and for matching against national systems (insurance, the Online Qualification Verification system, etc.). A third, alphabetic representation (Hepburn romanisation) is required for passports and international documents. The same pattern applies to organisation names and, in Japan, to addresses.

The requirement is shared by every community whose names are written in a non-alphabetic script and routinely transliterated: Chinese (hanzi / pinyin), Korean (hangul / hanja / romanisation), Thai, Arabic, Persian, Cyrillic-script languages in Latin-script systems, and vice versa. Any archetype meant to be used internationally therefore needs a way to say *which* representation a name instance is.

## Current modelling gap

- `CLUSTER.structured_name.v1` (published) contains only *Title*, *Given name*, *Family name* and *Suffix*. There is no element that identifies the representation.
- `CLUSTER.person.v1` / *Name* and `CLUSTER.organisation.v1` / *Name* are `0..1` `DV_TEXT` elements, so a second representation cannot be recorded at all.
- The only workaround today is to include `CLUSTER.structured_name.v1` twice in a template and distinguish the two occurrences by renaming the nodes (e.g. "Name (kanji)" / "Name (kana)"). This is fragile: the meaning lives in a template-specific node name, it is invisible to AQL across templates and vendors, and it cannot be mapped losslessly to other standards.

## Precedents the proposal aligns with

1. **ISO/TS 22220:2011** *Health informatics — Identification of subjects of health care* has a dedicated clause **6.9 "Alternative name representation"** for exactly this purpose.
2. **openEHR CKM itself**: `openEHR-DEMOGRAPHIC-PARTY_IDENTITY.person_name.v0` already models *Alternative name representations* (at0007), *Representation usage* (at0021, "Name of the representational form used") and *Alternative representation* (at0022, "…using alternative styles of representation such as character sets…"). The EHR-side `CLUSTER.structured_name.v1` is currently inconsistent with the demographic model.
3. **HL7 v3 / ISO 21090 `EN` and HL7 FHIR**: FHIR provides the extension `iso21090-EN-representation` with the codes **ABC** (alphabetic), **IDE** (ideographic) and **SYL** (syllabic). **HL7 FHIR JP Core** mandates this extension on `HumanName` (IDE = kanji, SYL = full-width katakana reading, ABC = romanisation; e.g. 山田 太郎 / ヤマダ タロウ / YAMADA TARO). A matching element in openEHR gives a lossless two-way mapping for every openEHR–FHIR bridge in these countries.

## Proposed change

### A. `CLUSTER.structured_name.v1` — add one optional element (minor revision)

| Item | Proposal |
|---|---|
| Element | **Representation** — `ELEMENT`, occurrences `0..1` |
| Data type | `DV_CODED_TEXT` (internal codes) with `DV_TEXT` fallback |
| Description | "The writing system or representational form in which this instance of the name is expressed." |
| Comment | "Use a separate occurrence of this CLUSTER for each representation of the same name, e.g. an ideographic form and its syllabic reading. Aligns with ISO/TS 22220 §6.9 'Alternative name representation' and with the FHIR extension `iso21090-EN-representation` (ABC/IDE/SYL)." |
| Values | **Ideographic** — "The name is written in an ideographic (logographic) script, such as kanji, hanzi or hanja." / **Syllabic** — "The name is written in a syllabic script, typically as the phonetic reading of an ideographic form, such as Japanese kana (furigana)." / **Alphabetic** — "The name is written in an alphabetic script, including transliterations or romanisations such as Hepburn or pinyin." / *(for discussion)* **Phonetic** — "A phonetic transcription of the name (e.g. IPA), independent of the script normally used to write it." |

Adding an optional element is backward compatible (1.x revision); existing data and templates are unaffected, and templates may constrain the value set or make the element mandatory.

### B. `CLUSTER.organisation.v1` — allow alternative representations of the organisation name

Options for the editors, in our order of preference:

1. Add an internal `CLUSTER` **Alternative name** (`0..*`) with *Name* (`DV_TEXT`) and *Representation* (same value set as above), leaving the existing *Name* element untouched.
2. Alternatively, relax *Name* to `0..*` and add a sibling *Name representation* element — simpler, but the pairing of a name with its representation then depends on ordering, which we consider weaker.

Japanese reimbursement and referral forms carry the organisation name with its katakana reading, so option 1 would be used immediately.

## Interim handling and offer

Until a revision is published, NPO openEHR Japan will use template-level occurrences with renamed nodes and local CLUSTER archetypes for the reading of names and addresses, and will migrate to the international elements once available. We are happy to supply the Japanese translation of the revised archetype, worked examples (kanji/kana/romaji), and test data, and to take part in the review.

## References

- ISO/TS 22220:2011 Health informatics — Identification of subjects of health care, clause 6.9 Alternative name representation.
- openEHR CKM: openEHR-DEMOGRAPHIC-PARTY_IDENTITY.person_name.v0 (at0007 Alternative name representations; at0021 Representation usage; at0022 Alternative representation).
- HL7 FHIR extension iso21090-EN-representation (ABC | IDE | SYL); HL7 FHIR JP Core, JP Core HumanName DataType.
