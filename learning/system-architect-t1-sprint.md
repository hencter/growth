---
type: Tutorial
title: "架构决策表达 · 首个可验证对象：ADR"
description: 方法验证跑（小事物优先）：3.5 小时内真正学会「写一份可用的架构决策记录」，并用现场产出的 ADR 逐条检验「真正学会」五条标准。
tags: [learning, rdep-run, adr, architecture, pilot]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T06:05:00+08:00 }
id: "20261005T060500"
status: budding
difficulty: beginner
domain: learning-and-growth
prerequisites:
  - "[[rapid-domain-entry-protocol]]"
related:
  - "[[rapid-domain-entry-protocol|Rapid Domain Entry Protocol]]"
  - "[[rapid-domain-entry-worksheet|Rapid Domain Entry Worksheet]]"
  - "[[learning-acceleration-loop|Learning Acceleration Loop]]"
  - "[[output-based-retention|Output-Based Retention]]"
  - "[[investigation-before-judgement|Investigation Before Judgement]]"
sources:
  - id: nygard-2011
    resource: "https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions"
    title: "Michael Nygard — Documenting Architecture Decisions (2011-11-15)｜ADR 原始出处，2026-10-05 实测 HTTP 200"
  - id: adr-github
    resource: "https://adr.github.io/"
    title: "Architecture Decision Records（社区站，2026-10-05 实测 HTTP 200）"
rdep_run: true
rdep_field: "架构决策表达 · 首个可验证对象（ADR）"
rdep_depth: "T0+ · 方法验证跑"
rdep_budget_hours: 3.5
rdep_started: 2026-10-05
rdep_deadline: 2026-10-07
rdep_next: "S3：挑一个你已经做出的真实决策，写 1-2 页 ADR（≥2 备选 + 代价 + 可度量后果 + 推翻条件），然后接受 grill-me 逐条拷问"
rdep_stages:
  - { id: "S0", name: "定义可验证对象", hours: 0.25, status: done, skills: "investigation-first · concentrate-forces", artifact: "契约：对象=一份可用 ADR；交付=真实决策的 1-2 页 ADR + 一次拷问修订" }
  - { id: "S1", name: "迷你地图", hours: 0.5, status: doing, skills: "investigation-first · karlmarx-skill", artifact: "四段结构 + 好/坏判据（本页 S1 节，取自 Nygard 原文）" }
  - { id: "S2", name: "术语", hours: 0.25, status: todo, skills: "cross-tag-method · obsidian-markdown", artifact: "12 条术语：ADR / 权衡 / 质量属性 / superseded / 备选方案 …" }
  - { id: "S3", name: "复现：真写一份 ADR", hours: 1.0, status: todo, skills: "practice-cognition · grill-me", artifact: "你自己的真实决策 → 1-2 页 ADR（本跑唯一硬产出）" }
  - { id: "S4", name: "真实分歧", hours: 0.25, status: todo, skills: "contradiction-analysis · zoom-out", artifact: "ADR 的三个工程争论：粒度 / 何时算已决定 / 与设计文档的关系" }
  - { id: "S5", name: "拷问与修订", hours: 1.0, status: todo, skills: "grill-me · criticism-self-criticism", artifact: "被逐条拷问 → 修订版 ADR + 记录被指出的问题 ≥2 条" }
  - { id: "S6", name: "抗遗忘", hours: 0.25, status: todo, skills: "self-evolution · auto-commit", artifact: "ADR 入库 + 第 3/10/30 天复习排程" }
rdep_mastery:
  - { criterion: "能提问", status: todo, evidence: "写出这个决策的下一个待验证问题（推翻条件）" }
  - { criterion: "能判断", status: todo, evidence: "指出一份别人的 ADR 里哪条是「假权衡」——只有好处、没有代价" }
  - { criterion: "能迁移", status: todo, evidence: "对另一个完全不同的决策再写一份 ≤300 字 ADR（不是本次练手那个）" }
  - { criterion: "能教", status: todo, evidence: "给一个人讲清四段结构 + 为什么必须写备选，并扛住追问" }
  - { criterion: "知边界", status: todo, evidence: "写下这份 ADR 明确不覆盖什么，以及你最没把握的一处" }
confidence: 0.8
summary: >
  方法验证跑：不考证书、不学工具链，3.5 小时把「写一份可用 ADR」真正学会——用你自己已做出的一个真实决策做复现，再用 grill-me 逐条拷问，最后用五条行为标准（能提问/能判断/能迁移/能教/知边界）判定是「学会」还是只是「熟悉」。
---

# 架构决策表达 · 首个可验证对象：ADR

> **为什么先拿这个「小东西」**：五条「真正学会」标准要能被检验，对象必须**小到一次能跑完、又有真实产物**。ADR 正好符合：3.5 小时、1–2 页产物、能迁移到你每个项目、还能被人当场挑刺。

## S0 · 契约

| 项 | 内容 |
|---|---|
| 对象 | **一份可用的架构决策记录（ADR）**——不是「架构」这个大领域，也不是任何考试 |
| 交付物 | 为**你已经做出的一个真实决策**写 1–2 页 ADR，并交给我按 `grill-me` 逐条拷问后的修订版 |
| 具名读者 | ① 六个月后的你自己 ② 一个会挑刺的人（我） |
| 预算 / 死线 | **3.5 h / 48 小时**（2026-10-05 → 2026-10-07） |
| 本轮明确不做 | 工具链（adr-tools 等）、文档体系设计、模板美学、考试 |
| 开放式问题 | **「一个已经做出的决定，怎么写才能让未来的我看懂当时为什么这么选、以及什么时候该推翻它？」** |

## S1 · 迷你地图（进行中，取自 Nygard 2011 原文，已实测可读）

**四段结构**（原文顺序）：

| 段 | 写什么 | 原文要点 |
|---|---|---|
| **Context** | 迫使这个决定出现的力量与约束（陈述事实，语气中立） | 「描述我们面对的力量」——不是理由，是处境 |
| **Decision** | 我们的选择 | 「**We will …**」主动语态、完整句 |
| **Status** | 这条决定还算不算数 | `proposed` / `accepted` / `deprecated` / `superseded` |
| **Consequences** | 应用这个决定之后的语境 | 「**所有**后果都要列出来」——不只是好的 |

**四条原文纪律**
1. **1–2 页**——写长就没人读了。
2. **当作写给未来开发者的一封信**——所以行文要能读，不是流水账清单。
3. **决定被推翻时保留旧记录，标 `superseded` 并指向替代者**——历史本身是资产（知道"曾经这么决定过"仍然有价值）。
4. **备选方案与代价必须写明**——否则读者无法判断这个决定是否还成立。

**好 / 坏判据**（下面 4 行是我的提炼，属 `[推断]`，不冒充原文）：

| ✅ 好 ADR | ❌ 坏 ADR |
|---|---|
| Context 里全是**约束**（成本/团队/现网/时间） | Context 里是**推销词**（"这个方案更先进"） |
| Decision 一句话可执行（"我们将……"） | Decision 是教程或愿望 |
| Consequences 里有**代价**、有**可度量后果**、有**推翻条件** | Consequences 只写好处（= 假权衡） |
| 有 Status，被推翻时留旧记录 | 没有 Status（读者不知道还算不算数），旧的被删掉 |

## S2 · 术语（12 条，自己写定义）

`ADR` · `Context / Decision / Status / Consequences` · `trade-off（权衡）` · `quality attribute（质量属性）` · `alternative（备选方案）` · `consequence（后果，含代价）` · `superseded / deprecated` · `reversibility（可逆性）` · `constraint（约束）` · `stakeholder（干系人）` · `fitness function（适应度函数）` · `technical debt（技术债）`

> 规则：每条一句**你自己的话**，写不出来就是还没学会；这步站点不替你做。

## S3 · 复现规格（本跑唯一硬产出）

```text
选材：你已经做出过的一个真实决策（例：某项目用不用某技术/某结构、自研还是现成、单体还是拆分）
产出：1-2 页 ADR，中文可，四段齐全
先声明的通过标准（先写，做完再比）：
  □ Context 里的约束 ≥3 条，且无推销词
  □ Decision 用「我们将……」一句话说清
  □ 备选方案 ≥2 个，且每个都写出代价
  □ Consequences 含：代价 ≥1 · 可度量后果 ≥1 · 推翻条件 ≥1
  □ 全文 ≤2 页
  □ 有 Status
三条不及格即整份不通过：备选 <2 / 没有任何代价 / 没有推翻条件
不通过时：补齐 → 重写（最多两次）；两次不过 → 记录卡在哪一段，回到 S1 重读四段结构
```

## S5 · 拷问协议（`grill-me` 执行）

我按该技能规程：**一次只问一个问题、每个问题附我的建议答案、顺着决策树逐条走到底**，直到你的 ADR 扛住追问或暴露缺口。典型追问链：

1. 这个决策当时**真的是被什么东西逼出来的**？写进 Context 的是约束还是理由？
2. 备选方案为什么被否？**代价**写了吗，还是只写了缺点？
3. 后果里哪一条是**可度量**的？谁在什么时候能测到？
4. **什么事件出现，你会推翻它？** 写下来了吗？
5. 六个月后的你读到这份 ADR，**第一句会误解什么**？
6. 这条决定**可逆吗**？可逆性有没有改变你当初该不该这么决定？

## 7 段排期（3.5 h / 48h 内）

| 时段 | 阶段 | 交付 |
|---|---|---|
| T+0 | S0 0.25h | 契约（本页） |
| T+0.25 | S1 0.5h | 四段结构与好坏判据（本页 S1 节，已交） |
| T+1 | S2 0.25h | 12 条术语（自己写） |
| T+1.25 | **S3 1.0h** | **你的真实 ADR（闸门）** |
| T+2.25 | S4 0.25h | 三个真实争论 |
| T+2.5 | **S5 1.0h** | 被拷问 → 修订版 + 记录问题 ≥2 条 |
| T+3.5 | S6 0.25h | 入库 + 复习排程 + 五条标准判定 |

**压缩优先级**：S3 产出 > S5 拷问修订 > S2 术语 > S4 争论 > S1 地图 > S6 收尾（S0 的 15 分钟不可省）。

## 五条标准怎么判定（本跑的核心目的）

跑完不是看"我读完了没有"，而是逐条**演示**：

| 标准 | 本跑的演示动作 | 判定 |
|---|---|---|
| **能提问** | 写出推翻条件（S3 里的「什么情况我会改主意」） | 有 → 过 |
| **能判断** | 找一份别人的 ADR，指出其中**只有好处没有代价**的那一条 | 指得出 → 过 |
| **能迁移** | 换个决策再写 ≤300 字（不做完整版） | 写得出 → 过 |
| **能教** | 讲清四段 + 为什么必须写备选，并接住追问 | 讲得住 → 过 |
| **知边界** | 写出这份 ADR 不覆盖什么 + 你最没把握的一处 | 写得出 → 过 |

**任一不过 → 本轮结论是「熟悉」，不是「学会」**——这个结论要如实写下来（它决定下一轮是加练还是往下走）。

## See Also

- [[rapid-domain-entry-protocol|Rapid Domain Entry Protocol]] — 本跑遵循的协议（含五条标准与技能路由）
- [[rapid-domain-entry-worksheet|Rapid Domain Entry Worksheet]] — 填空表
- [[output-based-retention|Output-Based Retention]] — 为什么 S3/S5 是闸门
- [[investigation-before-judgement|Investigation Before Judgement]] — Context 段「只写约束、不写理由」的纪律来源
- [[learning-acceleration-loop|Learning Acceleration Loop]] — 回路本体

## 中文速览

- **对象**：写一份可用的 **ADR（架构决策记录）**——小、有真实产物、能迁移、能被当场挑刺。
- **四段**：Context（只写约束）/ Decision（「我们将……」）/ Status（proposed·accepted·deprecated·**superseded**）/ Consequences（**所有**后果，含代价）。原文纪律：**1–2 页**、**写给未来的开发者**、**被推翻时保留旧记录**。
- **S3 是唯一硬闸门**：拿你自己**已经做出**的真实决策，写 1–2 页；备选 ≥2 且各有代价、有可度量后果、有推翻条件。**三条不及格直接不通过**：备选 <2 / 没有代价 / 没有推翻条件。
- **S5 由 `grill-me` 执行**：一次一个问题、附建议答案、逐条走完决策树。
- **本跑真正的目的**：用这个小东西**检验五条标准**（能提问/能判断/能迁移/能教/知边界）；任一不过，结论就是「熟悉」而不是「学会」。

## Provenance

四段结构、`We will …` 主动语态、1–2 页、superseded 保留旧记录等**均为 Nygard 2011 原文实测内容**（2026-10-05 抓取，HTTP 200）。「好/坏判据」四行是本库提炼（`[推断]`）。上一版曾引用 SEI ATAM 页面，**实测取不到 → 已撤除引用**（不核实不引用）。
