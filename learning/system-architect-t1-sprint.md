---
type: Tutorial
title: "系统架构 · T1 能力冲刺运行单"
description: RDEP 首个领域运行（能力向，非应试）：7 天 9.5 小时，产出一份可评审的架构设计与一次设计评审。站点「学习进度」看板读本页 frontmatter。
tags: [learning, rdep-run, system-architecture, capability]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T05:40:00+08:00 }
id: "20261005T054000"
status: budding
difficulty: intermediate
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
  - id: own-projects
    resource: "Scope: owner's real projects available as cases — Note vault 10_Projects/DoggyArium（论坛社区项目架构文档）, 微微电商对接, 通天道论坛"
    title: "Owner's real systems (case material for S3)"
  - id: sei-atam
    resource: "https://www.sei.cmu.edu/architecture/tools/evaluate/atam.cfm"
    title: "SEI — Architecture Tradeoff Analysis Method (ATAM)"
rdep_run: true
rdep_field: "系统架构（能力向 · 非应试）"
rdep_depth: "T1"
rdep_budget_hours: 9.5
rdep_started: 2026-10-05
rdep_deadline: 2026-10-12
rdep_next: "S1：挑一个真实系统当靶子（先加载 investigation-first），把它的质量属性与约束压成一页五格"
rdep_stages:
  - { id: "S0", name: "定义能力靶子", hours: 0.5, status: done, skills: "investigation-first · concentrate-forces", artifact: "契约：靶子=真实系统的架构决策（非考试）；交付物=可评审架构设计 + 一次设计评审" }
  - { id: "S1", name: "领域地图", hours: 2.0, status: doing, skills: "investigation-first · overall-planning · karlmarx-skill", artifact: "一页五格：架构风格 · 质量属性 · 视图 · 评估方法 · 真实争论" }
  - { id: "S2", name: "术语与语言", hours: 1.5, status: todo, skills: "cross-tag-method · obsidian-markdown", artifact: "30 条：风格 / 质量属性 / 权衡点 / 敏感点 / 风险点 / 视图（自己写定义）" }
  - { id: "S3", name: "复现：真做一次设计", hours: 2.5, status: todo, skills: "practice-cognition · grill-me", artifact: "对真实模块做架构推演：质量属性场景 → 风格选择 → 视图 → ATAM 自查" }
  - { id: "S4", name: "前沿分歧", hours: 1.0, status: todo, skills: "contradiction-analysis · zoom-out · mass-line", artifact: "2-3 个真实工程争论（微服务边界 / DDD 限界上下文 / 一致性策略）及定论条件" }
  - { id: "S5", name: "产出与评审", hours: 1.5, status: todo, skills: "criticism-self-criticism · minimalist-review", artifact: "一份架构设计说明 + 一次真实评审；对照「真正学会」五条标准自检" }
  - { id: "S6", name: "抗遗忘", hours: 0.5, status: todo, skills: "self-evolution · nova-kb · auto-commit", artifact: "第 3/10/30 天检索复习 + 三件产物入库" }
confidence: 0.7
summary: >
  能力向 T1 运行单：不考证书、不做题、不背考纲——7 天 9.5 小时内，用一个你自己的真实系统当靶子，走完「质量属性 → 架构风格 → 视图 → 权衡 → 评审」的完整推演，产出可被评审的架构设计与一次真实评审。
---

# 系统架构 · T1 能力冲刺运行单

> **不考试。** 这轮的目标是**能力证据**：你能对一个真实系统独立产出架构决策，并说清它牺牲了什么。
> 本页是 Hugo 站点「学习进度」看板的**唯一数据源**——改 `rdep_stages` 里一行，站点进度条自动更新。

## S0 · 契约（已重定）

| 项 | 内容 |
|---|---|
| 领域 | **系统架构**（能力向：软件系统的结构决策、质量属性权衡、演进）——**与任何考试无关** |
| 交付物 | ① 一份**可评审的架构设计说明**（真实系统的某个切面：风格选择 + 质量属性权衡 + 视图 + 演进路径） ② 一次**设计评审**（讲给一个具体的人，或接受我的对抗性评审） |
| 具名读者 | ① 你自己在真实项目里的决策 ② 一个会挑刺的人：同事 / 合作方 / 我 |
| 档位 / 死线 | **T1 · 9.5 h / 7 天**（2026-10-05 → 2026-10-12） |
| 止损条件 | 10-12 若未过 S3 闸门 → 降级交付 T0（一份架构决策备忘 + 术语表），不硬撑 |
| 本轮明确不做 | 做题、背考纲、考证（若将来考证，另立一个运行单，见文末附录） |
| 开放式问题 | **「给定这个真实系统的约束，我该选什么结构，以及我为它放弃了什么？」** |

## 为什么不是考试（这条要写进方法里）

目标由**用途**定，不由**手头材料**定。我上一版之所以把靶子设成考试，是因为你 Note 库里正好躺着一份《12 周备考计划》——这是典型的「反向推导目标」错误。修正后的原则：

> **先问「这个能力我要拿去做什么」，再问「学什么」；手头材料只能决定路径，不能决定目标。**
## 主要矛盾分析（contradiction-analysis 落地）

**矛盾清单**
- [纸面准备] vs [真实约束下的独立决策]
- [输入/收集带来的熟悉感] vs [可被检验的能力]
- [想快（3–10h）] vs [真正学会（可迁移 · 可判断 · 可教）]
- [手头材料] vs [用途目标]（刚刚咬过我一次）
- [我代劳搜索] vs [你亲历验证]

**⭐ 主要矛盾：[熟悉感] vs [可迁移的能力]**
理由：解决了它，其余各对随之缓解——输入冲动、计划癖、纸上推演、以考试为代理，都是"熟悉感"这一方占支配地位的产物。

**性质：非对抗性**（两侧同属一个目标：我要学会；这是设计缺陷与习惯问题，不是利益冲突，不需要消灭任何一方）。

**应对方法**（接下来我将）：
1. 把「学会」改成**行为标准**（五条：能提问 / 能判断 / 能迁移 / 能教 / 知边界），不达标就诚实称之为「熟悉」；
2. 每个阶段**都必须产出可被检验的东西**（S3 是本轮唯一硬闸门：真实约束 + ≥2 候选 + 度量指标 + 视图）；
3. 靶子锚在**真实系统**上，不在教材练习上；
4. 用 `practice-cognition` 在 S3 强制走完"实践 → 认识 → 再实践"；用 `concentrate-forces` 保住 S3/S5 的 4 小时。

**⚠️ 需监控**：①「把学习变成建系统/打磨工具」是否上升为主要矛盾；②「怕自己的设计被看见」是否让 S3 退化成纸上推演。

## S1 · 领域地图（进行中 · 一页五格）

```text
对象   ：系统 / 子系统 / 构件 / 连接件 / 接口 / 数据 / 部署单元 / 团队边界
核心问题：
  1) 面对这些约束，选哪种结构（分层 / 管道过滤 / 事件驱动 / 微核 / 服务化 / 单体先行）？
  2) 关键质量属性是什么，它们如何互相冲突（性能 vs 一致性 vs 可修改性 vs 成本）？
  3) 如何把结构表达清楚，让不看代码的人也能评审（4+1 视图 / C4 / 接口与数据契约）？
  4) 如何验证这个结构扛得住（场景推演 / 原型 / 压测 / 故障演练 / ATAM 式评审）？
  5) 如何在演进中不腐化（扩展点、技术债治理、何时重构、何时重写）？
方法   ：质量属性场景（QAW）· 架构风格清单 · 权衡点/敏感点/风险点 · 视图模型 · 架构评审（ATAM/SAAM 式）
工具   ：Mermaid / draw.io / C4 图 · 设计文档模板 · 评审清单（本库可直接用 Mermaid 作最小表达）
争论   ：微服务的粒度与边界 · DDD 限界上下文是否值得 · 强一致 vs 最终一致 · 单体是否应该先行
边界   ：不覆盖具体编码实现与项目管理流程
```

**五格的使用规则**：写不出「争论」= 只读了教科书层；写不出「质量属性」= 还没碰到真实约束。

## S3 · 复现规格（本轮唯一的硬闸门）

**要复现的不是一道题，而是一次真实的设计动作**：拿你自己的一个真实系统（建议：Note 库 `10_Projects/DoggyArium` 的论坛社区项目，或微微电商对接）的一个切面，走完整条链。

```text
步骤：
  1. 选定切面 + 写死约束（团队规模 / 预算 / 现网状态 / 不可动的东西）
  2. 写出 3-5 条质量属性场景，格式：刺激源 → 刺激 → 制品 → 响应 → 响应度量
     （例：「用户发帖高峰 10× 时，帖子列表 P95 仍 < 800ms」）
  3. 给出 2 个候选结构，各自说明：满足哪些属性、牺牲哪些属性、代价是什么
  4. 选一个，画出最小视图集（上下文 / 构件 / 部署 / 关键时序）
  5. 用 ATAM 式自查列出：权衡点、敏感点、风险点、非风险点
  6. 写「什么情况下我会推翻这个决定」（演进触发条件）
事先声明的通过标准（先写，做完再比）：
  · 质量属性场景 ≥3 条且带可度量指标（写不出度量 = 不通过）
  · 至少给出 2 个候选结构并写出各自的牺牲（只给一个方案 = 不通过）
  · 画出视图 ≥3 张（上下文 / 构件 / 部署或时序）
  · 列出权衡点与风险点各 ≥2 个，且风险点附带验证方式
  · 写出「推翻条件」≥1 条
不通过时：补质量属性场景 → 重做（最多两次）；两次不过 → 触发止损，降级 T0
```

## 7 天排期（9.5 h）

| 天 | 时段 | 阶段 | 交付 |
|---|---|---|---|
| D1 10-05 | 0.5h | S0 | 契约（本页上半，已重定） |
| D1–D2 | 2.0h | S1 | 一页五格定稿（用自己的项目校准） |
| D2–D3 | 1.5h | S2 | 30 条术语表（另开一篇，自己写定义） |
| D3–D4 | 2.5h | **S3** | 真实切面的架构推演（闸门） |
| D5 | 1.0h | S4 | 2–3 个真实争论 + 定论条件 |
| D5–D6 | 1.5h | S5 | 架构设计说明 + 一次评审 |
| D7 10-12 | 0.5h | S6 | 入库 + 第 3/10/30 天复习排程 + 停/续决定 |

**压缩优先级**：S3 真实推演 > S5 产出与评审 > S1 地图 > S4 争论 > S2 术语 > S6 抗遗忘（S0 的 30 分钟永不省）。

## 闸门与止损

- S1 闸门：不看资料说出 5 个核心问题，并指出它们在你项目里的表现
- S2 闸门：不看资料解释 30 条术语（用自己的话）
- **S3 闸门：上面的六条通过标准全中**
- S4 闸门：说得出 2 个真实争论与各自的定论条件
- S5 闸门：**有人真的评审过你的设计**（我或一个同事），且你记录了至少 2 条被指出的问题
- 止损：10-12 未过 S3 → 降级 T0，不留烂尾

## See Also

- [[rapid-domain-entry-protocol|Rapid Domain Entry Protocol]] — 本运行单遵循的协议（S0 已加固：目标由用途定）
- [[rapid-domain-entry-worksheet|Rapid Domain Entry Worksheet]] — 填空表原件
- [[learning-acceleration-loop|Learning Acceleration Loop]] — 回路本体
- [[output-based-retention|Output-Based Retention]] — S5 为什么是闸门
- [[investigation-before-judgement|Investigation Before Judgement]] — 约束与事实先查一手

## 中文速览

- **这轮不考试。** 目标：7 天 9.5 小时，用**你自己的真实系统**当靶子，走完「质量属性场景 → 2 个候选结构对比 → 选型与牺牲 → 视图 → ATAM 式自查 → 推翻条件」，产出**可评审的架构设计 + 一次真实评审**。
- **S3 是本轮唯一硬闸门**，标准六条，其中三条是「不合格即不通过」：质量属性场景必须**带可度量指标**；必须给出 **≥2 个候选结构及各自牺牲**；必须画出 **≥3 张视图**。
- **方法教训（已固化）**：目标由**用途**定，不由手头材料定——库里有备考计划，不代表学习就是备考。
- **进度**：写在本页 `rdep_stages`；站点看板自动更新（改一行即可）。

## 附录 · 若将来要考证（本轮非目标）

仅作信息留存：2026 年软考上半年 5/23–26、下半年 10/24–27；系统架构设计师三科（综合知识 / 案例分析 / 论文），全机考，各科满分 75、通常 45 合格。**报名窗口与最新大纲须以[官方通告](https://www.ruankao.org.cn/)为准**；若决定考证，另立运行单（那才是应试目标，方法不同）。
