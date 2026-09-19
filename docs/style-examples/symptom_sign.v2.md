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

