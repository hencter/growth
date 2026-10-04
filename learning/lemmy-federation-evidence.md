---
type: Reference
title: "Lemmy 为何采用 ActivityPub —— 证据清单（仪器输出）"
description: 能迁移任务的证据底稿：把 Lemmy 采用 ActivityPub 的公开一手材料集中列出（仓库 issue / 提交 / 发布 / 官方文档），标注每条能支撑 ADR 的哪一栏，以及哪些部分没有证据。
tags: [learning, architecture, adr, lemmy, activitypub, evidence]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T06:05:59+08:00 }
id: "20261005T060559"
status: budding
difficulty: intermediate
domain: learning-and-growth
prerequisites:
  - "[[adr-001-rust-choice]]"
related:
  - "[[adr-001-rust-choice|ADR-001：论坛后端选型采用 Rust]]"
  - "[[architecture-vocabulary-from-your-answers|你的判断力已经有名字了]]"
  - "[[system-architect-t1-sprint|S-1 起点诊断运行单]]"
sources:
  - id: lemmy-issue-1
    resource: "https://github.com/LemmyNet/lemmy/issues/1"
    title: "Lemmy #1 Prismo（2019-02-14，Nutomic）"
  - id: lemmy-issue-3
    resource: "https://github.com/LemmyNet/lemmy/issues/3"
    title: "Lemmy #3 Build ActivityPUB API（2019-02-25，dessalines）"
  - id: apub-outline
    resource: "https://github.com/LemmyNet/lemmy/blob/main/docs/apub_api_outline.md"
    title: "docs/apub_api_outline.md（初版提交 2019-05-15「Adding API docs for app developers」）"
  - id: lemmy-issue-145
    resource: "https://github.com/LemmyNet/lemmy/issues/145"
    title: "Lemmy #145 Federation（2019-05-05，dessalines；16 条评论）"
  - id: lemmy-docs-fed
    resource: "https://github.com/LemmyNet/lemmy-docs/blob/main/src/contributors/05-federation.md"
    title: "官方贡献者文档 05-federation.md（Group/Person/Page/Note 映射）"
  - id: prismo
    resource: "https://github.com/mbajur/prismo"
    title: "Prismo — 「Federated link aggregation powered by ActivityPub」"
  - id: wiki-ap
    resource: "https://en.wikipedia.org/wiki/ActivityPub"
    title: "ActivityPub（W3C 标准，2018-01-23；为应对 OStatus 复杂度而生）"
confidence: 0.8
summary: >
  能迁移任务的证据底稿：Lemmy 采用 ActivityPub 有强一手证据（原始方法文档、从 2019-02 起的 issue、官方文档至今仍在用 Group/Person/Page/Note 映射），但"为什么不是 OStatus/自研协议"在 2019 年**没有记录在案的比较**——这一栏必须由学习者标 [推断]。
---

# Lemmy 为何采用 ActivityPub —— 证据清单（仪器输出）

> **这是仪器输出的底稿，不是 ADR。** 判断栏（境 / 择 / 存 / 果 / 备选 / 推翻条件）必须由学习者自己写；本清单只负责"哪句话有出处、哪句话没有"。检索方式：`gh api` + 维基百科（`web_fetch` 在本环境被 DNS 策略拦截）。

## 一、时间线（全部可核查）

| 日期 | 事实 | 出处 |
|---|---|---|
| 2019-02-14 | 项目创建，仓库名 **`rust-reddit-fediverse`**（描述：A decentralised discussion platform for communities） | GitHub API `repos/dessalines/rust-reddit-fediverse` |
| 2019-02-14 | **#1「Prismo」**：Nutomic 指出"已有几乎同类的项目"—— `prismo.news` | [[lemmy-issue-1]] |
| 2019-02-25 | **#3「Build ActivityPUB API」**，正文直接链接前身仓库的 `API.md` | [[lemmy-issue-3]] |
| 2019-02-25 | `API.md` 首次提交，提交信息：**「Initial outline of activitypub API」** | git 历史（`commits?path=API.md`） |
| 2019-05-05 | **#145「Federation」**：生产前置清单；**"Our primary goal is to federate among Lemmy instances. Federation with other implementations (eg Mastodon or Pleroma) will come after that."** | [[lemmy-issue-145]] |
| 2019-05-15 | `docs/apub_api_outline.md` 初版提交；开头一句就是**方法**：*"Start with the [reddit API], and find [Activitypub vocab] to match it."* | [[apub-outline]] |
| 2019-08-18 | **#212** 要求提交 `activitypub.rocks` 的一致性实现报告；**#215** 用户质问"我是 fediverse 应用，为什么不能用我实例的账号评论" | GitHub #212 / #215 |
| 2019-10-09 | **#145 评论（poVoq）**：提出社区建模应改用"从 GNU Social 时代就有、Friendica 与 Hubzilla 已实现"的既有方法 | 同上 |
| 2019-12-01 | **#145 评论（Nutomic）**：告知已有一个现成的 Rust ActivityPub 库（crates.io） | 同上 |
| 2019-12-02 | **#145 评论（dessalines）**：*"The hard thing I'm running into now is trying to get every piece of information jammed into the activitypub vocab."*（并贴出他选的 2 个 actor） | 同上 |
| 2019-12-31 | **#145 评论（StaticallyTypedRice）**：联邦是"挡在 Lemmy 与实际使用之间的最大障碍" | 同上 |
| 2020-03-05 → 04-11 | **#578** 只读联邦实施方案 → **#633** "ready to merge"；2020-04-20 **#647** "We now have basic, working federation" | GitHub #578 / #633 / #647 |
| 2020-04 | 联邦进入发布线（v0.6.x 附近；release notes 未逐条标注 → **标 [推断]**） | releases 列表 |
| 2021-11-01 | **#1874**：为防"**像 0.13 那样**造成破坏性的联邦变更"而加协议测试 | GitHub #1874 |
| 2026-10-05（抓取日） | 官方文档仍写：*"Lemmy uses the ActivityPub protocol for communication between servers"*，映射仍是 **Community=Group · User=Person · Post=Page · Comment=Note**；通用逻辑抽成 `activitypub-federation` 库；社区联邦对应 **FEP-1b12** | [[lemmy-docs-fed]] |

## 二、每条证据能支撑 ADR 的哪一栏（**这里只分类，不下判断**）

| 证据 | 可能支撑的栏 | 备注 |
|---|---|---|
| 仓库名含 `fediverse` + #3 在项目第 11 天就开"Build ActivityPUB API" | **境 / 择** | 说明这不是后期追加，而是**立项前提** |
| `apub_api_outline.md` 的方法句（拿 Reddit API 去匹配 ActivityPub 词表） | **择 / 果** | 决策的**做法**有据可查 |
| #145 的"Lemmy 之间先联邦、Mastodon/Pleroma 之后" | **境 / 择 / 果** | 明确的**排序决策**（先后取舍） |
| #1 Prismo（同类项目已存在，且其描述为 "Federated link aggregation **powered by ActivityPub**"） | **备选 / 境** | **自建 vs 采用现成**的备选；且**现成那个也用 ActivityPub** |
| #145 评论 poVoq（GNU Social / Friendica / Hubzilla 的既有社区建模方法） | **备选** | 2019 年**唯一**记录在案的替代方案讨论 |
| #145 评论 Nutomic（已有 Rust ActivityPub 库） | **备选** | 用现成库 vs 自己实现 |
| #212（一致性报告）+ #215（跨实例使用期待） | **境 / 果** | 外部标准压力与用户预期 |
| dessalines："难以把每一样信息都塞进 activitypub 词表" | **果（代价）** | 决策的**真实摩擦**第一手记录 |
| #1874（0.13 的破坏性联邦变更） | **果（代价）** | 标准化带来的**兼容成本** |
| 官方文档至今仍用该映射 + 抽出可复用库 | **存 / 果（好处）** | 决策**仍在生效**，且带来了复用收益 |
| 维基百科：ActivityPub 是 W3C 标准（2018-01-23 发布），因 **OStatus 过于复杂**而诞生；采用浪潮来自原本用 OStatus 的软件（Mastodon、GNU social、Pleroma） | **境** | 外部生态背景（**二手**，标注来源） |

## 三、**没有**证据支持的部分（学习者必须标 `[推断]` 或不写）

1. **为什么不是 OStatus / diaspora / Zot / 自研协议**：2019 年**没有任何记录在案的协议比较**（仓库内搜索 `OStatus` 的命中全部在 2023 年之后；`custom protocol` 命中 0）。→ **"我们比较过若干协议"这句话，在这个案子里没有出处。**
2. **决策者的私人理由**：dessalines / Nutomic 的博客、聊天、Reddit 发言**未纳入本清单**（本清单只用仓库与官方文档）。
3. **成本数据**：开发工时、联邦运维成本、0.13 破坏性变更的实际代价——**无量化证据**。
4. **"Lemmy-to-Lemmy 先行" 的后续代价**：跨实现互操作问题的量化——**无证据**。

## 四、留给学习者的判断题（不是我替你答）

1. 这条决策的**境**，用哪 3 条约束能写清？（提示：立项时的生态位置、标准成熟度、单人/小团队资源）
2. **备选栏**能填哪些？（提示：至少有"用 Prismo"与"自研协议"两条，但后者**没有文字出处**——你要怎么标？）
3. **果**里除了好处，代价有哪些有一手证据？（提示：词表映射的摩擦、0.13 的破坏性变更）
4. **推翻条件**：如果今天要做同名决策，什么情况会让你选别的？（提示：FEP-1b12 这类**提案**的存在本身说明联邦模型仍在演化）
5. 这份清单里有**两处**是我（师友）的推断而非原文——你能指出是哪两处吗？

## Provenance

全部条目为 2026-10-05 通过 `gh api` / `gh issue view` 实测抓取（仓库 issue 正文与评论、git 提交历史、release 列表、官方文档原始文件），以及维基百科两条目（二手，已标注）。**本清单不含对"境/择/存/果"的判断**——那是学习者的交付物。清单自身的两处推断已在第四节第 5 问中留作练习。
