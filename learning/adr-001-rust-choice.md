---
type: Reference
title: "ADR-001：论坛后端选型采用 Rust"
description: 学习者第一条真实架构决策的 ADR：Context 为生态不完善与 token 成本敏感，Decision 为选 Rust，Status 已 accepted；推翻条件待补（拷问 Q4）。
tags: [learning, architecture, adr, decision]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T07:35:00+08:00 }
id: "20261005T073500"
status: budding
difficulty: beginner
domain: learning-and-growth
prerequisites:
  - "[[architecture-vocabulary-from-your-answers]]"
related:
  - "[[architecture-vocabulary-from-your-answers|你的判断力已经有名字了]]"
  - "[[system-architect-t1-sprint|S-1 起点诊断运行单]]"
  - "[[architecture-what-counts|什么算架构（第一课）]]"
sources:
  - id: learner-answer-1
    resource: "Scope: this session — learner's own words (2026-10-05): 「当初我的选型选择的是 rust 的生态链接，我也接受承担 rust 的生态不完善带来的大量的 token 消耗」"
    title: "Learner's decision statement (verbatim)"
  - id: his-own-arch-doc
    resource: "Scope: learner's Note vault — 智能体论坛系统架构框架.md (its tech-stack section names FastAPI)"
    title: "Learner's own architecture document — and its discrepancy with the decision"
confidence: 0.8
summary: >
  把学习者的第一条真实架构决策写成标准 ADR：Context（Rust 生态不完善 + token 成本敏感）、Decision（采用 Rust 生态）、Status（accepted，2026-10-05 学习者确认）、Consequences（token 开销、改造累、内存占用低）、推翻条件待补。
---

# ADR-001：论坛后端选型采用 Rust

> **这是什么**：ADR（架构决策记录）= 把一条「很难改的决策」写成四段，让六个月后的自己和别人都能看懂当时为什么这么选、以及什么时候该推翻它。本页由师友代拟结构，**内容全部来自学习者自己的话**；未填处显式标 ⬜，不替他编。

## Context（迫使我们做决定的力量与约束）

1. 社区论坛的技术架构**改动代价很高**——选型一旦定下，后续大量工作都压在这个选择上。
2. 选型时面对的 **Rust 生态不完善**：库、示例、可复用方案少于更成熟的生态。
3. 本项目以 **AI 编码代理**为主要生产力，因此「生态不完善」的直接代价以 **token 消耗**形式出现（需要更多检索、试错与自写代码）。
4. 对 **运行成本（内存/算力）** 敏感：Rust 构建出的常驻内存约 **200MB**。

> 注：第 1–4 条均为**约束**（事实与限制），不是"Rust 更先进"这类推销词。

## Decision（我们的选择）

**我们将论坛后端的技术栈建立在 Rust 生态之上**，并**显式接受**由此带来的生态不完善成本（表现为更高的 token 消耗与更高的改造摩擦）。

## Status

**accepted**（2026-10-05 由学习者确认；此前为 proposed）

## Consequences（应用这个决定之后的世界）

| 类型 | 内容 | 来源 |
|---|---|---|
| 代价 | 生态不完善 → **大量 token 消耗** | 学习者原话 |
| 代价 | 后续**改造非常累** | 学习者原话 |
| 好处 | 内存占用低（约 200MB） | 学习者原话 |
| 好处 | 算力不再是第一瓶颈（容量侧留有余量） | 学习者第 2 条回答的推论 |
| 风险 | 成本敏感 + 生态不完善 → **边际成本被放大**；一旦发帖触发大量 Agent 回复，token 成本随帖子量非线性上升 | 学习者第 2 条回答 |
| ⬜ 推翻条件 | **待补**（拷问 Q4：什么事件出现你会放弃 Rust？） | — |

## 备份方案（Alternatives）

⬜ **待补**（拷问 Q1）：当时认真比较过哪些备选？各自为什么被否？代价写了吗？

> 一份没有备选方案的 ADR 不是决策记录，是公告。这一格空着，本 ADR 就不算完成。

## 与自有文档的不一致（拷问 Q1 的证据）

学习者自己的架构文档 `智能体论坛系统架构框架.md` 在「技术架构分层」一节写的是 **FastAPI（Python）**，而本次决策说选型是 **Rust**。两者至少有一个已过时：
- 若 Rust 为准 → 文档应更新或标记 `superseded`（否则半年后它会误导作者本人）；
- 若文档为准 → 那么"选型 Rust"是尚未落地的意图，`Status` 应为 `proposed` 而非 `accepted`。

**这个不一致本身就是"能书面辩护"的第一个训练点**：文档与决策必须对得上，否则记录失去意义。

## 拷问记录（grill-me，一次一问）

| # | 问题 | 我的建议答案 | 学习者回答 | 结论 |
|---|---|---|---|---|
| Q1 | 当时比较过哪些备选？各自为什么被否？以及：文档写 FastAPI、决策说 Rust，哪个是真的？ | 文档是早期方案稿（`draft`），实际选型转向 Rust；若如此应更新文档或标 superseded | ⬜ 待答 | 待答 |
| Q2 | 备选被否时的**代价**写下来了吗，还是只写了缺点？ | 待 Q1 后展开 | ⬜ | 待答 |
| Q3 | 后果里哪一条是**可度量**的？谁在什么时候能测到？ | 建议：¥/发帖、¥/Agent 回复、峰值内存 | ⬜ | 待答 |
| Q4 | **什么事件出现你会推翻它？** | 建议：若 token 成本在真实用户量下超过 X ¥/月，或生态缺件导致某个核心功能需自研超过 Y 人日 | ⬜ | 待答 |
| Q5 | 六个月后的你读到它，第一句会误解什么？ | 建议：会误以为"token 消耗"是坏事——其实它是**主动买来的** | ⬜ | 待答 |
| Q6 | 这条决定**可逆吗**？可逆性改变你当初该不该这么决定吗？ | 建议：不可逆（改写后端语言代价极高），因此本该在选型前把「推翻条件」写死在纸面上 | ⬜ | 待答 |

## See Also

- [[architecture-vocabulary-from-your-answers|你的判断力已经有名字了]] — 本 ADR 的内容如何对应标准词汇
- [[architecture-what-counts|什么算架构（第一课）]] — 承重墙：选型就是最典型的承重墙
- [[system-architect-t1-sprint|S-1 起点诊断运行单]] — 本 ADR 是 S3 的唯一硬产出

## 中文速览

- **ADR-001**：Context＝改动代价高 + Rust 生态不完善 + token 成本敏感 + 内存敏感；Decision＝采用 Rust 生态；**Status＝accepted**；Consequences＝token 开销、改造累、内存低（约 200MB）。
- **还缺三格**：备选方案（Q1）· 可度量后果（Q3）· **推翻条件（Q4）**。
- **已发现一个文档不一致**：他自己那份架构文档写的是 **FastAPI**，而决策是 **Rust**——两者必须对得上，这是"能书面辩护"的第一个训练点。
- **拷问按 `grill-me` 一次一问**，每问附我的建议答案；**他能反驳我的建议答案是加分**。

## Provenance

Decision/Context/Consequences 全部来自学习者 2026-10-05 会话原话（第 1、2 条回答）；Status 由其本人确认（`accepted`）。「与自有文档不一致」一节基于其 Note 库 `智能体论坛系统架构框架.md` 原文（只读，未改写）。师友仅负责结构化与提问，**未代填任何学习者未说过的内容**。
