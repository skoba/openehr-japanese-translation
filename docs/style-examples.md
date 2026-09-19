# 校正例（校正前 → 校正後）

`tools/style_examples.rb` が `review:` コミットから生成する。翻訳前に読み、NEW の方向で訳す（glossary-ja.md「こなれた訳のための規則」）。手で編集しない（`make examples` で再生成）。

## openEHR-EHR-EVALUATION.problem_diagnosis.v1 — problem_diagnosis.v1 校正の取り込みと「プロブレム」への用語統一（2026-09-10）

### description/-/purpose
- EN : For recording details about a single, identified health problem or diagnosis. \n\nThe intended scope of a health problem is deliberately kept loose in the context of clinical documentation, so as to capture any real or perceived concerns that may adversely affect an individual's wellbeing to any degree. A health problem may be identified by the individual, a carer or a healthcare professional. However, a diagnosis is additionally defined based on objective clinical criteria, and usually determined only by a healthcare professional.
- OLD: 特定された単一の健康上の問題または診断についての詳細を記録するため。 \n\n臨床文書化の文脈では、健康上の問題が意図する範囲は意図的に緩やかに保たれている。これは、個人のウェルビーイングに何らかの程度で悪影響を及ぼしうる、実在する、または実在すると認識されているあらゆる懸念を捉えるためである。健康上の問題は、本人、介護者、または医療従事者によって特定されうる。一方、診断はさらに客観的な臨床的基準に基づいて定義され、通常は医療従事者のみが決定する。
- NEW: 特定された単一の健康上のプロブレムや診断に関する詳細を記録するためのものである。\n\n臨床記録の文脈において、「健康上のプロブレム」の範囲は意図的に広く定義されている。これは、個人のウェルビーイング（心身の健康や幸福）に何らかの形で悪影響を及ぼし得る懸念事項を、それが客観的な事実であるか主観的な認識であるかを問わず、すべて捉えるためである。健康上のプロブレムは、本人、介護者、または医療従事者によって特定され得る。一方、「診断」は客観的な臨床基準に基づいて定義されるものであり、通常は医療従事者のみが下す判断となる。

### description/-/use
- EN : Use for recording details about a single, identified health problem or diagnosis. \n\nClear definitions that enable differentiation between a 'problem' and a 'diagnosis' are almost impossible in practice - we cannot reliably tell when a problem should be regarded as a diagnosis. When diagnostic or classification criteria are successfully met, then we can confidently call the condition a formal diagnosis, but prior to these conditions being met and while there is supportive evidence available, it can also be valid to use the term 'diagnosis'. The amount of supportive evidence required for the label of diagnosis is not easy to define and in reality probably varies from condition to condition. Many standards committees have grappled with this definitional conundrum for years without clear resolution.\n\nFor the purposes of clinical documentation with this archetype, problem and diagnosis are regarded as a continuum, with increasing levels of detail and supportive evidence usually providing weight towards the label of 'diagnosis'. In this archetype it is not neccessary to classify the condition as a 'problem' or 'diagnosis'. The data requirements to support documentation of either are identical, with additional data structure required to support inclusion of the evidence if and when it becomes available. Examples of problems include: the individual's expressed desire to lose weight, but without a formal diagnosis of Obesity; or a relationship problem with a family member. Examples of formal diagnoses would include a cancer that is supported by historical information, examination findings, histopathological findings, radiological findings and meets all requirements for known diagnostic criteria. In practice, most problems or diagnoses do not sit at either end of the problem-diagnosis spectrum, but somewhere in between.\n\nThis archetype can be used within many contexts. For example, recording a problem or a clinical diagnosis during a clinical consultation; populating a persistent Problem List; or to provide a summary statement within a Discharge Summary document.\n\nIn practice, clinicians use many context-specific qualifiers such as past/present, primary/secondary, active/inactive, admission/discharge etc. The contexts can be location-, specialisation-, episode- or workflow-specific, and these can cause confusion or even potential safety issues if perpetuated in Problem Lists or shared in documents that are outside of the original context. These qualifiers can be archetyped separately and included in the ‘Status’ slot, because their use varies in different settings. It is expected that these will be used mostly within the appropriate context and not shared out of that context without clear understanding of potential consequences. For example, a primary diagnosis to one clinician may be a secondary one to another specialist; an active problem can become inactive (or vice versa) and this can impact the safe use of clinical decision support. In general these qualifiers should be applied locally within the context of the clinical system, and in practice these statuses should be manually curated by clinicians to ensure that lists of Current/Past, Active/Inactive or Primary/Secondary Problems are clinically accurate. \n\nThis archetype will be used as a component within the Problem Oriented Medical Record as described by Larry Weed. Additional archetypes, representing clinical concepts such as condition as an overarching organiser for diagnoses etc, will need to be developed to support this approach.\n\nIn some situations, it may be assumed that identification of a diagnosis fits only within the expertise of physicians, but this is not the intent for this archetype. Diagnoses can be recorded using this archetype by any healthcare professional.
- OLD: 特定された単一の健康上の問題または診断についての詳細を記録するために用いる。 \n\n「問題」と「診断」を区別できる明確な定義は、実際にはほぼ不可能である。ある問題をいつから診断とみなすべきかを確実に判断することはできない。診断基準や分類基準が満たされれば、その病態を正式な診断と自信を持って呼ぶことができるが、それらの条件が満たされる前であっても、裏付けとなる根拠がある間は「診断」という語を用いることも妥当でありうる。診断というラベルに必要とされる裏付けとなる根拠の量を定義するのは容易ではなく、実際には病態ごとに異なると考えられる。多くの標準化委員会が長年この定義上の難題に取り組んできたが、明確な解決には至っていない。\n\n本アーキタイプによる臨床文書化の目的においては、問題と診断は連続体とみなし、詳細さと裏付けとなる根拠の水準が高まるにつれて、通常は「診断」というラベルに重みが加わるものとする。本アーキタイプでは、その病態を「問題」または「診断」に分類する必要はない。どちらの文書化を支えるデータ要件も同一であり、根拠が利用可能になった時点でそれを含められるように追加のデータ構造が必要となるだけである。問題の例には、肥満という正式な診断はないが本人が減量したいと表明していること、あるいは家族との関係の問題などがある。正式な診断の例には、病歴情報、診察所見、病理組織学的所見、放射線学的所見によって裏付けられ、既知の診断基準のすべての要件を満たすがんなどがある。実際には、ほとんどの問題や診断は問題－診断スペクトラムのどちらかの端ではなく、その中間のどこかに位置する。\n\n本アーキタイプは多くの文脈で使用できる。例えば、診察中に問題や臨床診断を記録する、永続的な問題リストに登録する、退院時サマリー文書内で要約を示す、などである。\n\n実際には、臨床医は過去/現在、主/副、活動性/非活動性、入院時/退院時など、文脈に固有の多くの修飾子を用いる。その文脈は、場所、専門分野、エピソード、またはワークフローに固有のものでありうるため、問題リストに引き継がれたり、元の文脈の外にある文書で共有されたりすると、混乱や潜在的な安全上の問題さえ引き起こしうる。これらの修飾子は、その使い方が状況によって異なるため、別のアーキタイプとして作成し「状態」スロットに含めることができる。これらは主に適切な文脈の中で使用され、起こりうる結果を明確に理解することなくその文脈の外で共有されることはないと想定している。例えば、ある臨床医にとっての主診断が別の専門医にとっては副診断であることがあり、活動性の問題が非活動性になる（またはその逆）ことがあり、これが臨床意思決定支援の安全な利用に影響しうる。一般に、これらの修飾子は臨床システムの文脈の中でローカルに適用されるべきであり、実際には、現在/過去、活動性/非活動性、主/副の問題のリストが臨床的に正確であるように、臨床医が手作業でこれらの状態を管理すべきである。 \n\n本アーキタイプは、Larry Weed が提唱した問題志向型診療記録（Problem Oriented Medical Record）の構成要素として使用される。このアプローチを支えるためには、複数の診断を束ねる上位の整理概念としての病態（condition）などの臨床概念を表す追加のアーキタイプを開発する必要がある。\n\n状況によっては、診断の特定は医師の専門領域にのみ属すると想定されることがあるが、それは本アーキタイプの意図ではない。本アーキタイプを用いて、あらゆる医療従事者が診断を記録できる。
- NEW: 特定された単一の健康上のプロブレムや診断に関する詳細を記録するために使用される。\n\n「プロブレム（problem）」と「診断（diagnosis）」を区別する明確な定義を実務上で定めることはほぼ不可能である。ある「プロブレム」をいつ「診断」とみなすべきかを確実に判断することはできない。診断基準や分類基準を完全に満たせば、その状態を正式な「診断」と呼ぶことができるが、基準を満たす前であっても、それを裏付ける証拠があれば「診断」という用語を使用することが妥当な場合もある。「診断」と呼ぶために必要な証拠の量は定義が難しく、実際には疾患や状態によって異なるだろう。多くの標準化委員会が長年にわたり、この定義上の難問に取り組んできたが、明確な解決には至っていない。\n\nこのアーキタイプを用いた臨床記録においては、「プロブレム」と「診断」は連続したもの（スペクトラム）として扱われる。詳細情報や裏付けとなる証拠が増えるにつれて、通常は「診断」というラベルが適用される方向へと重み付けがなされる。このアーキタイプでは、対象となる状態を「プロブレム」か「診断」のいずれかに分類する必要はない。どちらを記録する場合でも必要なデータ要件は同じであり、証拠が利用可能になった際にそれを追加するためのデータ構造が用意されている。「プロブレム」の例としては、肥満の正式な診断はなされていないものの、本人が減量を希望している場合や、家族との人間関係の問題などが挙げられる。一方、正式な「診断」の例としては、病歴、診察所見、組織病理学的所見、画像診断所見によって裏付けられ、既知の診断基準の要件をすべて満たす癌などが挙げられる。実際には、多くの「プロブレム」や「診断」は、「プロブレム」と「診断」というスペクトラムの両端のどちらかにあるわけではなく、その中間のどこかに位置している。\n\nこのアーキタイプは、さまざまな状況で使用できる。例えば、診療中の「プロブレム」や臨床的な「診断」の記録、継続的な「プロブレムリスト（Problem List）」への記載、あるいは退院時サマリーにおける概要の記述などが挙げられる。\n\n臨床現場では、過去／現在、主／副（プライマリ／セカンダリ）、active/inactive、入院時／退院時など、状況に応じた多くの修飾語（qualifier）が使用される。これらの状況は、場所、専門分野、診療エピソード、あるいはワークフローによって異なる。こうした修飾語が「プロブレムリスト」にそのまま残されたり、元の文脈とは異なる文書で共有されたりすると、混乱や安全上の問題を引き起こす可能性がある。これらの修飾語の使用法は設定によって異なるため、個別のアーキタイプとして定義し、「ステータス（Status）」スロットに組み込むことが可能である。これらは主に適切な文脈で使用されることが想定されており、潜在的な影響を明確に理解することなく、その文脈から切り離して共有されるべきではない。例えば、ある臨床医にとっては「主診断（primary diagnosis）」であっても、別の専門医にとっては「副診断（secondary diagnosis）」となる場合がある。また、activeな問題がinactiveに変わる（あるいはその逆）こともあり、こうした変化は臨床意思決定支援システムの安全な利用に影響を及ぼし得る。一般に、これらの修飾語は臨床システムの文脈内でローカルに適用されるべきであり、実際には、現在／過去、活動性／非活動性、あるいは主／副といったプロブレムのリストが臨床的に正確であることを保証するために、臨床医が手動で状態を管理・調整する必要がある。\n\nこのアーキタイプは、Larry Weedが提唱した「プロブレム志向型診療録（Problem Oriented Medical Record）」の構成要素として使用される。このアプローチを支援するためには、診断などを包括的にまとめる概念である「病態（condition）」といった臨床概念を表す、追加のアーキタイプを開発する必要がある。\n\n診断の特定は医師の専門領域にのみ属すると見なされる場合もあるが、本アーキタイプはそのような意図で設計されたものではない。本アーキタイプを使用すれば、あらゆる医療従事者が診断を記録することが可能である。\n\nProblemの日本語訳出には「問題」「課題」なども考えたが、既に広く「プロブレムリスト」として用語が普及していることから、「プロブレム」を訳語として採用することとした。

### description/-/misuse
- EN : Not to be used to record symptoms as described by the individual - use the CLUSTER.symptom archetype, usually within the OBSERVATION.story archetype.\n\nNot to be used to record examination findings - use the family of examination-related CLUSTER archetypes, usually nested within the OBSERVATION.exam archetype.\n\nNot to be used to record laboratory test results or related diagnoses, for example pathological diagnoses - use an appropriate archetype from the laboratory family of OBSERVATION archetypes.\n\nNot to be used to record imaging examination results or imaging diagnoses - use an appropriate archetype from the imaging family of OBSERVATION archetypes.\n\nNot to be used to record 'Differential Diagnoses' - use the EVALUATION.differential_diagnosis archetype.\n\nNot to be used to record 'Reason for Encounter' or 'Presenting Complaint' - use the EVALUATION.reason_for_encounter archetype.\n\nNot to be used to record procedures - use the ACTION.procedure archetype.\n\nNot to be used to record details about pregnancy - use the EVALUATION.pregnancy_bf_status and EVALUATION.pregnancy and related archetypes.\n\nNot to be used to record statements about health risk or potential problems - use the EVALUATION.health_risk archetype.\n\nNot to be used to record statements about adverse reactions, allergies or intolerances - use the EVALUATION.adverse_reaction archetype.\n\nNot to be used for the explicit recording of an absence (or negative presence) of a problem or diagnosis, for example ‘No known problem or diagnoses’ or ‘No known diabetes’. Use the EVALUATION.exclusion-problem_diagnosis archetype to express a positive statement about exclusion of a problem or diagnosis.
- OLD: 本人が述べる症状を記録するために用いてはならない。通常は OBSERVATION.story アーキタイプの中で CLUSTER.symptom アーキタイプを用いること。\n\n診察所見を記録するために用いてはならない。通常は OBSERVATION.exam アーキタイプの中に入れ子にする診察関連の CLUSTER アーキタイプ群を用いること。\n\n臨床検査結果やそれに関連する診断、例えば病理診断を記録するために用いてはならない。臨床検査系の OBSERVATION アーキタイプ群から適切なアーキタイプを用いること。\n\n画像検査結果や画像診断を記録するために用いてはならない。画像系の OBSERVATION アーキタイプ群から適切なアーキタイプを用いること。\n\n「鑑別診断」を記録するために用いてはならない。EVALUATION.differential_diagnosis アーキタイプを用いること。\n\n「受診理由」や「主訴」を記録するために用いてはならない。EVALUATION.reason_for_encounter アーキタイプを用いること。\n\n処置を記録するために用いてはならない。ACTION.procedure アーキタイプを用いること。\n\n妊娠についての詳細を記録するために用いてはならない。EVALUATION.pregnancy_bf_status、EVALUATION.pregnancy および関連するアーキタイプを用いること。\n\n健康リスクや潜在的な問題についての記述を記録するために用いてはならない。EVALUATION.health_risk アーキタイプを用いること。\n\n有害反応、アレルギー、不耐性についての記述を記録するために用いてはならない。EVALUATION.adverse_reaction アーキタイプを用いること。\n\n問題や診断が存在しないこと（または否定的な存在）を明示的に記録するために用いてはならない。例えば「既知の問題や診断なし」や「既知の糖尿病なし」などである。問題や診断の除外についての肯定的な記述を表すには、EVALUATION.exclusion-problem_diagnosis アーキタイプを用いること。
- NEW: 本人から聞き取った症状を記録するために使用してはならない。代わりに、通常は OBSERVATION.story アーキタイプ内で CLUSTER.symptom archetypeを使用すること。\n\n診察所見を記録するために使用してはならない。代わりに、通常は OBSERVATION.exam アーキタイプ内にネストされた、診察(examination)関連の CLUSTER archetype群を使用すること。\n\n臨床検査結果や関連する診断（病理診断など）を記録するために使用してはならない。代わりに、OBSERVATION archetypeの臨床検査関連(laboratory family)グループから適切なarchetypeを使用すること。\n\n画像検査結果や画像診断を記録するために使用してはならない。代わりに、OBSERVATION archetypeの画像検査関連グループ(imaging family)から適切なarchetypeを使用すること。\n\n「鑑別診断」を記録するために使用してはならない。代わりに EVALUATION.differential_diagnosis archetypeを使用すること。\n\n「受診理由」や「主訴」を記録するために使用してはならない。代わりに EVALUATION.reason_for_encounter archetypeを使用すること。\n\n処置や手技を記録するために使用してはならない。代わりに ACTION.procedure archetypeを使用すること。\n\n妊娠に関する詳細を記録するために使用してはならない。代わりに EVALUATION.pregnancy_bf_status、EVALUATION.pregnancy、および関連するarchetypeを使用すること。\n\n健康リスクや潜在的な問題に関する記述を記録するために使用してはならない。代わりに EVALUATION.health_risk archetypeを使用すること。\n\n有害反応、アレルギー、または不耐症に関する記述を記録するために使用してはならない。代わりに EVALUATION.adverse_reaction アーキタイプを使用すること。\n\nプロブレムや診断が存在しないこと（または陰性であること）を明示的に記録するために使用してはならない（例：「既知のプロブレムや診断なし」、「既知の糖尿病なし」など）。プロブレムや診断を除外する旨を肯定的に記述するには、EVALUATION.exclusion-problem_diagnosis アーキタイプを使用すること。

### description/-/keywords
- EN : issue | condition | problem | diagnosis | concern | injury | clinical impression
- OLD: 課題 | 病態 | 問題 | 診断 | 懸念 | 外傷 | 臨床的印象 | 傷病名 | 病名
- NEW: 課題 | 病態 | 問題 | プロブレム | 診断 | 懸念 | 外傷 | 臨床的印象 | 傷病名 | 病名

### term/at0000/text
- EN : Problem/Diagnosis
- OLD: 問題/診断
- NEW: プロブレム・診断

### term/at0000/description
- EN : Details about a single identified health condition, injury, disability or any other issue which impacts on the physical, mental and/or social well-being of an individual.
- OLD: 個人の身体的、精神的、および／または社会的なウェルビーイングに影響を及ぼす、特定された単一の健康上の病態、外傷、障害、その他あらゆる問題についての詳細。
- NEW: 個人の身体的、精神的、および／または社会的なウェルビーイング（幸福・健康）に影響を及ぼす、特定された単一の病状、外傷、障害、またはその他の問題に関する詳細。

### term/at0000/comment
- EN : Clear delineation between the scope of a problem versus a diagnosis is not easy to achieve in practice. For the purposes of clinical documentation with this archetype, problem and diagnosis are regarded as a continuum, with increasing levels of detail and supportive evidence usually providing weight towards the label of 'diagnosis'.
- OLD: 問題と診断の範囲を明確に線引きすることは、実際には容易ではない。本アーキタイプによる臨床文書化の目的においては、問題と診断は連続体とみなし、詳細さと裏付けとなる根拠の水準が高まるにつれて、通常は「診断」というラベルに重みが加わるものとする。
- NEW: 実際には、「プロブレム（problem）」と「診断（diagnosis）」の範囲を明確にして、区別することは容易ではない。本archetypeを用いた臨床記録においては、プロブレムと診断は連続的なものとみなされる。詳細情報や裏付けとなる証拠が充実するにつれて、通常、その項目は「診断」という分類に位置づけられるようになる。\n\nProblemの日本語訳出には「問題」「課題」なども考えたが、既に広く「プロブレムリスト」として用語が普及していることから、「プロブレム」を訳語として採用することとした。

### term/at0002/text
- EN : Problem/Diagnosis name
- OLD: 問題/診断名
- NEW: プロブレム・診断の名称

### term/at0002/description
- EN : Identification of the problem or diagnosis, by name.
- OLD: 問題または診断の、名称による特定。
- NEW: 特定されたプロブレムや診断の名称。

### term/at0002/comment
- EN : Coding of the name of the problem or diagnosis with a terminology is preferred, where possible.
- OLD: 可能であれば、問題または診断の名称は用語集によりコード化することが望ましい。
- NEW: プロブレムや診断の名称を可能な限り用語体系(terminology)を用いてコード化することが推奨される。

### term/at0003/text
- EN : Date/time clinically recognised
- OLD: 臨床的認識日時
- NEW: 臨床的に認識された日時

### term/at0003/description
- EN : Estimated or actual date/time the diagnosis or problem was recognised by a healthcare professional.
- OLD: 医療従事者が診断または問題を認識した、推定または実際の日時。
- NEW: 医療従事者によって診断またはプロブレムが認識された実際の日時、あるいは推定される日時。

### term/at0003/comment
- EN : Partial dates are acceptable. If the subject of care is under the age of one year, then the complete date or a minimum of the month and year is necessary to enable accurate age calculations - for example, if used to drive decision support. Data captured/imported as \"Age at time of clinical recognition\" should be converted to a date using the subject's date of birth.
- OLD: 部分的な日付も許容される。ケア対象者が1歳未満の場合、正確な年齢計算（例えば意思決定支援に用いる場合）を可能にするため、完全な日付、または少なくとも月と年が必要である。「臨床的認識時の年齢」として取得／取り込まれたデータは、ケア対象者の生年月日を用いて日付に変換すべきである。
- NEW: 日付は一部のみの記載でも許容される。ただし、対象者が1歳未満の場合、正確な年齢を算出（例：意思決定支援に利用する場合など）するためには、完全な日付、あるいは少なくとも「年月」の情報が必要となる。「臨床的に認識された時点の年齢」として記録または取り込まれたデータは、対象者の生年月日を用いて日付に変換する必要がある。

### term/at0005/description
- EN : An assessment of the overall severity of the problem or diagnosis.
- OLD: 問題または診断の全体的な重症度の評価。
- NEW: プロブレムまたは診断の全体的な重症度の評価。

### term/at0005/comment
- EN : If severity is included in the Problem/diagnosis name via precoordinated codes, this data element becomes redundant. Note: more specific grading of severity can be recorded using the Specific details SLOT.
- OLD: 重症度が事前調整されたコードによって問題/診断名に含まれている場合、このデータ要素は冗長になる。注：より具体的な重症度の段階付けは、「具体的な詳細」スロットを用いて記録できる。
- NEW: 事前調整コード（precoordinated codes）によってプロブレムや診断の名称に重症度が含まれている場合、このデータエレメントは冗長となる。注：「Specific details（詳細情報）」slotを使用することで、より詳細な重症度分類を記録することが可能である。

### term/at0009/comment
- EN : Use to provide background and context, including evolution, episodes or exacerbations, progress and any other relevant details, about the problem or diagnosis.
- OLD: 問題または診断について、推移、エピソードや増悪、経過、その他の関連する詳細を含む背景と文脈を示すために用いる。
- NEW: プロブレムや診断に関する背景や状況（経過、エピソードや症状の増悪、進展状況、その他関連する詳細など）を説明する際に使用する。

### term/at0012/description
- EN : Identification of a simple body site for the location of the problem or diagnosis.
- OLD: 問題または診断の位置を示す、単純な身体部位の特定。
- NEW: 単純に表現できるプロブレムや診断の部位と特定された身体部位。

### term/at0012/comment
- EN : Coding of the name of the anatomical location with a terminology is preferred, where possible.\nUse this data element to record precoordinated anatomical locations. If the requirements for recording the anatomical location are determined at run-time by the application or require more complex modelling such as relative locations then use the CLUSTER.anatomical_location or CLUSTER.relative_location within the 'Structured anatomical location' SLOT in this archetype. Occurrences for this data element are unbounded to allow for clinical scenarios such as describing a rash in multiple locations but where all of the other attributes are identical. If the anatomical location is included in the Problem/diagnosis name via precoordinated codes, this data element becomes redundant.
- OLD: 可能であれば、解剖学的部位の名称は用語集によりコード化することが望ましい。\n事前調整された解剖学的部位を記録するには、このデータ要素を用いる。解剖学的部位の記録要件がアプリケーションによって実行時に決定される場合、または相対的な位置などのより複雑なモデル化が必要な場合は、本アーキタイプの「構造化身体部位」スロット内で CLUSTER.anatomical_location または CLUSTER.relative_location を用いること。このデータ要素の出現回数は無制限であり、複数の部位にある発疹を記述するが他の属性はすべて同一であるといった臨床シナリオに対応できる。解剖学的部位が事前調整されたコードによって問題/診断名に含まれている場合、このデータ要素は冗長になる。
- NEW: 可能な限り、解剖学的部位の名称をTerminologyを用いてコード化することが推奨される。\n\n事前に調整された（プリコーディネートされた）解剖学的部位を記録する際には、このデータ要素を使用する。解剖学的部位の記録要件が実行時にアプリケーションによって決定される場合や、相対的な位置関係などより複雑なモデリングが必要な場合は、このアーキタイプ内の「Structured anatomical location（構造化された解剖学的部位）」スロットにある CLUSTER.anatomical_location または CLUSTER.relative_location を使用すること。このデータ要素のCardinalityは無制限とされており、複数の部位に発疹があるものの、それ以外の属性がすべて同一であるといった臨床シナリオにも対応可能である。もし解剖学的部位が、事前調整されたコードによって「プロブレム・診断名」に含まれている場合、このデータ要素は冗長となる。

### term/at0030/text
- EN : Date/time of resolution
- OLD: 解消日時
- NEW: 治癒した日時

### term/at0030/description
- EN : Estimated or actual date/time of resolution or remission for this problem or diagnosis, as determined by a healthcare professional.
- OLD: 医療従事者が判断した、この問題または診断の解消または寛解の、推定または実際の日時。
- NEW: 医療従事者が判断した、当該プロブレムまたは診断の軽快、治癒または寛解した実際の日時あるいはそう推定された日時。

### term/at0030/comment
- EN : Partial dates are acceptable. If the subject of care is under the age of one year, then the complete date or a minimum of the month and year is necessary to enable accurate age calculations - for example, if used to drive decision support. Data captured/imported as \"Age at time of resolution\" should be converted to a date using the subject's date of birth.\n
- OLD: 部分的な日付も許容される。ケア対象者が1歳未満の場合、正確な年齢計算（例えば意思決定支援に用いる場合）を可能にするため、完全な日付、または少なくとも月と年が必要である。「解消時の年齢」として取得／取り込まれたデータは、ケア対象者の生年月日を用いて日付に変換すべきである。\n
- NEW: 日付の一部のみの入力も許容される。ただし、ケアの対象者が1歳未満の場合、正確な年齢計算（意思決定支援に利用する場合など）を行うためには、完全な日付、あるいは少なくとも「年月」の情報が必要となる。「治癒時の年齢（Age at time of resolution）」として記録または取り込まれたデータは、対象者の生年月日を用いて日付に変換する必要がある。

### term/at0039/text
- EN : Structured body site
- OLD: 構造化身体部位
- NEW: 構造化された身体部位表現

### term/at0039/description
- EN : A structured anatomical location for the problem or diagnosis.
- OLD: 問題または診断の、構造化された解剖学的部位。
- NEW: プロブレム・診断名に対する構造化された解剖学的部位表現。

### term/at0039/comment
- EN : Use this SLOT to insert the CLUSTER.anatomical_location or CLUSTER.relative_location archetypes if the requirements for recording the anatomical location are determined at run-time by the application or require more complex modelling such as relative locations.\n\nIf the anatomical location is included in the Problem/diagnosis name via precoordinated codes, use of this SLOT becomes redundant.
- OLD: 解剖学的部位の記録要件がアプリケーションによって実行時に決定される場合、または相対的な位置などのより複雑なモデル化が必要な場合は、このスロットを用いて CLUSTER.anatomical_location または CLUSTER.relative_location アーキタイプを挿入する。\n\n解剖学的部位が事前調整されたコードによって問題/診断名に含まれている場合、このスロットの使用は冗長になる。
- NEW: 解剖学的部位の記録要件が実行時にアプリケーションによって決定される場合や、相対的な位置関係などより複雑なモデリングが必要な場合は、このスロットを使用して CLUSTER.anatomical_location または CLUSTER.relative_location archetypeを使用すること。\n\n解剖学的部位が「プロブレム・診断」の名称に（事前調整されたコードによって）含まれている場合、このスロットを使用する必要はない。

### term/at0043/text
- EN : Specific details
- OLD: 具体的な詳細
- NEW: 詳細記録

### term/at0043/description
- EN : Details that are additionally required to record as unique attributes of this problem or diagnosis.
- OLD: この問題または診断に固有の属性として、追加で記録する必要がある詳細。
- NEW: このプロブレムや診断の固有の属性として、追加で記録する必要がある詳細情報。

### term/at0043/comment
- EN : May include structured detail about the grading or staging of the diagnosis; diagnostic criteria, classification criteria or formal severity assessments such as Common Terminology Criteria for Adverse Events.
- OLD: 診断の段階付けや病期分類についての構造化された詳細、診断基準、分類基準、または有害事象共通用語規準（CTCAE）などの正式な重症度評価を含めてよい。
- NEW: 診断のグレードや病期分類に関する構造化された詳細情報（診断基準、分類基準、あるいは「有害事象共通用語規準（CTCAE）」などの公式な重症度評価など）が含まれる場合がある。

### term/at0046/description
- EN : Structured details for location-, domain-, episode- or workflow-specific aspects of the diagnostic process.
- OLD: 診断プロセスの、場所、領域、エピソード、またはワークフローに固有の側面についての構造化された詳細。
- NEW: 診断プロセスのうち、場所、領域、エピソード、またはワークフローに固有の側面に関する構造化された詳細情報。

### term/at0046/comment
- EN : Use status or context qualifiers with care, as they are variably used in practice and interoperability cannot be assured unless usage is clearly defined with the community of use. For example: active status - active, inactive, resolved, in remission; evolution status - initial, interim/working, final; temporal status - current, past; episodicity status - first, new, ongoing; admission status - admission, discharge; or priority status - primary, secondary.
- OLD: 状態や文脈の修飾子は、実際にはさまざまに使われており、利用コミュニティ内で使い方が明確に定義されない限り相互運用性を保証できないため、注意して用いること。例：活動状態 - 活動性、非活動性、解消、寛解中；推移状態 - 初期、暫定/作業、最終；時間的状態 - 現在、過去；エピソード状態 - 初回、新規、継続中；入退院状態 - 入院時、退院時；優先度状態 - 主、副。
- NEW: 状態やコンテキストに関する修飾語の使用には注意が必要である。これらは実際の運用において様々な形で使われており、利用コミュニティ内でその用法が明確に定義されない限り、相互運用性を保証できないためである。例として、状態（active、inactive、resolved、in remission）、進捗状況（initial、interim/working、final）、時間的区分（current、past）、エピソード区分（first、new、ongoing）、入退院状況（admission、discharge）、優先度（primary、secondary）などが挙げられる。

### term/at0047/text
- EN : Mild
- OLD: 軽度
- NEW: 軽症

### term/at0047/description
- EN : The problem or diagnosis does not interfere with normal activity or may cause damage to health if left untreated.
- OLD: 問題または診断は通常の活動を妨げないが、未治療のままにすると健康に害を及ぼすことがある。
- NEW: そのプロブレムや診断は通常の活動を妨げるものではないが、未治療のまま放置すると健康を損なう恐れがある。

### term/at0048/text
- EN : Moderate
- OLD: 中等度
- NEW: 中等症

### term/at0048/description
- EN : The problem or diagnosis causes interference with normal activity or will damage health if left untreated.
- OLD: 問題または診断は通常の活動を妨げ、未治療のままにすると健康に害を及ぼす。
- NEW: プロブレムや診断された疾患は、通常の活動に支障をきたすか、あるいは放置すれば健康を損なう恐れがある。

### term/at0049/text
- EN : Severe
- OLD: 重度
- NEW: 重症

### term/at0049/description
- EN : The problem or diagnosis prevents normal activity or will seriously damage health if left untreated.
- OLD: 問題または診断は通常の活動を不可能にし、未治療のままにすると健康に重大な害を及ぼす。
- NEW: そのプロブレムや診断された疾患は、通常の活動を妨げるもの、あるいは放置すれば健康に深刻な悪影響を及ぼすものである。

### term/at0069/description
- EN : Additional narrative about the problem or diagnosis not captured in other fields.
- OLD: 他の項目では捉えられない、問題または診断についての追加の叙述。
- NEW: 他の項目には含まれていない、プロブレムや診断に関する追加の記述。

### term/at0070/description
- EN : The date this problem or diagnosis was last updated.
- OLD: この問題または診断が最後に更新された日付。
- NEW: プロブレムや診断が更新された最終日。

### term/at0071/description
- EN : Additional information required to capture local content or to align with other reference models/formalisms.
- OLD: ローカルな内容を取り込むため、または他の参照モデル／形式体系と整合させるために必要な追加情報。
- NEW: ローカルコンテンツを捕捉するため、あるいは他の参照モデルや形式手法と整合させるために必要な追加情報。

### term/at0071/comment
- EN : For example: local information requirements or additional metadata to align with FHIR or CIMI equivalents.
- OLD: 例：ローカルな情報要件や、FHIR または CIMI の等価物と整合させるための追加メタデータ。
- NEW: 例：ローカルな情報要件や、FHIRまたはCIMIの相当するものに適合させるための追加メタデータなど。

### term/at0072/text
- EN : Course description
- OLD: 経過の説明
- NEW: 経過記載

### term/at0073/text
- EN : Diagnostic certainty
- OLD: 診断の確からしさ
- NEW: 診断確度

### term/at0073/description
- EN : The level of confidence in the identification of the diagnosis.
- OLD: 診断の特定における確信の水準。
- NEW: 診断の確定度。

### term/at0073/comment
- EN : If an alternative valueset is required, these values can be added to the DV_TEXT data type in a template.
- OLD: 別の値セットが必要な場合は、テンプレートで DV_TEXT データ型にそれらの値を追加できる。
- NEW: 代替の値セットが必要な場合は、テンプレート内の DV_TEXT データ型にこれらの値を追加できる。

### term/at0074/description
- EN : The diagnosis has been identified with a low level of certainty.
- OLD: 診断は低い水準の確信で特定されている。
- NEW: 確度の低い診断。

### term/at0075/text
- EN : Probable
- OLD: ほぼ確実
- NEW: 推定

### term/at0075/description
- EN : The diagnosis has been identified with a high level of certainty.
- OLD: 診断は高い水準の確信で特定されている。
- NEW: 確度が高いが確定にまでは至らない診断

### term/at0076/description
- EN : The diagnosis has been confirmed against recognised criteria.
- OLD: 診断は認められた基準に照らして確認されている。
- NEW: 認められた基準に基づいて確定された診断。

### term/at0077/description
- EN : Estimated or actual date/time that signs or symptoms of the problem/diagnosis were first observed.
- OLD: 問題/診断の徴候または症状が最初に観察された、推定または実際の日時。
- NEW: プロブレムや診断に関する徴候や症状が最初に認められた実際の日時、あるいは推定される日時。

### term/at0077/comment
- EN : Data captured/imported as \"Age at onset\" should be converted to a date using the subject's date of birth.
- OLD: 「発症時の年齢」として取得／取り込まれたデータは、ケア対象者の生年月日を用いて日付に変換すべきである。
- NEW: 「発症時年齢」として取得または取り込まれたデータは、対象者の生年月日を用いて日付に変換する必要がある。

### term/at0078/description
- EN : A cause, set of causes, or manner of causation of the problem or diagnosis.
- OLD: 問題または診断の原因、一連の原因、または発生機序。
- NEW: プロブレムや診断名の原因、一連の原因またはその発生様式。

### term/at0078/comment
- EN : Also known as 'aetiology' or 'etiology'. Coding with an external terminology is preferred, where possible.
- OLD: 「病因（aetiology / etiology）」とも呼ばれる。可能であれば、外部用語集によりコード化することが望ましい。
- NEW: 「病因あるいは病因論（aetiology / etiology）」とも呼ばれる。可能であれば、外部用語集によりコード化することが望ましい。

### term/at0079/description
- EN : Specific variant or subtype of the Diagnosis, if relevant.
- OLD: 該当する場合、診断の特定の亜型またはサブタイプ。
- NEW: （該当する場合）診断の特定の亜型やサブタイプ。

### term/at0079/comment
- EN : For example: 'acute motor axonal neuropathy' as a variant of Guillain-Barre Syndrome. Coding of the name of the variant with a terminology is preferred, where possible.
- OLD: 例：ギラン・バレー症候群の亜型としての「急性運動性軸索型ニューロパチー」。可能であれば、亜型の名称は用語集によりコード化することが望ましい。
- NEW: 例：ギラン・バレー症候群の亜型である「急性運動性軸索型神経障害（acute motor axonal neuropathy）」。可能な限り、Terminologyを用いて亜型の名称をコーディングすることが推奨される。

### term/at0080/description
- EN : Overall assessment of the impact of a health problem for the specific patient.
- OLD: 特定の患者にとっての、健康上の問題の影響の全体的な評価。
- NEW: 特定の患者における健康上のプロブレムの影響に関する総合的な評価。

### term/at0080/comment
- EN : The same diagnosis, with the same severity, has a different impact on each patient. This relevance qualifier implies adjusting the overall impact of that health problem according to the patient's characteristics.\nFor example: Two patients have the same diagnosis. First-degree burn.\nOne is a healthy person, the other is a diabetic patient.\nThe impact for that problem in a diabetic patient is HIGHER (more risk of infection..., longuer time healing).\nThis element is meant to allow for multiple types of impact, including but not limited to: clinical treatment, home functioning, work life.
- OLD: 同じ診断で同じ重症度であっても、患者ごとに影響は異なる。この関連性修飾子は、患者の特性に応じてその健康上の問題の全体的な影響を調整することを意味する。\n例：2人の患者が同じ診断を受けている。第1度熱傷。\n一方は健康な人で、もう一方は糖尿病患者である。\n糖尿病患者におけるその問題の影響はより大きい（感染のリスクが高い…、治癒に時間がかかる）。\nこの要素は、臨床的治療、家庭での機能、職業生活などを含むがこれらに限らない、複数の種類の影響を扱えることを意図している。
- NEW: 同じ診断名で同じ重症度であっても、患者一人ひとりへの影響は異なる。この「関連修飾子（relevance qualifier）」は、患者の特性に応じて、その健康上のプロブレムが及ぼす全体的な影響を調整することを意味する。\n例えば、同じ診断（例：I度熱傷）を受けた2人の患者がいる。\n一方は健康な人、もう一方は糖尿病患者とする。\n糖尿病患者の場合、その健康上のプロブレムが及ぼす影響はより大きくなる（感染リスクの高さや、治癒までの期間の長さなど）。\nこの要素は、臨床的な治療、家庭生活における機能、職業生活など、多岐にわたる影響を考慮に入れることを意図している。

## openEHR-EHR-EVALUATION.reason_for_encounter.v1 — problem_diagnosis.v1 校正の取り込みと「プロブレム」への用語統一（2026-09-10）

### description/-/use
- EN : Use to record the reason, or reasons, for initiation of any type of healthcare encounter or contact between a healthcare provider and the individual who is the subject of care. The reason may be for clinical, social or administrative purposes.\n\nReason for Encounter is a common phrase used in clinical medicine, however the term is often used in two common ways - one that refers to an administrative category for provision of healthcare and the other that reflects clinical or social problems that motivate individuals to seek healthcare.\n\nIn an effort to clarify the phrases and intent, this archetype contains two data elements:\n- The first, 'Contact type', to document the administrative type of healthcare sought or required - for example the type of consultation, emergency care, pre-operative assessment, routine antenatal visit or elective admission. This data element reflects the administrative category of care provision. Use of the phrase 'Contact type', rather than 'Reason for encounter' or 'Reason for visit' reflects the increasing trend towards alternative methods of healthcare provision that may not result in face-to-face contact between the healthcare provider and patient within a consulting room.\n- The second, 'Presenting problem', to document the clinical reasons for healthcare contact. Chief complaint is regarded as a synonym for 'Presenting problem'. These are intended mainly to capture the patient's perceived issues or symptoms which have triggered them to seek healthcare advice, such as desire to quit smoking, stress, shortness of breath, genetic counselling or abdominal pain. Signs such as impaired conscious state may also be captured here, for example by paramedical staff with an unconscious patient.
- OLD: 医療従事者とケア対象者との間で、あらゆる種類の診察または受診が開始された理由（複数の場合もある）を記録するために用いる。理由は臨床的、社会的、または管理的な目的のいずれでもよい。\n\n「受診理由（Reason for encounter）」は臨床医学で広く使われる語句であるが、この語は一般に2つの意味で使われている。一つは医療提供の管理上の区分を指すもの、もう一つは人が医療を求める動機となる臨床的または社会的な問題を指すものである。\n\nこの語句と意図を明確にするため、本アーキタイプは2つのデータ要素を含む：\n- 一つ目の「受診区分」は、求められている、または必要とされている医療の管理上の種別を記録するためのものである。例えば、コンサルテーションの種類、救急診療、術前評価、定期の妊婦健診、予定入院などである。このデータ要素は医療提供の管理上の区分を反映する。「受診理由」や「来院理由」ではなく「受診区分（Contact type）」という語句を用いているのは、診察室で医療従事者と患者が対面しない形態の医療提供が増えている傾向を反映したものである。\n- 二つ目の「受診時の問題」は、受診の臨床的な理由を記録するためのものである。「主訴」は「受診時の問題」の同義語とみなされる。これらは主に、患者が医療の助言を求めるきっかけとなった、患者自身が認識している問題や症状を捉えることを意図している。例えば、禁煙の希望、ストレス、息切れ、遺伝カウンセリング、腹痛などである。意識障害などの徴候もここに記録してよい。例えば、意識のない患者に対応する救急救命士による記録などである。
- NEW: 医療従事者とケア対象者との間で、あらゆる種類の診察または受診が開始された理由（複数の場合もある）を記録するために用いる。理由は臨床的、社会的、または管理的な目的のいずれでもよい。\n\n「受診理由（Reason for encounter）」は臨床医学で広く使われる語句であるが、この語は一般に2つの意味で使われている。一つは医療提供の管理上の区分を指すもの、もう一つは人が医療を求める動機となる臨床的または社会的なプロブレムを指すものである。\n\nこの語句と意図を明確にするため、本アーキタイプは2つのデータ要素を含む：\n- 一つ目の「受診区分」は、求められている、または必要とされている医療の管理上の種別を記録するためのものである。例えば、コンサルテーションの種類、救急診療、術前評価、定期の妊婦健診、予定入院などである。このデータ要素は医療提供の管理上の区分を反映する。「受診理由」や「来院理由」ではなく「受診区分（Contact type）」という語句を用いているのは、診察室で医療従事者と患者が対面しない形態の医療提供が増えている傾向を反映したものである。\n- 二つ目の「受診時のプロブレム」は、受診の臨床的な理由を記録するためのものである。「主訴」は「受診時のプロブレム」の同義語とみなされる。これらは主に、患者が医療の助言を求めるきっかけとなった、患者自身が認識しているプロブレムや症状を捉えることを意図している。例えば、禁煙の希望、ストレス、息切れ、遺伝カウンセリング、腹痛などである。意識障害などの徴候もここに記録してよい。例えば、意識のない患者に対応する救急救命士による記録などである。

### description/-/keywords
- EN : presentation | presenting complaint | reason for encounter | reason | chief complaint | visit | reason for visit
- OLD: 受診理由 | 来院理由 | 主訴 | 受診時の問題 | 受診区分 | 理由 | 受診
- NEW: 受診理由 | 来院理由 | 主訴 | 受診時のプロブレム | 受診区分 | 理由 | 受診

### term/at0004/text
- EN : Presenting problem
- OLD: 受診時の問題
- NEW: 受診時のプロブレム

### term/at0004/description
- EN : Identification of the clinical or social problem motivating the subject of care to seeking healthcare.
- OLD: ケア対象者が医療を求める動機となっている臨床的または社会的な問題の特定。
- NEW: ケア対象者が医療を求める動機となっている臨床的または社会的なプロブレムの特定。

### term/at0004/comment
- EN : Coding of the 'Presenting problem' with a terminology is desirable, where possible. Clinical or social reasons for seeking healthcare can include health issues, symptoms or physical signs. Examples: health issues - desire to quit smoking, domestic violence; symptoms - abdominal pain, shortness of breath; physical signs - an altered conscious state. 'Chief complaint' may be used as a valid synonym for 'Presenting problem' in templates.\n 
- OLD: 可能であれば「受診時の問題」は用語集によりコード化することが望ましい。医療を求める臨床的または社会的な理由には、健康上の問題、症状、身体的徴候が含まれうる。例：健康上の問題 - 禁煙の希望、家庭内暴力；症状 - 腹痛、息切れ；身体的徴候 - 意識状態の変化。テンプレートでは「主訴」を「受診時の問題」の同義語として用いてよい。\n 
- NEW: 可能であれば「受診時のプロブレム」は用語集によりコード化することが望ましい。医療を求める臨床的または社会的な理由には、健康上の問題、症状、身体的徴候が含まれうる。例：健康上の問題 - 禁煙の希望、家庭内暴力；症状 - 腹痛、息切れ；身体的徴候 - 意識状態の変化。テンプレートでは「主訴」を「受診時のプロブレム」の同義語として用いてよい。\n 

## openEHR-EHR-INSTRUCTION.service_request.v1 — problem_diagnosis.v1 校正の取り込みと「プロブレム」への用語統一（2026-09-10）

### description/-/use
- EN : Use to record a request for a health-related service or activity to be delivered by a clinician, organisation or agency.\n\nThis archetype has been designed as a framework that can be used as the basis for:\n- a request from one clinician, organisation or agency to another clinician, organisation or agency for a health-related service. For example: a referral to a specialist clinician for treatment or a second clinical opinion; transfer of care to an emergency department; four hourly vital signs monitoring; and provision of home services from a municipal council; or\n- a request for a follow up service to be scheduled for the same clinician, organisation or agency. For example: a review appointment in outpatients in 6 weeks. \n\nClinical use cases:\n- consider a clinician ordering a follow-up appointment in 6 weeks. 'Follow-up appointment' will be the 'Service name'. If they enter '6 weeks' as the proposed timing for the appointment in the User Interface, the clinical system will record the date six weeks from today in the 'Service due' data element.\n- consider a clinician ordering Diabetes Education as the 'Service name'. The values for 'Reason for request' may be 'New diagnosis' and 'Prevention of ketoacidosis'. The 'Clinical indication' will be 'Diabetes Type 1', which may be linked to the Problem Diagnosis and/or Laboratory test results. If a 4 week course is required, with sessions organised at weekly intervals on 4 separate occasions, then the complex timing requires use of the CLUSTER.service_direction and associated CLUSTER.timing_nondaily archetype.\n- consider a clinician ordering a recurring blood test, such as an INR. The complex timing for this requires use of the CLUSTER.service_direction and associated CLUSTER.timing_nondaily archetype to define each timing in a sequence of tests, such as 'daily for one week, weekly for 4 weeks, monthly for 6 months'.\n\nThe default assumption for this archetype is that it's a request for a single service. If a series of services are required, use the CLUSTER.service_direction archetype within the 'Complex timing' SLOT.\n\nIn many situations it will be possible to record the steps that occur as part of this request being carried out using the corresponding generic ACTION.service. However, there will be many occasions where the required ACTION archetype will be very specific for purpose, as the data requirements for recording provision of many health-related services will need quite unique data elements, recording patterns or pathway steps. For example: ACTION.screening or ACTION.health_education.
- OLD: 医療従事者、医療機関、または事業者が提供する保健医療関連のサービスや活動の依頼を記録するために用いる。\n\n本アーキタイプは、以下の基盤として使える枠組みとして設計されている：\n- ある医療従事者・医療機関・事業者から別の医療従事者・医療機関・事業者への、保健医療関連サービスの依頼。例：治療またはセカンドオピニオンを求める専門医への紹介；救急部門への診療の移管；4時間ごとのバイタルサイン測定；市町村による在宅サービスの提供。または\n- 同じ医療従事者・医療機関・事業者に対して予約されるフォローアップサービスの依頼。例：6週間後の外来再診。\n\n臨床でのユースケース：\n- 医療従事者が6週間後のフォローアップ受診をオーダーする場合を考える。「フォローアップ受診」が「サービス名」になる。ユーザーインターフェースで受診の希望時期として「6週間」を入力すると、臨床システムは本日から6週間後の日付を「サービス実施予定」データ要素に記録する。\n- 医療従事者が「サービス名」として糖尿病教育をオーダーする場合を考える。「依頼理由」の値は「新規診断」や「ケトアシドーシスの予防」となりうる。「臨床的適応」は「1型糖尿病」となり、問題・診断や臨床検査結果にリンクされることもある。週1回の間隔で4回に分けたセッションからなる4週間のコースが必要な場合、その複雑なタイミングには CLUSTER.service_direction と、それに関連する CLUSTER.timing_nondaily アーキタイプを用いる必要がある。\n- 医療従事者が INR のような反復する血液検査をオーダーする場合を考える。この複雑なタイミングには、「1週間は毎日、4週間は毎週、6か月間は毎月」のような一連の検査の各タイミングを定義するために、CLUSTER.service_direction と、それに関連する CLUSTER.timing_nondaily アーキタイプを用いる必要がある。\n\n本アーキタイプは、単一のサービスの依頼であることを既定の前提としている。一連のサービスが必要な場合は、「複雑なタイミング」SLOT 内で CLUSTER.service_direction アーキタイプを用いる。\n\n多くの状況では、この依頼が実施される過程で生じる各ステップを、対応する汎用の ACTION.service を用いて記録できる。しかし、多くの保健医療関連サービスの提供を記録するには、かなり固有のデータ要素、記録パターン、またはパスウェイのステップが必要になるため、必要な ACTION アーキタイプが目的に非常に特化したものになる場合も多い。例：ACTION.screening や ACTION.health_education。
- NEW: 医療従事者、医療機関、または事業者が提供する保健医療関連のサービスや活動の依頼を記録するために用いる。\n\n本アーキタイプは、以下の基盤として使える枠組みとして設計されている：\n- ある医療従事者・医療機関・事業者から別の医療従事者・医療機関・事業者への、保健医療関連サービスの依頼。例：治療またはセカンドオピニオンを求める専門医への紹介；救急部門への診療の移管；4時間ごとのバイタルサイン測定；市町村による在宅サービスの提供。または\n- 同じ医療従事者・医療機関・事業者に対して予約されるフォローアップサービスの依頼。例：6週間後の外来再診。\n\n臨床でのユースケース：\n- 医療従事者が6週間後のフォローアップ受診をオーダーする場合を考える。「フォローアップ受診」が「サービス名」になる。ユーザーインターフェースで受診の希望時期として「6週間」を入力すると、臨床システムは本日から6週間後の日付を「サービス実施予定」データ要素に記録する。\n- 医療従事者が「サービス名」として糖尿病教育をオーダーする場合を考える。「依頼理由」の値は「新規診断」や「ケトアシドーシスの予防」となりうる。「臨床的適応」は「1型糖尿病」となり、プロブレム・診断や臨床検査結果にリンクされることもある。週1回の間隔で4回に分けたセッションからなる4週間のコースが必要な場合、その複雑なタイミングには CLUSTER.service_direction と、それに関連する CLUSTER.timing_nondaily アーキタイプを用いる必要がある。\n- 医療従事者が INR のような反復する血液検査をオーダーする場合を考える。この複雑なタイミングには、「1週間は毎日、4週間は毎週、6か月間は毎月」のような一連の検査の各タイミングを定義するために、CLUSTER.service_direction と、それに関連する CLUSTER.timing_nondaily アーキタイプを用いる必要がある。\n\n本アーキタイプは、単一のサービスの依頼であることを既定の前提としている。一連のサービスが必要な場合は、「複雑なタイミング」SLOT 内で CLUSTER.service_direction アーキタイプを用いる。\n\n多くの状況では、この依頼が実施される過程で生じる各ステップを、対応する汎用の ACTION.service を用いて記録できる。しかし、多くの保健医療関連サービスの提供を記録するには、かなり固有のデータ要素、記録パターン、またはパスウェイのステップが必要になるため、必要な ACTION アーキタイプが目的に非常に特化したものになる場合も多い。例：ACTION.screening や ACTION.health_education。

## openEHR-EHR-CLUSTER.problem_qualifier.v2 — problem_qualifier.v2 校正の取り込み（アクティブ/インアクティブ、現症/既往、主病名/副病名 ほか）（2026-09-11）

### description/-/use
- EN : Use to record a relevant context-specific or time-specific qualifier that provides additional detail which is relevant at the time of recording or within the clinical context where a problem or diagnosis is recorded. The qualifier may not be appropriate at another time or in another clinical context. \n\nThis archetype is designed to be included in Status SLOT in the EVALUATION.problem_diagnosis archetype. The intent is for the EVALUATION.problem_diagnosis archetype to hold all of the information that applies in all contexts, in contrast to this archetype describing only information that depends on the context of use.\n\nIMPORTANT NOTES FOR IMPLEMENTATION: \n- It is not intended or implied that any or all of these qualifiers should be used within the same context or period of time. In contrast to the usual design of archetypes, this archetype has been deliberately designed to collect a number of common qualifiers into one place in an effort to attempt some simple standardisation within a very messy area of clinical practice. It is acknowledged that the data elements contained in this archetype embrace many different, and sometimes even competing, concepts. This has been done mainly to prevent the need for multiple qualifier archetypes, each containing only one or two data elements. \n- Some of these data elements are potentially directly conflicting if used simultaneously within the same context, for example it would not make sense to have an 'inactive' problem together with an Episode that is 'ongoing'. As such, these status qualifiers should be used with extreme care as they are variably applied in practice and interoperability cannot be assured unless usage guidelines are clearly defined within the clinical community in which the 'Problem/Diagnosis' and 'Problem/Diagnosis qualifier' archetype pair may be shared. \n\nFull DRG coding will require the DRG-related data elements from this archetype in combination with data elements from other archetypes.
- OLD: 記録時点、またはプロブレムや診断が記録される臨床的な文脈において意味を持つ追加の詳細を提供する、文脈固有または時点固有の修飾子を記録するために用いる。その修飾子は、別の時点や別の臨床的な文脈では適切でないことがある。 \n\n本archetypeは、EVALUATION.problem_diagnosis archetypeの「状態」SLOT に含めて使うよう設計されている。EVALUATION.problem_diagnosis archetypeがあらゆる文脈で当てはまる情報をすべて保持するのに対し、本archetypeは使用文脈に依存する情報だけを記述する、という意図である。\n\n実装上の重要な注意： \n- これらの修飾子のいずれか、またはすべてを同じ文脈や同じ期間の中で使うことを意図したり示唆したりするものではない。通常のarchetype設計とは対照的に、本archetypeは、臨床実践の中でも非常に混沌とした領域にいくらかの単純な標準化を試みるため、よく使われる多数の修飾子を意図的に一か所に集めて設計されている。本archetypeに含まれるデータ要素が、多くの異なる、ときには互いに競合する概念を包含していることは認識している。これは主に、データ要素を1つか2つしか持たない修飾子archetypeが多数必要になるのを避けるためである。 \n- これらのデータ要素の一部は、同じ文脈の中で同時に使うと直接矛盾する可能性がある。例えば、「非活動性」のプロブレムに「継続中」のエピソードが同時に付くのは意味をなさない。したがって、これらの状態修飾子は実践の中でさまざまに適用されており、「プロブレム・診断」と「プロブレム・診断の修飾子」のarchetypeの組を共有しうる臨床コミュニティの中で使用指針が明確に定義されない限り相互運用性は保証できないため、細心の注意を払って使うこと。 \n\nDRG コーディングを完全に行うには、本archetypeの DRG 関連データ要素を他のarchetypeのデータ要素と組み合わせる必要がある。
- NEW: 記録時点、またはプロブレムや診断が記録される臨床的な文脈において追加の意味を持つ詳細情報を提供するために、固有の文脈や固有の時点への修飾子を記録する。その修飾子は、別の時点や別の臨床的な文脈では適切でないことがある。 \n\n本archetypeは、EVALUATION.problem_diagnosis archetypeの「状態」SLOT に含めて使うよう設計されている。EVALUATION.problem_diagnosis archetypeがあらゆる文脈で当てはまる情報をすべて保持するのに対し、本archetypeは使用文脈に依存する情報だけを記述する、という意図である。\n\n実装上の重要な注意： \n- これらの修飾子のいずれか、またはすべてを同じ文脈や同じ期間の中で使うことを意図したり示唆したりするものではない。通常のarchetype設計とは対照的に、本archetypeは、臨床実践の中でも非常に混沌とした領域にいくらかの単純な標準化を試みるため、よく使われる多数の修飾子を意図的に一か所に集めて設計されている。本archetypeに含まれるデータ要素が、多くの異なる、ときには互いに競合する概念を包含していることは認識している。これは主に、データ要素を1つか2つしか持たない修飾子archetypeが多数必要になるのを避けるためである。 \n- これらのデータ要素の一部は、同じ文脈の中で同時に使うと直接矛盾する可能性がある。例えば、「インアクティブ」のプロブレムに「継続中」のエピソードが同時に付くのは意味をなさない。したがって、これらの状態修飾子は実践の中でさまざまに適用されており、「プロブレム・診断」と「プロブレム・診断の修飾子」のarchetypeの組を共有しうる臨床コミュニティの中で使用指針が明確に定義されない限り相互運用性は保証できないため、細心の注意を払って使うこと。 \n\nDRG コーディングを完全に行うには、本archetypeの DRG 関連データ要素を他のarchetypeのデータ要素と組み合わせる必要がある。

### description/-/misuse
- EN : Not to be used to represent a differential diagnosis - use the archetype EVALUATION.differential_diagnosis for this purpose.\n\nNot to be used to represent diagnostic certainty - use the 'Diagnostic certainty' data element within the EVALUATION.problem_diagnosis archetype.
- OLD: 鑑別診断を表すために用いてはならない。その目的には EVALUATION.differential_diagnosis archetypeを用いること。\n\n診断確度を表すために用いてはならない。EVALUATION.problem_diagnosis archetype内の「診断確度」データ要素を用いること。
- NEW: 鑑別診断を表すために用いてはならない。その目的には EVALUATION.differential_diagnosis archetypeを用いること。\n\n診断確度を表すために用いてはならない。EVALUATION.problem_diagnosis archetype内の「診断確度」データエレメントを用いること。

### description/-/keywords
- EN : problem | active | inactive | status | episode | diagnosis
- OLD: プロブレム | 活動性 | 非活動性 | 状態 | エピソード | 診断 | 修飾子 | 病名
- NEW: プロブレム | アクティブ | インアクティブ | 状態 | エピソード | 診断 | 修飾子 | 病名

### term/at0001/description
- EN : Category of this episode for the identified problem/diagnosis.
- OLD: 特定されたプロブレム・診断における、このエピソードの区分。
- NEW: 特定のプロブレム・診断における、このエピソードの区分。

### term/at0003/text
- EN : Active/Inactive?
- OLD: 活動性/非活動性？
- NEW: アクティブ/インアクティブ？

### term/at0003/description
- EN : Category that supports division of problems and diagnoses into Active or Inactive problem lists.
- OLD: プロブレムと診断を「活動性」と「非活動性」のプロブレムリストに分けることを支援する区分。
- NEW: プロブレムと診断を「アクティブ」と「インアクティブ」のプロブレムリストに分けることを支援する区分。

### term/at0003/comment
- EN : The Active/Inactive and Current/Past data elements have similar clinical impact but represent slightly different semantics. Both are actively used in different clinical settings, but usually not together. If a Current/Past qualifier is recorded, then this data element is likely to be redundant. An exception where a condition can be current but inactive is asthma that is not causing acute symptoms.
- OLD: 「活動性/非活動性」と「現在/過去」のデータ要素は、臨床的な影響は似ているが意味がわずかに異なる。どちらも異なる臨床現場で実際に使われているが、通常は一緒には使われない。「現在/過去」の修飾子が記録されている場合、このデータ要素は冗長になる可能性が高い。現在ではあるが非活動性という例外として、急性症状を起こしていない喘息がある。
- NEW: 「アクティブ/インアクティブ」と「現症/既往」のデータ要素は、臨床的な影響は似ているが意味がわずかに異なる。どちらも異なる臨床現場で実際に使われているが、通常は一緒には使われない。「現症/既往」の修飾子が記録されている場合、このデータ要素は冗長になる可能性が高い。現症ではあるがインアクティブという例外として、急性症状を起こしていない喘息がある。

### term/at0004/text
- EN : Diagnostic status
- OLD: 診断の段階
- NEW: 診断状況

### term/at0004/comment
- EN : The status is usually determined by a combination of the timing of diagnosis plus level of clinical certainty resulting from diagnostic tests and clinical evidence available. This data element and 'Diagnostic certainty' in EVALUATION.problem_diagnosis are two important axes of the diagnostic process, and valid combinations will need to be presented by software that exposes both data elements, so it is not possible for users to select conflicting combinations. \nPreliminary or working diagnoses are intended to represent the single most likely choice out of all differential diagnosis options.
- OLD: この段階は通常、診断の時期と、実施した臨床検査および得られている臨床的根拠から導かれる臨床的確度の水準との組み合わせで決まる。このデータ要素と EVALUATION.problem_diagnosis の「診断確度」は診断プロセスの2つの重要な軸であり、両方のデータ要素を提示するソフトウェアは、利用者が矛盾する組み合わせを選べないように、妥当な組み合わせを提示する必要がある。 \n初期診断または暫定診断は、すべての鑑別診断の選択肢の中で最も可能性の高い単一の選択を表すことを意図している。
- NEW: この状況は通常、診断の時期と、実施した臨床検査および得られている臨床的根拠から導かれる臨床的確度の水準との組み合わせで決まる。このデータ要素と EVALUATION.problem_diagnosis の「診断確度」は診断プロセスの2つの重要な軸であり、両方のデータ要素を提示するソフトウェアは、利用者が矛盾する組み合わせを選べないように、妥当な組み合わせを提示する必要がある。 \n予備的診断または暫定診断は、すべての鑑別診断の選択肢の中で最も可能性の高い単一の選択を表すことを意図している。

### term/at0016/text
- EN : Preliminary
- OLD: 初期
- NEW: 予備的

### term/at0026/text
- EN : Active
- OLD: 活動性
- NEW: アクティブ

### term/at0026/description
- EN : The problem or diagnosis is currently active and clinically relevant.
- OLD: プロブレムまたは診断は現在活動性であり、臨床的に意味を持つ。
- NEW: プロブレムまたは診断は現在有効であり、臨床的に意味を持つ。

### term/at0027/text
- EN : Inactive
- OLD: 非活動性
- NEW: インアクティブ

### term/at0027/description
- EN : The problem or diagnosis is not completely resolved but is inactive or felt less relevant to the current clinical context.
- OLD: プロブレムまたは診断は完全には治癒していないが、非活動性であるか、現在の臨床的文脈では重要性が低いと考えられる。
- NEW: プロブレムまたは診断は完全には治癒していないが、無効であるか、現在の臨床的文脈では重要性が低いと考えられる。

### term/at0060/text
- EN : Current/Past?
- OLD: 現在/過去？
- NEW: 現症/既往？

### term/at0060/description
- EN : Category that supports division of problems and diagnoses into Current or Past problem lists.
- OLD: プロブレムと診断を「現在」と「過去」のプロブレムリストに分けることを支援する区分。
- NEW: プロブレムと診断を「現症」と「既往」のプロブレムリストに分けることを支援する区分。

### term/at0060/comment
- EN : The Current/Past and Active/Inactive data elements have similar clinical impact but represent slightly different semantics. Both are actively used in different clinical settings, but usually not together. If an Active/Inactive qualifier is recorded, then this data element is likely to be redundant. An exception where a condition can be current but inactive is asthma that is not causing acute symptoms.
- OLD: 「現在/過去」と「活動性/非活動性」のデータ要素は、臨床的な影響は似ているが意味がわずかに異なる。どちらも異なる臨床現場で実際に使われているが、通常は一緒には使われない。「活動性/非活動性」の修飾子が記録されている場合、このデータ要素は冗長になる可能性が高い。現在ではあるが非活動性という例外として、急性症状を起こしていない喘息がある。
- NEW: 「現症/既往」と「アクティブ/インアクティブ」のデータ要素は、臨床的な影響は似ているが意味がわずかに異なる。どちらも異なる臨床現場で実際に使われているが、通常は一緒には使われない。「アクティブ/インアクティブ」の修飾子が記録されている場合、このデータ要素は冗長になる可能性が高い。現症ではあるがインアクティブという例外として、急性症状を起こしていない喘息がある。

### term/at0061/text
- EN : Past
- OLD: 過去
- NEW: 既往

### term/at0061/description
- EN : An issue which ocurred in the past.
- OLD: 過去に生じた問題。
- NEW: 過去に発生した問題。

### term/at0062/text
- EN : Current
- OLD: 現在
- NEW: 現症

### term/at0062/description
- EN : An issue occuring at present.
- OLD: 現在生じている問題。
- NEW: 現在発生している問題。

### term/at0063/comment
- EN : This data element contains a value set commonly used in diagnostic categorisation. In episodic care contexts (commonly secondary care) it is common to categorise/organise diagnoses according to their relationship to the principal diagnosis being addressed during that episode of care. These categories may also be used for clinical coding, reporting and billing purposes. In some countries the diagnostic category may be known as a DRG.\n In addition, the free text choice permits use of other local value sets, as required.
- OLD: このデータ要素は、診断の分類でよく使われる値セットを含む。エピソード型のケアの文脈（一般には二次医療）では、そのケアエピソードで扱われる主診断との関係に従って診断を分類・整理するのが一般的である。これらのカテゴリは、臨床コーディング、報告、請求の目的にも使われることがある。国によっては、診断カテゴリは DRG として知られている場合がある。\n さらに、自由記述の選択肢により、必要に応じて他のローカルな値セットも使用できる。
- NEW: このデータ要素は、診断の分類でよく使われる値セットを含む。エピソード型のケアの文脈（一般には二次医療）では、そのケアエピソードで扱われる主病名との関係に従って診断を分類・整理するのが一般的である。これらのカテゴリは、臨床コーディング、報告、請求の目的にも使われることがある。国によっては、診断カテゴリは DRG として知られている場合がある。\n さらに、自由記述の選択肢により、必要に応じて他のローカルな値セットも使用できる。

### term/at0064/text
- EN : Principal diagnosis
- OLD: 主診断
- NEW: 主病名

### term/at0066/text
- EN : Secondary diagnosis
- OLD: 副診断
- NEW: 副病名

### term/at0066/description
- EN : A problem or diagnosis that occurs at the same time as the primary problem or diagnosis. May also be known as a comorbid condition.
- OLD: 主たるプロブレムまたは診断と同時に存在するプロブレムまたは診断。併存疾患とも呼ばれる。
- NEW: 主たるプロブレムまたは病名と同時に存在するプロブレムまたは病名。併存疾患とも呼ばれる。

### term/at0083/text
- EN : Resolution phase
- OLD: 治癒の段階
- NEW: 治癒段階

### term/at0094/text
- EN : Acute-on-chronic
- OLD: 慢性の急性増悪
- NEW: 慢性疾患の急性増悪

### term/at0094/description
- EN : A problem or diagnosis with an acute exacerbation of a chronic condition.
- OLD: 慢性の病態の急性増悪を伴うプロブレムまたは診断。
- NEW: 慢性期の病態の急性増悪を伴うプロブレムまたは診断。

### term/at0098/text
- EN : Level of control
- OLD: コントロール状態
- NEW: コントロール状況

## openEHR-EHR-EVALUATION.problem_diagnosis.v1 — problem_qualifier.v2 校正の取り込み（アクティブ/インアクティブ、現症/既往、主病名/副病名 ほか）（2026-09-11）

### description/-/use
- EN : Use for recording details about a single, identified health problem or diagnosis. \n\nClear definitions that enable differentiation between a 'problem' and a 'diagnosis' are almost impossible in practice - we cannot reliably tell when a problem should be regarded as a diagnosis. When diagnostic or classification criteria are successfully met, then we can confidently call the condition a formal diagnosis, but prior to these conditions being met and while there is supportive evidence available, it can also be valid to use the term 'diagnosis'. The amount of supportive evidence required for the label of diagnosis is not easy to define and in reality probably varies from condition to condition. Many standards committees have grappled with this definitional conundrum for years without clear resolution.\n\nFor the purposes of clinical documentation with this archetype, problem and diagnosis are regarded as a continuum, with increasing levels of detail and supportive evidence usually providing weight towards the label of 'diagnosis'. In this archetype it is not neccessary to classify the condition as a 'problem' or 'diagnosis'. The data requirements to support documentation of either are identical, with additional data structure required to support inclusion of the evidence if and when it becomes available. Examples of problems include: the individual's expressed desire to lose weight, but without a formal diagnosis of Obesity; or a relationship problem with a family member. Examples of formal diagnoses would include a cancer that is supported by historical information, examination findings, histopathological findings, radiological findings and meets all requirements for known diagnostic criteria. In practice, most problems or diagnoses do not sit at either end of the problem-diagnosis spectrum, but somewhere in between.\n\nThis archetype can be used within many contexts. For example, recording a problem or a clinical diagnosis during a clinical consultation; populating a persistent Problem List; or to provide a summary statement within a Discharge Summary document.\n\nIn practice, clinicians use many context-specific qualifiers such as past/present, primary/secondary, active/inactive, admission/discharge etc. The contexts can be location-, specialisation-, episode- or workflow-specific, and these can cause confusion or even potential safety issues if perpetuated in Problem Lists or shared in documents that are outside of the original context. These qualifiers can be archetyped separately and included in the ‘Status’ slot, because their use varies in different settings. It is expected that these will be used mostly within the appropriate context and not shared out of that context without clear understanding of potential consequences. For example, a primary diagnosis to one clinician may be a secondary one to another specialist; an active problem can become inactive (or vice versa) and this can impact the safe use of clinical decision support. In general these qualifiers should be applied locally within the context of the clinical system, and in practice these statuses should be manually curated by clinicians to ensure that lists of Current/Past, Active/Inactive or Primary/Secondary Problems are clinically accurate. \n\nThis archetype will be used as a component within the Problem Oriented Medical Record as described by Larry Weed. Additional archetypes, representing clinical concepts such as condition as an overarching organiser for diagnoses etc, will need to be developed to support this approach.\n\nIn some situations, it may be assumed that identification of a diagnosis fits only within the expertise of physicians, but this is not the intent for this archetype. Diagnoses can be recorded using this archetype by any healthcare professional.
- OLD: 特定された単一の健康上のプロブレムや診断に関する詳細を記録するために使用される。\n\n「プロブレム（problem）」と「診断（diagnosis）」を区別する明確な定義を実務上で定めることはほぼ不可能である。ある「プロブレム」をいつ「診断」とみなすべきかを確実に判断することはできない。診断基準や分類基準を完全に満たせば、その状態を正式な「診断」と呼ぶことができるが、基準を満たす前であっても、それを裏付ける証拠があれば「診断」という用語を使用することが妥当な場合もある。「診断」と呼ぶために必要な証拠の量は定義が難しく、実際には疾患や状態によって異なるだろう。多くの標準化委員会が長年にわたり、この定義上の難問に取り組んできたが、明確な解決には至っていない。\n\nこのarchetypeを用いた臨床記録においては、「プロブレム」と「診断」は連続したもの（スペクトラム）として扱われる。詳細情報や裏付けとなる証拠が増えるにつれて、通常は「診断」というラベルが適用される方向へと重み付けがなされる。このarchetypeでは、対象となる状態を「プロブレム」か「診断」のいずれかに分類する必要はない。どちらを記録する場合でも必要なデータ要件は同じであり、証拠が利用可能になった際にそれを追加するためのデータ構造が用意されている。「プロブレム」の例としては、肥満の正式な診断はなされていないものの、本人が減量を希望している場合や、家族との人間関係の問題などが挙げられる。一方、正式な「診断」の例としては、病歴、診察所見、組織病理学的所見、画像診断所見によって裏付けられ、既知の診断基準の要件をすべて満たす癌などが挙げられる。実際には、多くの「プロブレム」や「診断」は、「プロブレム」と「診断」というスペクトラムの両端のどちらかにあるわけではなく、その中間のどこかに位置している。\n\nこのarchetypeは、さまざまな状況で使用できる。例えば、診療中の「プロブレム」や臨床的な「診断」の記録、継続的な「プロブレムリスト（Problem List）」への記載、あるいは退院時サマリーにおける概要の記述などが挙げられる。\n\n臨床現場では、過去／現在、主／副（プライマリ／セカンダリ）、active/inactive、入院時／退院時など、状況に応じた多くの修飾語（qualifier）が使用される。これらの状況は、場所、専門分野、診療エピソード、あるいはワークフローによって異なる。こうした修飾語が「プロブレムリスト」にそのまま残されたり、元の文脈とは異なる文書で共有されたりすると、混乱や安全上の問題を引き起こす可能性がある。これらの修飾語の使用法は設定によって異なるため、個別のarchetypeとして定義し、「ステータス（Status）」スロットに組み込むことが可能である。これらは主に適切な文脈で使用されることが想定されており、潜在的な影響を明確に理解することなく、その文脈から切り離して共有されるべきではない。例えば、ある臨床医にとっては「主診断（primary diagnosis）」であっても、別の専門医にとっては「副診断（secondary diagnosis）」となる場合がある。また、activeな問題がinactiveに変わる（あるいはその逆）こともあり、こうした変化は臨床意思決定支援システムの安全な利用に影響を及ぼし得る。一般に、これらの修飾語は臨床システムの文脈内でローカルに適用されるべきであり、実際には、現在／過去、活動性／非活動性、あるいは主／副といったプロブレムのリストが臨床的に正確であることを保証するために、臨床医が手動で状態を管理・調整する必要がある。\n\nこのarchetypeは、Larry Weedが提唱した「プロブレム志向型診療録（Problem Oriented Medical Record）」の構成要素として使用される。このアプローチを支援するためには、診断などを包括的にまとめる概念である「病態（condition）」といった臨床概念を表す、追加のarchetypeを開発する必要がある。\n\n診断の特定は医師の専門領域にのみ属すると見なされる場合もあるが、本archetypeはそのような意図で設計されたものではない。本archetypeを使用すれば、あらゆる医療従事者が診断を記録することが可能である。\n\nProblemの日本語訳出には「問題」「課題」なども考えたが、既に広く「プロブレムリスト」として用語が普及していることから、「プロブレム」を訳語として採用することとした。
- NEW: 特定された単一の健康上のプロブレムや診断に関する詳細を記録するために使用される。\n\n「プロブレム（problem）」と「診断（diagnosis）」を区別する明確な定義を実務上で定めることはほぼ不可能である。ある「プロブレム」をいつ「診断」とみなすべきかを確実に判断することはできない。診断基準や分類基準を完全に満たせば、その状態を正式な「診断」と呼ぶことができるが、基準を満たす前であっても、それを裏付ける証拠があれば「診断」という用語を使用することが妥当な場合もある。「診断」と呼ぶために必要な証拠の量は定義が難しく、実際には疾患や状態によって異なるだろう。多くの標準化委員会が長年にわたり、この定義上の難問に取り組んできたが、明確な解決には至っていない。\n\nこのarchetypeを用いた臨床記録においては、「プロブレム」と「診断」は連続したもの（スペクトラム）として扱われる。詳細情報や裏付けとなる証拠が増えるにつれて、通常は「診断」というラベルが適用される方向へと重み付けがなされる。このarchetypeでは、対象となる状態を「プロブレム」か「診断」のいずれかに分類する必要はない。どちらを記録する場合でも必要なデータ要件は同じであり、証拠が利用可能になった際にそれを追加するためのデータ構造が用意されている。「プロブレム」の例としては、肥満の正式な診断はなされていないものの、本人が減量を希望している場合や、家族との人間関係の問題などが挙げられる。一方、正式な「診断」の例としては、病歴、診察所見、組織病理学的所見、画像診断所見によって裏付けられ、既知の診断基準の要件をすべて満たす癌などが挙げられる。実際には、多くの「プロブレム」や「診断」は、「プロブレム」と「診断」というスペクトラムの両端のどちらかにあるわけではなく、その中間のどこかに位置している。\n\nこのarchetypeは、さまざまな状況で使用できる。例えば、診療中の「プロブレム」や臨床的な「診断」の記録、継続的な「プロブレムリスト（Problem List）」への記載、あるいは退院時サマリーにおける概要の記述などが挙げられる。\n\n臨床現場では、過去／現在、主／副（プライマリ／セカンダリ）、active/inactive、入院時／退院時など、状況に応じた多くの修飾語（qualifier）が使用される。これらの状況は、場所、専門分野、診療エピソード、あるいはワークフローによって異なる。こうした修飾語が「プロブレムリスト」にそのまま残されたり、元の文脈とは異なる文書で共有されたりすると、混乱や安全上の問題を引き起こす可能性がある。これらの修飾語の使用法は設定によって異なるため、個別のarchetypeとして定義し、「ステータス（Status）」スロットに組み込むことが可能である。これらは主に適切な文脈で使用されることが想定されており、潜在的な影響を明確に理解することなく、その文脈から切り離して共有されるべきではない。例えば、ある臨床医にとっては「主病名（primary diagnosis）」であっても、別の専門医にとっては「副病名（secondary diagnosis）」となる場合がある。また、activeな問題がinactiveに変わる（あるいはその逆）こともあり、こうした変化は臨床意思決定支援システムの安全な利用に影響を及ぼし得る。一般に、これらの修飾語は臨床システムの文脈内でローカルに適用されるべきであり、実際には、現症／既往、アクティブ／インアクティブ、あるいは主／副といったプロブレムのリストが臨床的に正確であることを保証するために、臨床医が手動で状態を管理・調整する必要がある。\n\nこのarchetypeは、Larry Weedが提唱した「プロブレム志向型診療録（Problem Oriented Medical Record）」の構成要素として使用される。このアプローチを支援するためには、診断などを包括的にまとめる概念である「病態（condition）」といった臨床概念を表す、追加のarchetypeを開発する必要がある。\n\n診断の特定は医師の専門領域にのみ属すると見なされる場合もあるが、本archetypeはそのような意図で設計されたものではない。本archetypeを使用すれば、あらゆる医療従事者が診断を記録することが可能である。\n\nProblemの日本語訳出には「問題」「課題」なども考えたが、既に広く「プロブレムリスト」として用語が普及していることから、「プロブレム」を訳語として採用することとした。

## openEHR-EHR-OBSERVATION.story.v1 — story.v1 校正の取り込み（Story/History→病歴、Structured detail→構造化された詳細記録 ほか）（2026-09-11）

### description/-/purpose
- EN : To record a narrative description of the clinical history of the subject of care and to provide a framework in which to nest detailed CLUSTER archetypes, each of which will support the narrative with additional structured detail for symptoms, health events and related topics.\n\nUse to record detail about the clinical history as reported by an individual, parent, care-giver or other party. It may be recorded by a clinician as part of a clinical history record as reported to them, or self-recorded as part of a clinical questionnaire or personal health record.
- OLD: ケア対象者の病歴を叙述的に記録し、症状、健康イベント、および関連する話題について構造化された詳細で叙述を補う詳細な CLUSTER archetype群を入れ子にするための枠組みを提供するため。\n\n本人、親、介護者、またはその他の関係者から報告された病歴の詳細を記録するために用いる。臨床医が報告を受けた病歴の記録の一部として記録することも、臨床質問票や個人健康記録の一部として本人が自ら記録することもある。
- NEW: ケア対象者の病歴を叙述的に記録するため。叙述を詳細な記録で補うため、症状、健康イベント、および関連する話題について構造化された CLUSTER archetype群を入れ子にするための枠組みを提供する。\n\n本人、親、介護者、またはその他の関係者から報告された病歴の詳細を記録するために用いる。臨床医が報告を受けた病歴の記録の一部として記録することも、臨床質問票や個人健康記録の一部として本人が自ら記録することもある。

### description/-/use
- EN : Use to record a description about subjective health-related observations or impressions from the point of view of the subject of care. \n\nWhen recorded by a clinician within the context of healthcare provision the story can be used for capturing the clinical history, as reported by the subject themselves, a parent, care-giver or other related party. If recorded by the subject, it can be used as an account of their 'story' of symptoms and health experiences, which might be used to share with healthcare providers or to document within their own personal health record.\n\nUse:\n- to record a simple narrative; and/or \n- as a container archetype to enable recording of a detailed structured history by inclusion of relevant CLUSTER archetypes within the 'Detail' SLOT. For example: CLUSTER.symptom, CLUSTER.issue or CLUSTER.health_event archetypes can be appropriately used in this SLOT.\n\nUse to incorporate the narrative descriptions of clinical history captured from existing or legacy clinical systems into an archetyped format, using the 'Story' text data element.
- OLD: ケア対象者の視点からの、健康に関する主観的な観察や印象についての記述を記録するために用いる。 \n\n医療提供の文脈で臨床医が記録する場合、ストーリーは、本人、親、介護者、またはその他の関係者から報告された病歴を捉えるために使える。本人が記録する場合は、症状や健康上の経験についての本人の「ストーリー」の記述として使え、医療従事者と共有したり、本人の個人健康記録に残したりするために用いることができる。\n\n用途：\n- 単純な叙述を記録する；および／または \n- 「詳細」SLOT に関連する CLUSTER archetypeを含めることで、詳細な構造化された病歴を記録できるようにするコンテナarchetypeとして。例：CLUSTER.symptom、CLUSTER.issue、CLUSTER.health_event の各archetypeをこの SLOT で適切に使用できる。\n\n既存または旧来の臨床システムから取り込んだ病歴の叙述的な記述を、「ストーリー」テキストデータエレメントを用いて archetype化された形式に組み込むために用いる。
- NEW: ケア対象者の視点からの、健康に関する主観的な観察や印象についての記述を記録するために用いる。 \n\n医療実務の文脈で臨床医が記録する場合、病歴は、本人、親、介護者、またはその他の関係者から報告された病歴を捉えるために使える。本人が記録する場合は、症状や健康上の経験についての本人が語る「病歴」の記述として使え、医療従事者と共有したり、本人の個人健康記録に残したりするために用いることができる。\n\n用途：\n- 単純な叙述を記録する；および／または \n- 「詳細」SLOT に関連する CLUSTER archetypeを含めることで、詳細な構造化された病歴を記録できるようにするコンテナarchetypeとして。例：CLUSTER.symptom、CLUSTER.issue、CLUSTER.health_event の各archetypeをこの SLOT で適切に使用できる。\n\n既存または旧来の臨床システムから取り込んだ病歴の叙述的な記述を、Storyテキストデータエレメントを用いて archetype化された形式に組み込むために用いる。

### description/-/misuse
- EN : Not to be used to record formal assessments by clinicians which would usually be recorded using the EVALUATION class of archetypes.
- OLD: 臨床医による正式なアセスメントを記録するために用いてはならない。それらは通常、EVALUATION クラスのarchetypeを用いて記録する。
- NEW: 臨床医による正式な評価を記録するために用いてはならない。それらは通常、EVALUATION クラスのarchetypeを用いて記録する。

### term/at0000/text
- EN : Story/History
- OLD: ストーリー・病歴
- NEW: 病歴

### term/at0000/description
- EN : The subjective clinical history of the subject of care as recorded directly by the subject, or reported to a clinician by the subject or a carer.
- OLD: ケア対象者の主観的な病歴で、本人が直接記録したもの、または本人や介護者から臨床医に報告されたもの。
- NEW: ケア対象者の主観的な語りで、本人が直接記録したもの、または本人や介護者から臨床医に報告されたもの。

### term/at0004/text
- EN : Story
- OLD: ストーリー
- NEW: 病歴

### term/at0004/description
- EN : Narrative description of the story or clinical history for the subject of care.
- OLD: ケア対象者のストーリーまたは病歴の叙述的な記述。
- NEW: ケア対象者が語る病歴、または客観的記録に基づく病歴の叙述的な記述。

### term/at0006/text
- EN : Structured detail
- OLD: 構造化された詳細
- NEW: 構造化された詳細記録

### term/at0006/description
- EN : Structured detail about the individual's story or patient's history.
- OLD: 本人のストーリーまたは患者の病歴についての構造化された詳細。
- NEW: 本人の語りまたは客観的記録に基づく病歴についての構造化された詳細記録。

### term/at0006/comment
- EN : For example: a specific symptom such as nausea or pain; an event such as a fall off a bicycle; or an issue such as a desire to quit using tobacco.
- OLD: 例：悪心や疼痛のような特定の症状；自転車からの転落のようなイベント；禁煙したいという希望のような問題。
- NEW: 例：悪心や疼痛のような特定の症状、自転車からの転落のようなイベント、禁煙したいという希望のような問題。

## openEHR-EHR-OBSERVATION.story.v1 — story.v1 校正 2 点目（clinical history＝病歴、語りは対比文脈のみ）（2026-09-11）

### description/-/use
- EN : Use to record a description about subjective health-related observations or impressions from the point of view of the subject of care. \n\nWhen recorded by a clinician within the context of healthcare provision the story can be used for capturing the clinical history, as reported by the subject themselves, a parent, care-giver or other related party. If recorded by the subject, it can be used as an account of their 'story' of symptoms and health experiences, which might be used to share with healthcare providers or to document within their own personal health record.\n\nUse:\n- to record a simple narrative; and/or \n- as a container archetype to enable recording of a detailed structured history by inclusion of relevant CLUSTER archetypes within the 'Detail' SLOT. For example: CLUSTER.symptom, CLUSTER.issue or CLUSTER.health_event archetypes can be appropriately used in this SLOT.\n\nUse to incorporate the narrative descriptions of clinical history captured from existing or legacy clinical systems into an archetyped format, using the 'Story' text data element.
- OLD: ケア対象者の視点からの、健康に関する主観的な観察や印象についての記述を記録するために用いる。 \n\n医療実務の文脈で臨床医が記録する場合、病歴は、本人、親、介護者、またはその他の関係者から報告された病歴を捉えるために使える。本人が記録する場合は、症状や健康上の経験についての本人が語る「病歴」の記述として使え、医療従事者と共有したり、本人の個人健康記録に残したりするために用いることができる。\n\n用途：\n- 単純な叙述を記録する；および／または \n- 「詳細」SLOT に関連する CLUSTER archetypeを含めることで、詳細な構造化された病歴を記録できるようにするコンテナarchetypeとして。例：CLUSTER.symptom、CLUSTER.issue、CLUSTER.health_event の各archetypeをこの SLOT で適切に使用できる。\n\n既存または旧来の臨床システムから取り込んだ病歴の叙述的な記述を、Storyテキストデータエレメントを用いて archetype化された形式に組み込むために用いる。
- NEW: ケア対象者の視点からの、健康に関する主観的な観察や印象についての記述を記録するために用いる。 \n\n医療実務の文脈で臨床医が記録する場合、病歴は、本人、親、介護者、またはその他の関係者から報告された病歴を捉えるために使える。本人が記録する場合は、症状や健康上の経験についての本人が語る「病歴」の記述として使え、医療従事者と共有したり、本人の個人健康記録に残したりするために用いることができる。\n\n用途：\n- 単純な叙述を記録する；および／または \n- 「詳細」SLOT に関連する CLUSTER archetypeを含めることで、詳細な構造化された病歴を記録できるようにするコンテナarchetypeとして。例：CLUSTER.symptom、CLUSTER.issue、CLUSTER.health_event の各archetypeをこの SLOT で適切に使用できる。\n\n既存または旧来の臨床システムから取り込んだ病歴の叙述的な記述を、「病歴の記述」（Story）テキストデータエレメントを用いて archetype化された形式に組み込むために用いる。

### term/at0000/description
- EN : The subjective clinical history of the subject of care as recorded directly by the subject, or reported to a clinician by the subject or a carer.
- OLD: ケア対象者の主観的な語りで、本人が直接記録したもの、または本人や介護者から臨床医に報告されたもの。
- NEW: ケア対象者の主観的な病歴で、本人が直接記録したもの、または本人や介護者から臨床医に報告されたもの。

### term/at0004/description
- EN : Narrative description of the story or clinical history for the subject of care.
- OLD: ケア対象者が語る病歴、または客観的記録に基づく病歴の叙述的な記述。
- NEW: ケア対象者の語り、または臨床家が聴取した病歴の叙述的な記述。

### term/at0006/description
- EN : Structured detail about the individual's story or patient's history.
- OLD: 本人の語りまたは客観的記録に基づく病歴についての構造化された詳細記録。
- NEW: 本人の語りまたは臨床家が聴取した病歴についての構造化された詳細記録。

## openEHR-EHR-EVALUATION.clinical_synopsis.v1 — clinical_synopsis.v1 校正の取り込み（2026-09-13）

### description/-/purpose
- EN : To manually synthesise and record a narrative summary about a patient, from the perspective of a healthcare provider.
- OLD: 医療従事者の視点から、患者についての叙述的な要約を手作業で総合して記録するため。
- NEW: 医療従事者の視点から、患者についての叙述的な要約を手作業で総合的に記録するため。

### description/-/use
- EN : Use to record a narrative, summary view of the patient's health.  This unstructured summary may include identified health issues; health care provided; associated interpretation; patient understanding; and enable communication about some of the softer, more subjective aspects of the patient’s experience and journey. Most commonly this summary is likely to be related to a specific health event such as a specific consultation or hospital admission, but may also be used to summarise the patient's health experience over varying time periods. \nIn practice, Clinical Synopsis is a meta observation that will complement the existing structured clinical record, allowing for expression of subtle, subjective or interpretive information about the patient that might not otherwise be obvious through structured data alone, providing balance and context to the EHR record.  \nFor example, a Clinical Synopsis can communicate a succinct summary of the patient's hospital admission as one component of a comprehensive and structured Discharge Summary document.
- OLD: 患者の健康についての叙述的で要約的な見方を記録するために用いる。この非構造化の要約には、特定された健康上の問題、提供された医療、関連する解釈、患者の理解を含めることができ、患者の経験と経過のうち、より柔らかく主観的な側面についての伝達を可能にする。この要約はほとんどの場合、特定の診察や入院のような特定の健康イベントに関連するものになると考えられるが、さまざまな期間にわたる患者の健康上の経験を要約するためにも使える。 \n実際には、臨床要約は既存の構造化された臨床記録を補完するメタ観察であり、構造化データだけでは明らかにならないかもしれない、患者についての微妙で主観的または解釈的な情報を表現できるようにし、EHR の記録にバランスと文脈を与える。 \n例えば、臨床要約は、包括的で構造化された退院時サマリー文書の一構成要素として、患者の入院についての簡潔な要約を伝えることができる。
- NEW: 患者の健康状態を文章で要約して記録するために用いる。この構造化されていない要約には、把握された健康上のプロブレム、患者が受けた医療、それらについての解釈、患者自身の理解などを含めることができる。また、患者の経験やこれまでの経過にまつわる、細かなニュアンスや主観的な側面も共有できる。通常は、診察や入院などの特定の健康イベントに関連する要約として用いられるが、さまざまな期間にわたる患者の健康に関する経験をまとめるためにも使用できる。 \n臨床要約は、既存の構造化された臨床記録を補完するメタ観察として機能する。構造化データだけでは読み取りにくい、患者に関する細かなニュアンスや主観的な情報、解釈を伴う情報を表現することで、EHR の記録に文脈を補い、全体のバランスを整える。 \n例えば、包括的で構造化された退院時サマリー文書の一部として臨床要約を用い、患者の入院に関する簡潔な要約を伝えることができる。

### description/-/keywords
- EN : summary | conclusion | outline | precis | abstract | assessment | synopsis | epicrisis | comment | note
- OLD: 要約 | 結論 | 概要 | 大意 | 抄録 | アセスメント | サマリー | エピクリーゼ | コメント | 記録 | 臨床要約 | 経過要約
- NEW: 要約 | 結論 | 概要 | 大意 | 抄録 | アセスメント | 退院時サマリー | サマリー | エピクリーゼ | コメント | 記録 | 臨床要約 | 経過要約

### term/at0000/description
- EN : Narrative summary or overview about a patient, specifically from the perspective of a healthcare provider, and with or without associated interpretations.
- OLD: 患者についての叙述的な要約または概観で、特に医療従事者の視点からのもの。関連する解釈を伴う場合も伴わない場合もある。
- NEW: 患者についての叙述的な要約または概要で、特に医療従事者の視点からのもの。関連する解釈を伴う場合も伴わない場合もある。

### term/at0002/description
- EN : The summary, assessment, conclusions or evaluation of the clinical findings.
- OLD: 臨床所見の要約、アセスメント、結論、または評価。
- NEW: 臨床所見の要約、アセスメント、まとめ、または評価。

## openEHR-EHR-SECTION.adhoc.v1 — adhoc.v1 校正の取り込み（概念名 任意見出し → 仮見出し）（2026-09-13）

### description/-/use
- EN : Use to construct a section heading in a template that will be renamed to suit the specific clinical context. For example: \"Ad hoc heading\" renamed to \"Examination findings\".
- OLD: テンプレート内で、特定の臨床的文脈に合わせて名前を変更するセクション見出しを構成するために用いる。例：「任意見出し」を「診察所見」に変更する。
- NEW: テンプレート内で、特定の臨床的文脈に合わせて名前を変更するセクション見出しを構成するために用いる。例：「仮見出し」を「診察所見」に変更する。

### term/at0000/text
- EN : Ad hoc heading
- OLD: 任意見出し
- NEW: 仮見出し

## openEHR-EHR-CLUSTER.person.v1 — person.v1 校正の取り込み（電子的な連絡先、写し保有者、医療従事者名簿 ほか）（2026-09-19）

### description/-/purpose
- EN : To record details about a person as they are known or understood in the course of clinical documentation.
- OLD: 臨床記録の過程で把握または理解されたとおりに、人についての詳細を記録するため。
- NEW: 臨床記録の作成に際して取得した、その人に関する詳細情報を記録するため。

### description/-/use
- EN : Use to record details of a person as they are known or understood in the course of clinical documentation, often ad hoc or when it is not appropriate or possible to use a formal demographic register or index. Examples include:\n- the copyholder of an advanced care record, using the 'Copyholder' SLOT within the EVALUATION.advance_care_directive archetype;\n- the role and contact details of a named contact person within an organisation, using the 'Contact person' SLOT within the CLUSTER.organisation archetype;\n- details about a relative in a family history record, using the 'Family member details' SLOT within the openEHR-EHR-EVALUATION.family_history archetype; \n- the name of the person who collected a laboratory specimen from a patient, using the 'Specimen collector details' within the CLUSTER.specimen archetype; or\n- a witness to a fall or accident, using the 'Witness' SLOT within the CLUSTER.health_event archetype.\n\nIn most simple clinical recording use cases, the unstructured 'Name' element within the CLUSTER.person archetype will be sufficient to record the name of a person as part of a health record. However, in circumstances where a structured name is necessary or desirable for clinical recording purposes, nest this archetype within the 'Structured name' SLOT in CLUSTER.person archetype. If the CLUSTER.structured_name archetype is nested within the 'Structured name' SLOT, any or all of the data elements can be combined together as a text string and represented in the 'Name' element, as long as they are consistent.\n\nThis archetype could also be used as a proxy for formal demographic data when reviewing a template with domain experts - for example, an assessment where reviewers would expect to see a person's details at the top of the assessment form.
- OLD: 臨床記録の過程で把握または理解されたとおりに人の詳細を記録するために用いる。多くはその場限りの記録であるか、正式なデモグラフィック登録簿やインデックスを使うことが適切でない、または不可能な場合である。例：\n- EVALUATION.advance_care_directive archetypeの「写し保持者」SLOT を用いた、事前ケア記録の写しの保持者；\n- CLUSTER.organisation archetypeの「連絡担当者」SLOT を用いた、組織内で名前が特定された連絡担当者の役割と連絡先；\n- openEHR-EHR-EVALUATION.family_history archetypeの「家族構成員の詳細」SLOT を用いた、家族歴記録における親族の詳細； \n- CLUSTER.specimen archetypeの「検体採取者の詳細」を用いた、患者から臨床検査の検体を採取した人の氏名；または\n- CLUSTER.health_event archetypeの「目撃者」SLOT を用いた、転倒や事故の目撃者。\n\nほとんどの単純な臨床記録のユースケースでは、CLUSTER.person archetype内の非構造化の「氏名」要素だけで、健康記録の一部として人の氏名を記録するのに十分である。しかし、臨床記録の目的で構造化された氏名が必要または望ましい状況では、本archetypeを CLUSTER.person archetypeの「構造化された氏名」SLOT に入れ子にする。CLUSTER.structured_name archetypeを「構造化された氏名」SLOT に入れ子にした場合、そのデータエレメントの一部またはすべてをテキスト文字列として結合し、「氏名」要素に表すことができる。ただし両者が整合していること。\n\n本archetypeは、領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用としても使える。例えば、アセスメント様式の冒頭に人の詳細が表示されることをレビュー担当者が期待するようなアセスメントである。
- NEW: 臨床記録の作成に際して取得した、その人に関する詳細情報を記録するために用いる。主に、必要に応じて情報を記録する場合や、正式なデモグラフィック登録簿やインデックスの利用が適切でない、または利用できない場合を想定している。以下のような使用例がある。\n- EVALUATION.advance_care_directive archetypeの「写し保有者」SLOTを用いて、事前ケア記録の写しを保有する人の情報を記録する。\n- CLUSTER.organisation archetypeの「連絡担当者」SLOTを用いて、組織内の特定の連絡担当者の役割と連絡先を記録する。\n- openEHR-EHR-EVALUATION.family_history archetypeの「家族構成員の詳細」SLOTを用いて、家族歴に登場する親族の詳細情報を記録する。 \n- CLUSTER.specimen archetypeの「検体採取者の詳細」を用いて、患者から検査用の検体を採取した人の氏名を記録する。\n- CLUSTER.health_event archetypeの「目撃者」SLOTを用いて、転倒や事故の目撃者の情報を記録する。\n\n臨床記録に人の氏名を記録するだけであれば、多くの場合、CLUSTER.person archetypeの非構造化の「氏名」要素で十分である。ただし、臨床記録の目的上、氏名を構造化して記録することが必要または望ましい場合は、CLUSTER.person archetypeの「構造化された氏名」SLOTにCLUSTER.structured_name archetypeを組み込む。この場合、各データエレメントの一部またはすべてを一つの文字列にまとめ、「氏名」要素に表示することもできる。ただし、構造化された氏名と「氏名」要素の内容が整合している必要がある。\n\n本archetypeは、対象領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用として使用することもできる。例えば、評価票の冒頭にその人の詳細情報が表示されることをレビュー担当者が想定している場合に、その情報を示すために用いる。

### description/-/misuse
- EN : Not to be used to represent or replace formal identification management or for the purposes of maintaining an official demographic register or index. Use a formal Master Patient Index or Health Provider Index for this purpose, or archetypes based on the openEHR Demographic Information Model.\n\nNot to be used to represent the subject of care, participants or author of the record and similar data elements that should be represented formally in the health record using the Reference Model attributes.\n\nNot to be used to record the date of birth of an individual - use the 'Date of birth' data element within the EVALUATION.birth_summary for this purpose\n\nNot to be used to record biometric detail or biomarkers about an individual - use a specific ENTRY archetype for this purpose.
- OLD: 正式な識別管理を表したり置き換えたりするため、あるいは公式のデモグラフィック登録簿やインデックスを維持する目的で用いてはならない。その目的には正式な患者マスターインデックス（MPI）や医療従事者インデックス、または openEHR デモグラフィック情報モデルに基づくarchetypeを用いること。\n\nケア対象者、参加者、記録の作成者など、参照モデルの属性を用いて健康記録に正式に表すべきデータエレメントを表すために用いてはならない。\n\n個人の生年月日を記録するために用いてはならない。その目的には EVALUATION.birth_summary 内の「生年月日」データエレメントを用いること\n\n個人の生体認証情報やバイオマーカーを記録するために用いてはならない。その目的には専用の ENTRY archetypeを用いること。
- NEW: 正式な個人識別情報の管理やその代替、または公式のデモグラフィック登録簿やインデックスの維持・管理に用いてはならない。これらの目的には、正式な患者マスターインデックス（MPI）や「医療従事者名簿（Health Provider Index）」、またはopenEHRデモグラフィック情報モデルに基づくarchetypeを用いること。\n\nケア対象者、ケアへの参加者、記録の作成者など、参照モデルの属性を用いて健康記録に正式に記録すべき情報を、本archetypeで記録してはならない。\n\n個人の生年月日の記録に用いてはならない。生年月日の記録には、EVALUATION.birth_summaryの「生年月日」データエレメントを用いること。\n\n個人の生体情報やバイオマーカーの記録に用いてはならない。これらの記録には、それぞれの情報に対応したENTRY archetypeを用いること。

### description/-/keywords
- EN : provider, carer, staff, healthcare professional, relative, next-of-kin, practitioner, witness, friend, neighbour, child, family, sibling, parent, individual
- OLD: 医療提供者 | 介護者 | 職員 | 医療従事者 | 親族 | 近親者 | 医師 | 目撃者 | 友人 | 隣人 | 子 | 家族 | きょうだい | 親 | 個人 | 人 | 氏名 | 連絡先
- NEW: 医療提供者 | 介護者 | 職員 | 医療従事者 | 親族 | 近親者 | 医師 | 目撃者 | 友人 | 隣人 | 子 | 家族 | きょうだい | 同胞 | 親 | 個人 | 人 | 氏名 | 連絡先

### term/at0000/description
- EN : An individual human being.
- OLD: 一人の人間。
- NEW: 一個人。

### term/at0001/description
- EN : The unstructured name for the individual.
- OLD: その人の非構造化の氏名。
- NEW: 個人の氏名（非構造情報）。

### term/at0002/description
- EN : Alternative representation of an individual's complete name by separation into discrete, structured components.
- OLD: その人の完全な氏名を、個別の構造化された構成要素に分けて表す代替の表現。
- NEW: 個人の氏名全体を、姓・名などの独立した構成要素に分けて構造化した表現。非構造情報としての氏名に代わる表現として用いる。

### term/at0002/comment
- EN : Any or all of the structured name elements can be combined together as a text string and represented in the 'Name' data element in this archetype.
- OLD: 構造化された氏名の要素の一部またはすべてをテキスト文字列として結合し、本archetypeの「氏名」データエレメントに表すことができる。
- NEW: 構造化された氏名の要素の一部またはすべてを一つの文字列にまとめ、本archetypeの「氏名」データエレメントに記録することができる。

### term/at0003/comment
- EN : Occurrences for this data element is set to 0..* to allow for more than one Identifier to be recorded. Note that the DV_IDENTIFIER data type contains multiple subcomponents for recording the ID value, type, issuer and assigned. For example - social security number; driver's license; or passport number.
- OLD: このデータエレメントの出現回数は 0..* に設定されており、複数の識別子を記録できる。DV_IDENTIFIER データ型には、ID の値、種類、発行者、割り当て先を記録する複数の下位要素がある点に注意。例：社会保障番号；運転免許証；またはパスポート番号。
- NEW: このデータエレメントの出現回数は 0..* に設定されており、複数の識別子を記録できる。DV_IDENTIFIER データ型には、ID の値、種類、発行者、割り当て先を記録する複数の下位要素がある点に注意。例：社会保障番号・運転免許証・パスポート番号。

### term/at0004/comment
- EN : For example - the copyholder of an advance care record; contact person in an organisation; relative in a family history entry; specimen collector; or witness to a fall or accident. If the individual being described using this archetype is the subject of the health record, then this data element is redundant.
- OLD: 例：事前ケア記録の写し保持者；組織の連絡担当者；家族歴の項目における親族；検体採取者；または転倒や事故の目撃者。本archetypeで記述する人が健康記録の対象者自身である場合、このデータエレメントは冗長になる。
- NEW: 例：事前ケア記録の写し保有者、組織の連絡担当者、家族歴の項目における親族、検体採取者、または転倒や事故の目撃者。本archetypeで記述する人が健康記録の対象者自身である場合、このデータエレメントは冗長になる。

### term/at0005/description
- EN : Details about an address for the individual.
- OLD: その人の住所についての詳細。
- NEW: 個人の詳細な住所。

### term/at0006/text
- EN : Electronic communication
- OLD: 電子的連絡先
- NEW: 電子的な連絡先

### term/at0006/description
- EN : Details about one or more types of electronic communication for the individual.
- OLD: その人の1つ以上の種類の電子的連絡先についての詳細。
- NEW: 個人の電子的な連絡先（1種類以上）の詳細情報。

### term/at0007/description
- EN : Details about the organisational context for the individual.
- OLD: その人の組織上の文脈についての詳細。
- NEW: 個人の所属など、組織との関わりに関する詳細情報。

### term/at0007/comment
- EN : For example: identifying the business or community organisation associated with the 'Role' of the individual.
- OLD: 例：その人の「役割」に関連する事業組織や地域組織の特定。
- NEW: 例：個人の「役割」に関連する企業や地域団体がどこなのかを示す。

### term/at0008/description
- EN : Additional details about the individual.
- OLD: その人についての追加の詳細。
- NEW: 個人に関する追加の詳細情報。

### term/at0009/description
- EN : Photograph of the individual.
- OLD: その人の写真。
- NEW: 個人の写真。

### term/at0010/description
- EN : Additional narrative about the individual not captured in other fields.
- OLD: 他の項目では捉えられない、その人についての追加の記述。
- NEW: 他の項目には収まらない個人についての追加の記述。

### term/at0011/text
- EN : Label
- OLD: ラベル
- NEW: ラベル（識別用の説明）

### term/at0011/description
- EN : A label for the individual.
- OLD: その人に付けるラベル。
- NEW: その人を識別するための説明。

### term/at0011/comment
- EN : For example: 'Neighbour in the house with the red door'.
- OLD: 例：「赤い扉の家の隣人」。
- NEW: 例：「赤い扉の家に住む近所の人」。

## openEHR-EHR-CLUSTER.electronic_communication.v1 — electronic_communication.v1 校正の取り込み（固定電話、追加の詳細情報 ほか）（2026-09-19）

### description/-/use
- EN : Use to record details about a specified type of electronic communication for an individual or an organisation as it is known or understood in the course of clinical documentation. This is commonly ad hoc or when it is not appropriate or possible to use a formal register or index.
- OLD: 臨床記録の作成に際して取得した、個人または組織の特定の種別の電子的な連絡先に関する詳細情報を記録するために用いる。主に、必要に応じて情報を記録する場合や、正式な登録簿やインデックスの利用が適切でない、または利用できない場合を想定している。
- NEW: 臨床記録の作成に際して取得した、個人または組織の特定の種別の電子的な連絡先に関する詳細情報を記録するために用いる。必要となった連絡先をその都度記録する場合や、正式な登録簿やインデックスを利用することが適切でない、または利用できない場合が主に想定されている。

### term/at0006/text
- EN : Telephone (excluding mobile telephone)
- OLD: 電話（携帯電話を除く）
- NEW: 固定電話

### term/at0013/text
- EN : Additional details
- OLD: 追加の詳細
- NEW: 追加の詳細情報

## openEHR-EHR-CLUSTER.person.v1 — electronic_communication.v1 校正の取り込み（固定電話、追加の詳細情報 ほか）（2026-09-19）

### term/at0008/text
- EN : Additional details
- OLD: 追加の詳細
- NEW: 追加の詳細情報

## openEHR-EHR-CLUSTER.organisation.v1 — organisation.v1 校正の取り込み（傘下組織、診療部門、支払機関、要確認 6 件を解消）（2026-09-19）

### description/-/use
- EN : Use to record details of an organisation as they are known or understood in the course of clinical documentation, often ad hoc or when it is not appropriate or possible to use a formal demographic register or index. Examples include:\n- the copyholder of an advanced care record, using the 'Copyholder' SLOT within the EVALUATION.advance_care_directive archetype; or\n- the name and contact details of an organisation providing home care to an individual.\n\nThis archetype has been designed to carry details of formally recognised entities, such as a registered business, a hospital and its recognised 'sub-organisations', such as an operationally separate or specialised satellite clinic or home care service. It may also be used to carry contact information about more informal networks or groups, such as a local community support group.\n\nThis archetype could also be used as a proxy for formal demographic data when reviewing a template with domain experts - for example, an assessment where reviewers would expect to see an organisations' details on an assessment form.
- OLD: 臨床記録の作成に際して取得した、組織に関する詳細情報を記録するために用いる。主に、必要に応じて情報を記録する場合や、正式なデモグラフィック登録簿やインデックスの利用が適切でない、または利用できない場合を想定している。以下のような使用例がある。\n- EVALUATION.advance_care_directive archetypeの「写し保有者」SLOTを用いて、事前ケア記録の写しを保有する組織の情報を記録する；または\n- 個人に在宅ケアを提供する組織の名称と連絡先を記録する。\n\n本archetypeは、登録された事業者や病院、病院の正式な「下部組織」など、正式に認められた組織の詳細情報を記録するために設計されている。下部組織には、運営上独立した分院や専門分野に特化した分院、在宅ケアサービスなどがある。また、地域の支援団体など、より非公式なネットワークや集団の連絡先情報を記録するためにも使用できる。\n\n本archetypeは、対象領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用として使用することもできる。例えば、評価票の冒頭に組織の詳細情報が表示されることをレビュー担当者が想定している場合に、その情報を示すために用いる。
- NEW: 臨床記録の作成に際して取得した、組織に関する詳細情報を記録するために用いる。必要に応じて情報を記録する場合や、正式なデモグラフィック登録簿やインデックスの利用が適切でない、または利用できない場合を主に想定している。以下のような使用例がある。\n- EVALUATION.advance_care_directive archetypeの「写し保有者」SLOTを用いて、事前ケア記録の写しを保有する組織の情報を記録する。\n- 個人に在宅ケアを提供する組織の名称と連絡先を記録する。\n\n本archetypeは、登録された事業者や病院、病院の正式な「傘下組織」など、正式に認められた組織の詳細情報を記録するために設計されている。傘下組織には、運営上独立した分院や専門分野に特化した分院、在宅ケアサービスなどがある。また、地域の支援団体など、より非公式なネットワークや集団の連絡先情報を記録するためにも使用できる。\n\n本archetypeは、対象領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用として使用することもできる。例えば、評価票の冒頭に組織の詳細情報が表示されることをレビュー担当者が想定している場合に、その情報を示すために用いる。

### term/at0000/comment
- EN : For example: a company, institution, association, network, department, community group, healthcare practice group, payer/insurer, care team, or a group of neighbours who provide care or support.
- OLD: 例：企業、機関、協会、ネットワーク、部門、地域団体、診療グループ、支払者・保険者、ケアチーム、またはケアや支援を提供する近隣住民の集まり。
- NEW: 例：企業、機関、協会、ネットワーク、診療部門、地域団体、診療グループ、支払機関・保険者、ケアチーム、またはケアや支援を提供する近隣住民の集まり。

### term/at0021/description
- EN : A larger organisation of which this organisation is a child or subsidiary.
- OLD: この組織を下部組織または子会社として含む、より大きな組織。
- NEW: この組織を傘下組織または子会社として含む、より大きな組織。

## openEHR-EHR-CLUSTER.person.v1 — organisation.v1 校正の取り込み（傘下組織、診療部門、支払機関、要確認 6 件を解消）（2026-09-19）

### description/-/use
- EN : Use to record details of a person as they are known or understood in the course of clinical documentation, often ad hoc or when it is not appropriate or possible to use a formal demographic register or index. Examples include:\n- the copyholder of an advanced care record, using the 'Copyholder' SLOT within the EVALUATION.advance_care_directive archetype;\n- the role and contact details of a named contact person within an organisation, using the 'Contact person' SLOT within the CLUSTER.organisation archetype;\n- details about a relative in a family history record, using the 'Family member details' SLOT within the openEHR-EHR-EVALUATION.family_history archetype; \n- the name of the person who collected a laboratory specimen from a patient, using the 'Specimen collector details' within the CLUSTER.specimen archetype; or\n- a witness to a fall or accident, using the 'Witness' SLOT within the CLUSTER.health_event archetype.\n\nIn most simple clinical recording use cases, the unstructured 'Name' element within the CLUSTER.person archetype will be sufficient to record the name of a person as part of a health record. However, in circumstances where a structured name is necessary or desirable for clinical recording purposes, nest this archetype within the 'Structured name' SLOT in CLUSTER.person archetype. If the CLUSTER.structured_name archetype is nested within the 'Structured name' SLOT, any or all of the data elements can be combined together as a text string and represented in the 'Name' element, as long as they are consistent.\n\nThis archetype could also be used as a proxy for formal demographic data when reviewing a template with domain experts - for example, an assessment where reviewers would expect to see a person's details at the top of the assessment form.
- OLD: 臨床記録の作成に際して取得した、その人に関する詳細情報を記録するために用いる。主に、必要に応じて情報を記録する場合や、正式なデモグラフィック登録簿やインデックスの利用が適切でない、または利用できない場合を想定している。以下のような使用例がある。\n- EVALUATION.advance_care_directive archetypeの「写し保有者」SLOTを用いて、事前ケア記録の写しを保有する人の情報を記録する。\n- CLUSTER.organisation archetypeの「連絡担当者」SLOTを用いて、組織内の特定の連絡担当者の役割と連絡先を記録する。\n- openEHR-EHR-EVALUATION.family_history archetypeの「家族構成員の詳細」SLOTを用いて、家族歴に登場する親族の詳細情報を記録する。 \n- CLUSTER.specimen archetypeの「検体採取者の詳細」を用いて、患者から検査用の検体を採取した人の氏名を記録する。\n- CLUSTER.health_event archetypeの「目撃者」SLOTを用いて、転倒や事故の目撃者の情報を記録する。\n\n臨床記録に人の氏名を記録するだけであれば、多くの場合、CLUSTER.person archetypeの非構造化の「氏名」要素で十分である。ただし、臨床記録の目的上、氏名を構造化して記録することが必要または望ましい場合は、CLUSTER.person archetypeの「構造化された氏名」SLOTにCLUSTER.structured_name archetypeを組み込む。この場合、各データエレメントの一部またはすべてを一つの文字列にまとめ、「氏名」要素に表示することもできる。ただし、構造化された氏名と「氏名」要素の内容が整合している必要がある。\n\n本archetypeは、対象領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用として使用することもできる。例えば、評価票の冒頭にその人の詳細情報が表示されることをレビュー担当者が想定している場合に、その情報を示すために用いる。
- NEW: 臨床記録の作成に際して取得した、その人に関する詳細情報を記録するために用いる。必要に応じて情報を記録する場合や、正式なデモグラフィック登録簿やインデックスの利用が適切でない、または利用できない場合を主に想定している。以下のような使用例がある。\n- EVALUATION.advance_care_directive archetypeの「写し保有者」SLOTを用いて、事前ケア記録の写しを保有する人の情報を記録する。\n- CLUSTER.organisation archetypeの「連絡担当者」SLOTを用いて、組織内の特定の連絡担当者の役割と連絡先を記録する。\n- openEHR-EHR-EVALUATION.family_history archetypeの「家族構成員の詳細」SLOTを用いて、家族歴に登場する親族の詳細情報を記録する。 \n- CLUSTER.specimen archetypeの「検体採取者の詳細」を用いて、患者から検査用の検体を採取した人の氏名を記録する。\n- CLUSTER.health_event archetypeの「目撃者」SLOTを用いて、転倒や事故の目撃者の情報を記録する。\n\n臨床記録に人の氏名を記録するだけであれば、多くの場合、CLUSTER.person archetypeの非構造化の「氏名」要素で十分である。ただし、臨床記録の目的上、氏名を構造化して記録することが必要または望ましい場合は、CLUSTER.person archetypeの「構造化された氏名」SLOTにCLUSTER.structured_name archetypeを組み込む。この場合、各データエレメントの一部またはすべてを一つの文字列にまとめ、「氏名」要素に表示することもできる。ただし、構造化された氏名と「氏名」要素の内容が整合している必要がある。\n\n本archetypeは、対象領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用として使用することもできる。例えば、評価票の冒頭にその人の詳細情報が表示されることをレビュー担当者が想定している場合に、その情報を示すために用いる。

## openEHR-EHR-CLUSTER.symptom_sign.v2 — 校正の取り込み（2026-09-12、履歴は squash 済みのため静的に保存）

### description/-/purpose
- EN : To record details about a single episode of a reported symptom or sign including context, but not details, of previous episodes if appropriate.
- OLD: 報告された症状または徴候の単一のエピソードについて、必要に応じて過去のエピソードの文脈（詳細ではない）を含めて、詳細を記録するため。
- NEW: 報告された症状または徴候の単一のエピソードについて詳細に記録するため。必要に応じて過去のエピソードの（詳細ではない）文脈を含める。

### description/-/use
- EN : Use to record details about a single episode of a symptom or reported sign in an individual, as reported by the individual, parent, care-giver or other party. It may be recorded by a clinician as part of a clinical history record as reported to them, observed by the clinician or self-recorded as part of a clinical questionnaire or personal health record. A complete clinical history or patient story may include varying level of details about multiple episodes of an identified symptom or reported sign, as well as multiple symptoms/signs.\n\nThis archetype has been designed to record the positive presence of the symptom or sign as part of history taking using OBSERVATION.story, or in conjunction with a positive response to OBSERVATION.symptom_sign_screening.\n\nIn the purest sense, symptoms are subjective observations of a physical or mental disturbance and signs are objective observations of the same, as experienced by an individual and reported to the history taker by the same individual or another party. From this logic it follows that we will need two archetypes to record clinical history - one for reported symptoms and another for reported signs. In reality this is impractical as it will require clinical data entry into either one of these models which adds signficant overheads to modellers and those entering data. In addition, there is often overlap in clinical concepts - for example, is previous vomiting or bleeding to be categorised as a symptom or reported sign? In response, this archetype has been specifically designed to provide a single information model that allows for recording of the entire continuum between clearly identifiable symptoms and reported signs.\n\nThis archetype has been intended to be used as a generic pattern for all symptoms and reported signs. The 'Specific details' SLOT can be used to extend the archetype to include additional, specific data elements for more complex symptoms or signs. \n\nThis archetype has been specifically designed to be used in the 'Structured detail' SLOT within the OBSERVATION.story archetype, but can also be used within other OBSERVATION or CLUSTER archetypes and in the 'Associated symptom/sign' or 'Previous episode' SLOT within other instances of this CLUSTER.symptom_sign archetype.
- OLD: 本人、親、介護者、またはその他の関係者から報告された、ある個人における症状または報告された徴候の単一のエピソードの詳細を記録するために用いる。臨床医が報告を受けた病歴の記録の一部として記録することも、臨床医が観察することも、臨床質問票や個人健康記録の一部として本人が自ら記録することもある。完全な病歴や患者の語りには、特定された症状や報告された徴候の複数のエピソードについてさまざまな水準の詳細が含まれることがあり、複数の症状・徴候が含まれることもある。\n\n本archetypeは、OBSERVATION.story を用いた病歴聴取の一部として、または OBSERVATION.symptom_sign_screening での陽性回答と組み合わせて、症状または徴候が存在することを記録するために設計されている。\n\n最も純粋な意味では、症状とは身体的または精神的な変調についての主観的な観察であり、徴候とは同じものについての客観的な観察であって、いずれも本人が経験し、本人または別の関係者から病歴聴取者に報告されるものである。この論理に従えば、病歴を記録するには、報告された症状用と報告された徴候用の2つのarchetypeが必要になる。実際にはこれは非現実的である。臨床データをどちらか一方のモデルに入力する必要が生じ、モデル作成者とデータ入力者に大きな負担を加えるからである。加えて、臨床概念には重なりが多い。例えば、過去の嘔吐や出血は症状と報告された徴候のどちらに分類すべきだろうか。そこで本archetypeは、明確に識別できる症状と報告された徴候の間の連続体全体を記録できる単一の情報モデルを提供するよう、特に設計されている。\n\n本archetypeは、すべての症状と報告された徴候に対する汎用パターンとして使うことを意図している。「詳細記録」SLOT を用いて、より複雑な症状や徴候のための追加の特定データエレメントを含めるようarchetypeを拡張できる。 \n\n本archetypeは、OBSERVATION.story archetype内の「構造化された詳細記録」SLOT で使うために特に設計されているが、他の OBSERVATION や CLUSTER のarchetype内でも、また本 CLUSTER.symptom_sign archetypeの他のインスタンス内の「随伴症状・徴候」または「過去のエピソード」SLOT でも使用できる。
- NEW: 本人、親、介護者、その他の関係者から報告された症状や徴候について、単一のエピソードを詳細に記録するために用いる。臨床医が聴取した内容や自ら観察した内容を病歴として記録する場合にも、本人が問診票や個人健康記録に記入する場合にも使用できる。病歴全体や患者の語りには、複数の異なる症状・徴候だけでなく、同じ症状・徴候に関する複数のエピソードが含まれることがあり、それぞれの記述の詳しさも異なる。\n\n本archetypeは、症状や徴候がある場合に、その内容を詳しく記録するために設計されている。OBSERVATION.storyを用いた病歴聴取の一部として、またはOBSERVATION.symptom_sign_screeningでの「症状・徴候あり」という回答と組み合わせて使用する。\n\n厳密には、症状は心身の変調に関する主観的な観察に基づくものであり、徴候は客観的な観察に基づくものである。いずれも本人が経験したこととして、本人または他者から病歴の聴取者に伝えられる。この区別に従えば、病歴の記録には、報告された症状を記録するarchetypeと、報告された徴候を記録するarchetypeの二つが必要になる。しかし、実際には、臨床データをどちらのモデルに入力するかを判断して使い分けなければならず、モデルの設計者とデータの入力者の双方に大きな負担が生じるため、現実的ではない。また、症状と徴候には、明確に区別しにくい臨床概念もある。例えば、過去に起きた嘔吐や出血は、症状と報告された徴候のどちらに分類すべきだろうか。そこで本archetypeは、明らかな症状から報告された徴候まで、両者の境界に位置するものも含めて、一つの情報モデルで記録できるように設計されている。\n\n本archetypeは、あらゆる症状や報告された徴候を記録するための汎用的なモデルとして用いることを想定している。より複雑な症状や徴候を扱う場合には、「詳細記録」SLOTを用いて、それぞれに特有のデータ項目を追加し、archetypeを拡張できる。 \n\n本archetypeは、OBSERVATION.story archetypeの「構造化された詳細記録」SLOTで使用することを想定して設計されている。他のOBSERVATIONやCLUSTER archetype内でも使用でき、同じCLUSTER.symptom_sign archetypeの別のインスタンスにある「随伴症状・徴候」SLOTや「過去のエピソード」SLOTにも組み込むことができる。

### description/-/misuse
- EN : Not to be used to record screening questionnaire responses about the presence or absence of specific symptoms - use the OBSERVATION.symptom_sign_screening archetype for this purpose. However, this CLUSTER.symptom_sign archetype may be nested within the 'Screening details' SLOT in the OBSERVATION.symptom_sign_screening archetype if it is necessary to extend the questionnaire by recording details about symptom or sign.\n\nNot to be used to record that a symptom or sign was explicitly reported as not present - use CLUSTER.exclusion_symptom_sign carefully for specific purposes where the overheads of recording in this way warrant the additional complexity.\n\nNot to be used for recording objective findings as part of a physical examination - use OBSERVATION.exam and related examination CLUSTER archetypes for this purpose.\n\nNot to be used for diagnoses and problems that form part of a persisting Problem List - use EVALUATION.problem_diagnosis.\n\nNot to be used to record a formal and repeatable severity scale such as VAS or NRS. Use appropriate OBSERVATION archetypes for this purpose.
- OLD: 特定の症状の有無についてのスクリーニング質問票の回答を記録するために用いてはならない。その目的には OBSERVATION.symptom_sign_screening archetypeを用いること。ただし、症状や徴候の詳細を記録して質問票を拡張する必要がある場合は、本 CLUSTER.symptom_sign archetypeを OBSERVATION.symptom_sign_screening archetypeの「スクリーニングの詳細」SLOT に入れ子にしてもよい。\n\n症状や徴候が存在しないと明示的に報告されたことを記録するために用いてはならない。このような記録の負担に見合う追加の複雑さが正当化される特定の目的に限り、CLUSTER.exclusion_symptom_sign を慎重に用いること。\n\n身体診察の一部としての客観的所見を記録するために用いてはならない。その目的には OBSERVATION.exam と関連する診察の CLUSTER archetype群を用いること。\n\n永続的なプロブレムリストの一部をなす診断やプロブレムのために用いてはならない。EVALUATION.problem_diagnosis を用いること。\n\nVAS や NRS のような正式で反復可能な重症度スケールを記録するために用いてはならない。その目的には適切な OBSERVATION archetypeを用いること。
- NEW: 特定の症状の有無を尋ねるスクリーニング問診票への回答は、本archetypeではなく、OBSERVATION.symptom_sign_screening archetypeを用いて記録する。ただし、症状や徴候について詳しく記録できるように問診票を拡張する必要がある場合には、OBSERVATION.symptom_sign_screening archetypeの「スクリーニングの詳細」SLOTに、本CLUSTER.symptom_sign archetypeを組み込むことができる。\n\n症状や徴候がないと明確に伝えられたことを記録する場合には、本archetypeではなく、CLUSTER.exclusion_symptom_signを用いる。ただし、記録の負担や複雑さが増すことを考慮し、それに見合う必要性がある用途に限って慎重に使用する。\n\n身体診察で得られた客観的所見は、本archetypeではなく、OBSERVATION.examと関連する診察用のCLUSTER archetypeを用いて記録する。\n\n継続的に管理するプロブレムリストに含まれる診断やプロブレムは、本archetypeではなく、EVALUATION.problem_diagnosisを用いて記録する。\n\nVASやNRSなど、所定の方法で繰り返し評価できる重症度尺度による評価結果は、本archetypeではなく、適切なOBSERVATION archetypeを用いて記録する。

### term/at0000/description
- EN : Reported observation of a physical or mental disturbance in an individual.
- OLD: ある個人における身体的または精神的な変調についての、報告された観察。
- NEW: 本人の心身の変調について、本人または他者が捉え、伝えた観察内容。

### term/at0021/comment
- EN : Defining values such as mild, moderate or severe in such a way that is applicable to multiple symptoms or signs plus allows multiple users to interpret and record them consistently is not easy. Some organisations extend the value set further with inclusion of additional values such as 'Trivial' and 'Very severe', and/or 'Mild-Moderate' and 'Moderate-Severe', adds to the definitional difficulty and may also worsen inter-recorder reliability issues. Use of 'Life-threatening' and 'Fatal' is also often considered as part of this value set, although from a pure point of view it may actually reflect an outcome rather than a severity. In view of the above, keeping to a well-defined but smaller list is preferred and so the mild/moderate/severe value set is offered, however the choice of other text allows for other value sets to be included at this data element in a template.
- OLD: 軽症、中等症、重症のような値を、複数の症状や徴候に適用でき、かつ複数の利用者が一貫して解釈し記録できるように定義することは容易ではない。組織によっては「ごく軽症」や「非常に重症」、および／または「軽症〜中等症」や「中等症〜重症」のような追加の値を含めて値セットをさらに拡張しているが、これは定義の困難さを増し、記録者間の信頼性の問題を悪化させることもある。「生命を脅かす」や「致死的」もこの値セットの一部としてしばしば検討されるが、純粋な観点からは、それらは重症度ではなく転帰を反映している可能性がある。以上を踏まえ、よく定義された小さなリストにとどめることが望ましいため、軽症／中等症／重症の値セットを提供している。ただし、他のテキストを選択できるので、テンプレートではこのデータエレメントに他の値セットを含めることができる。
- NEW: 軽症」「中等症」「重症」などの値を、さまざまな症状や徴候に適用でき、複数の利用者が一貫した基準で解釈・記録できるように定義するのは容易ではない。組織によっては、「ごく軽症」「非常に重症」や「軽症〜中等症」「中等症〜重症」などを加えて値セットを拡張している。しかし、選択肢を増やすと各値の定義がさらに難しくなり、記録者間で評価が一致しにくくなるおそれもある。「生命を脅かす」や「致死的」をこの値セットに含めることもよく検討されるが、厳密には、これらは重症度ではなく転帰を表している可能性がある。以上を踏まえ、各値の定義を明確にし、選択肢を少数に絞ることが望ましいため、本archetypeでは「軽症」「中等症」「重症」の値セットを用意している。ただし、これら以外のテキストも使用できるため、テンプレートではこのデータエレメントに別の値セットを設定することもできる。

### term/at0028/description
- EN : The duration of this episode of the symptom or sign since initial onset.
- OLD: 最初の発症からの、症状または徴候のこのエピソードの持続期間。
- NEW: 症状または徴候の今回のエピソードにおける、発症からの持続期間。

### term/at0028/comment
- EN : If 'Date/time of onset' and 'Date/time of resolution' are used in systems, this data element may be calculated, or alternatively, be considered redundant in this scenario. The text data type is used for recording preset duration intervals such as '0-7 days, 1-2 weeks, 2 weeks or more'.
- OLD: システムで「発症日時」と「治癒日時」を使う場合、このデータエレメントは計算で求められるか、あるいはこの状況では冗長とみなされることがある。テキストデータ型は、「0〜7日、1〜2週、2週以上」のようなあらかじめ設定された期間区分を記録するために用いる。
- NEW: システムで「発症日時」と「消失日時」を使用している場合、このデータエレメントの値は両者から算出できる。そのため、冗長とみられることもある。テキストデータ型は、「0〜7日」「1〜2週」「2週以上」など、あらかじめ設定された期間区分を記録するために用いる。

### term/at0037/comment
- EN : For example: a text description of the immediate onset of the symptom, activities that worsened or relieved the symptom, whether it is improving or worsening and how it resolved over weeks.
- OLD: 例：症状の発症直後の様子、症状を悪化または軽減させた活動、改善しているか悪化しているか、数週間かけてどのように治癒したかについてのテキスト記述。
- NEW: 例：発症直後の様子、症状を悪化または軽減させた活動、改善しているか悪化しているか、数週間かけてどのように消失したかについてのテキスト記述。

### term/at0146/comment
- EN : In linked clinical systems, it is possible that previous episodes are already recorded within the EHR. Systems can allow the clinician to LINK to relevant previous episodes. However in a system or message without LINKs to existing data or with a new patient, additional instances of the symptom archetype could be included here to represent previous episodes. It is recommended that new instances of the Symptom archetype inserted in this SLOT represent one or many previous episodes to this Symptom instance only.
- OLD: 連携された臨床システムでは、過去のエピソードがすでに EHR 内に記録されていることがある。システムは、臨床医が関連する過去のエピソードに LINK できるようにしてよい。しかし、既存データへの LINK を持たないシステムやメッセージ、あるいは新規の患者の場合には、過去のエピソードを表すために symptom archetypeの追加のインスタンスをここに含めることができる。この SLOT に挿入する Symptom archetypeの新しいインスタンスは、この Symptom インスタンスに対する1つまたは複数の過去のエピソードのみを表すことを推奨する。
- NEW: 連携している臨床システムでは、過去のエピソードがすでに EHR 内に記録されていることがある。その場合、システムは、臨床医が関連する過去のエピソードへの LINK を設定する機能を提供できる。一方、既存データへの LINK がないシステムやメッセージ、あるいは新規患者の場合には、この SLOT に Symptom archetypeのインスタンスを追加して、過去のエピソードを記録できる。追加するインスタンスには、この SLOT を含む Symptom インスタンスに関連する過去のエピソードのみを、1つまたは複数記録することを推奨する。

### term/at0151/description
- EN : Simple body site where the symptom or sign was reported.
- OLD: 症状または徴候が報告された単純な身体部位。
- NEW: 症状または徴候があると報告された身体部位の簡潔な記述。

### term/at0152/comment
- EN : While partial dates are permitted, the exact date and time of onset can be recorded, if appropriate. If this symptom or sign is experienced for the first time or is a re-occurrence, this date is used to represent the onset of this episode. If this symptom or sign is ongoing, this data element may be redundant if it has been recorded previously.
- OLD: 部分的な日付も許容されるが、適切であれば発症の正確な日時を記録できる。この症状または徴候が初めて経験されたものか再発である場合、この日付はこのエピソードの発症を表すために用いる。この症状または徴候が継続中の場合、以前に記録されていればこのデータエレメントは冗長になることがある。
- NEW: 部分的な日付も記録できるが、適切であれば発症の正確な日時を記録できる。初発・再発のいずれの場合も、この日付は今回のエピソードの発症時点を表す。症状または徴候が継続しており、発症日時がすでに記録されている場合、このデータエレメントは冗長とみられることがある。

### term/at0154/description
- EN : Structured detail about the factor associated with the identified symptom or sign.
- OLD: 特定された症状または徴候に関連する因子についての構造化された詳細。
- NEW: 特定された症状または徴候に関連する因子についての構造化された詳細記録。

### term/at0155/comment
- EN : Assessment of impact could consider the severity, duration and frequency of the symptom as well as the type of impact including, but not limited to, functional, social and emotional impact. Occurrences of this data element are set to 0..* to allow multiple types of impact to be separated out in a template if desired. Examples for functional impact from hearing loss may include: 'Difficulty Hearing in Quiet Environment'; 'Difficulty Hearing the TV or Radio'; 'Difficulty Hearing Group Conversation'; and 'Difficulty Hearing on Phone'.
- OLD: 影響の評価では、症状の重症度、持続期間、頻度に加え、機能面、社会面、情緒面の影響を含むがこれらに限らない影響の種類を考慮しうる。このデータエレメントの出現回数は 0..* に設定されており、必要に応じてテンプレートで複数の種類の影響を分けて表せる。難聴による機能面の影響の例：「静かな環境での聞き取りの困難」；「テレビやラジオの聞き取りの困難」；「集団での会話の聞き取りの困難」；および「電話での聞き取りの困難」。
- NEW: 影響の評価では、症状の重症度、持続期間、頻度に加え、機能面、社会面、情緒面など、影響が及ぶ側面も考慮できる。必要に応じてテンプレート内で影響を種類ごとに分けて表せるよう、このデータエレメントの出現回数は 0..* に設定されている。難聴による機能面への影響の例としては、「静かな環境で聞き取りにくい」「テレビやラジオの音声を聞き取りにくい」「複数人での会話を聞き取りにくい」「電話で聞き取りにくい」などが挙げられる。

### term/at0159/description
- EN : The factor decreases the severity or impact of the symptom or sign, but does not fully resolve it.
- OLD: その因子は症状または徴候の重症度または影響を軽減させるが、完全には治癒させない。
- NEW: その因子は症状または徴候の重症度または影響を軽減させるが、完全には消失させない。

### term/at0161/text
- EN : Resolution date/time
- OLD: 治癒日時
- NEW: 消失日時

### term/at0161/comment
- EN : If 'Date/time of onset' and 'Duration' are used in systems, this data element may be calculated, or alternatively, considered redundant. While partial dates are permitted, the exact date and time of resolution can be recorded, if appropriate.
- OLD: システムで「発症日時」と「持続期間」を使う場合、このデータエレメントは計算で求められるか、あるいは冗長とみなされることがある。部分的な日付も許容されるが、適切であれば治癒の正確な日時を記録できる。
- NEW: システムで「発症日時」と「持続期間」を使う場合、このデータエレメントは計算で求められるか、あるいは冗長とみられることがある。部分的な日付も許容されるが、適切であれば消失の正確な日時を記録できる。

### term/at0176/description
- EN : A new episode of the symptom or sign - either the first ever occurrence or a reoccurrence where the previous episode had completely resolved.
- OLD: 症状または徴候の新しいエピソード。初めての発生、または以前のエピソードが完全に治癒した後の再発のいずれか。
- NEW: 症状または徴候の新しいエピソード。初発、または以前のエピソードが完全に消失した後の再発のいずれか。

### term/at0184/text
- EN : Resolved
- OLD: 治癒
- NEW: 消失

### term/at0184/description
- EN : The severity of the symptom or sign has resolved.
- OLD: 症状または徴候は治癒した。
- NEW: 症状または徴候は消失した。

### term/at0188/description
- EN : New occurrence of the same symptom or sign after a previous episode was resolved.
- OLD: 以前のエピソードが治癒した後の、同じ症状または徴候の新たな発生。
- NEW: 以前のエピソードが消失した後の、同じ症状または徴候の新たな発生。

### term/at0190/description
- EN : Details about specified factors that are associated with the resolution of the symptom or sign.
- OLD: 症状または徴候の治癒に関連する特定の因子についての詳細。
- NEW: 症状または徴候の消失に関連する特定の因子についての詳細。

### term/at0194/description
- EN : Structured detail about the factor associated with the identified symptom or sign.
- OLD: 特定された症状または徴候に関連する因子についての構造化された詳細。
- NEW: 特定された症状または徴候に関連する因子についての構造化された詳細記録。

### term/at0195/description
- EN : The interval of time between the occurrence or onset of the factor and resolution of the symptom or sign.
- OLD: 因子の発生または発症から、症状または徴候の治癒までの時間間隔。
- NEW: 因子の発生または発症から、症状または徴候の消失までの時間間隔。

### term/at0197/description
- EN : Structured detail about the factor associated with the identified symptom or sign.
- OLD: 特定された症状または徴候に関連する因子についての構造化された詳細。
- NEW: 特定された症状または徴候に関連する因子についての構造化された詳細記録。

### term/at0200/description
- EN : Date/time when a monophasic, progressive symptom or sign reached its' maximal intensity or functional impact.
- OLD: 単相性で進行性の症状または徴候が、最大の強さまたは機能的影響に達した日時。
- NEW: 単相性で進行性の症状または徴候が、最大の強さまたは機能的に最悪の影響に達した日時。


