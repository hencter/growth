---
name: thinker-distiller
description: 人物思维框架蒸馏系统。输入人名，自动多源调研 → 三重验证提炼心智模型 → 输出结构化 ZK 卡片。 借鉴女娲.skill 的六路并行采集 + 三重验证理念，适配本 Obsidian 知识库。 产出存入 80_Zettelkasten/ 和 70_MOCs/。 触发词：蒸馏 XX、XX 的思维方式、提取 XX 的认知框架、研究 XX 的思维模型、分析 XX 的心智模型。
trust_level: internal
datetime: 2026-06-10T00:46
tags:
  - 方法
  - 技术
lastmod: 2026-06-15T02:42
type: rule
---

## 触发场景

- 蒸馏某位人物（如纳瓦尔、芒格）的思维框架，做成知识库卡片
- 想提取某位高手的认知模型、决策方式和心智模式
- 研究某人的思维模型并整理成结构化的笔记存入卡片盒
- 想学习某位思想家的思考方式，但不知道从哪入手、需要候选推荐

# 人物思维框架蒸馏系统 (Thinker Distiller)

> **借鉴来源**：女娲.skill 的六路并行采集 + 三重验证提炼 + 质量验证架构（详见 `swarm_reports/2026-06-09/agent02_nuwa_patterns_v1.md`）
> **适配目标**：本 Obsidian 知识库（产出 ZK 卡片 + MOC 索引，非 AI agent skill）

## 核心原则

### 1. 产出定位：ZK 卡片，不是 AI skill
- 最终产出是 `80_Zettelkasten/[人名]-思维框架.md`，供人类阅读
- 不是给 AI agent 用的 prompt skill，不需要 system prompt 结构
- 格式：frontmatter + wikilinks + callout + 十字标签

### 2. 信息诚实：标注 > 编造
- 追到源头找不到的数据标注「待核实」及追踪过程
- 区分「他说过的」vs「别人说他的」vs「我推断的」
- 宁可产出标注了局限的 60 分卡片，也不产出看起来完美但编造的 90 分卡片

### 3. 本库复用优先
- 多源调研 → `deep-research-framework`
- 并行采集 → `swarm-orchestrate`
- 信息缺口 → `investigation-first`
- 观点整合 → `mass-line`

---

## Phase 0: 入口分流

### 路径 A：明确人名
用户直接给出名字（如"蒸馏纳瓦尔""研究芒格的思维模型"）→ 直接进 Phase 1

### 路径 B：模糊需求
用户说"想提升决策质量""想学习某某的思考方式"但不明确 → 诊断路径：
1. 追问 2-3 个问题明确：领域、风格偏好、是否已看过相关材料
2. 推荐 3-5 个候选人物（分领域匹配）
3. 用户确认后进 Phase 1

### 前置检查

| 检查项 | 处理 |
|--------|------|
| 本库是否已有此人的 ZK 卡片？ | 跳转 Phase 3 更新模式（仅启动 Agent 2+5+6） |
| 信息量不足以蒸馏？ | 标注信息不足，降级为源流梳理卡片（`80_Zettelkasten/[人名]-源流笔记.md`） |
| 用户提供了本地素材？ | 本地语料优先模式（先分析素材 → 识别缺口 → 定向搜索） |

---

## Phase 1: 六路并行信息采集

用 `swarm-orchestrate` 调度 6 个子代理。按认知信息类型切分，不是按平台切分。

### 分工矩阵

| Agent | 信息类型 | 搜索目标 | 输出文件 |
|-------|---------|---------|---------|
| 1 著作 | 系统性思考 | 书、长文、论文、newsletter | `swarm_reports/thinker-distiller/01-writings.md` |
| 2 对话 | 即兴思维过程 | 播客、长视频、AMA、深度采访 | `swarm_reports/thinker-distiller/02-conversations.md` |
| 3 表达 | 风格 DNA | Twitter/X、微博、短文 | `swarm_reports/thinker-distiller/03-expression.md` |
| 4 他者 | 外部视角 | 他人分析、书评、批评、传记 | `swarm_reports/thinker-distiller/04-external.md` |
| 5 决策 | 真实行为 | 重大决策、转折点、争议行为 | `swarm_reports/thinker-distiller/05-decisions.md` |
| 6 时间线 | 演化轨迹 | 完整时间线、思想转折、最近动态 | `swarm_reports/thinker-distiller/06-timeline.md` |

### 输出要求（每个 Agent）

- 每条信息标注来源 URL 和可信度（`[一手]` / `[二手]` / `[推测]`）
- 区分「他说过的」vs「别人说他的」vs「我推断的」
- 发现矛盾直接记录，不要调和
- 格式：使用本库 callout + wikilink 规范

### 超时 / 失败 / 匮乏处理

| 情况 | 处理 |
|------|------|
| 单个 Agent 超时（5 分钟无有价值结果） | 不等待，继续推进；Phase 2 标注「信息不足」 |
| 总可用来源 < 10 条 | Phase 0.5 提前提醒用户降低期望，心智模型减至 2-3 个 |
| Agent 结果冲突 | 保留矛盾 — 用「内在张力」section 收录 |

---

## Phase 2: 三重验证提炼

从原始信息中识别"真的心智模型"而非"随口一说"。

### 验证框架

| 验证 | 问题 | 判定方式 |
|------|------|---------|
| ① 跨域复现 | 在 ≥2 个不同领域/话题中出现？ | 同一思维框架讨论不同问题时反复使用 |
| ② 生成力 | 能推断此人对新问题的立场？ | 用该模型可推导出未直接说过的观点 |
| ③ 排他性 | 不是所有聪明人都这样想？ | 体现此人的独特视角，有区分度 |

### 分级

| 通过数 | 归类 | 处理 |
|--------|------|------|
| 3/3 | 心智模型 | 纳入核心模型（3-7 个），排序靠前 |
| 1-2/3 | 决策启发式 | 降级为快速判断规则（5-10 条），非核心 |
| 0/3 | 随口一说 | 丢弃 |

### 防噪音规则

- 不是所有 15-30 个候选论点都进卡片，先验证再取 top 3-7
- 3 个深刻模型 > 10 个浅薄原则
- 每个模型必须标注失效条件

---

## Phase 3: 输出构建

### 主产出文件

路径：`80_Zettelkasten/[人名]-思维框架.md`

格式：

```markdown
---
tags:
  - 原理
  - 方法
  - 概念
  - 内容类型标签
aliases: ["[人名]", "[人名] 思维模型"]
created: YYYY-MM-DD
## Portability note (imported 2026-10-05)

本副本运行于 Nova 知识库（DSH），产出路径按下列映射解释：

- `80_Zettelkasten/[人名]-思维框架.md` → 本库 `concepts/[slug].md`（type: Concept）。
- `70_MOCs/*-MOC.md` → 本库根级集群 hub（如 `learning.md`）或 `index.md` 对应章节。
- `swarm_reports/thinker-distiller/0N-*.md` → 本库 `conference/` 或临时工作目录；六路并行采集用 DSH `subagent`/`workflow` 工具实现。
- 兄弟 skill 引用（`deep-research-framework`、`swarm-orchestrate`）在本库不存在 → 用 `investigation-first` + `mass-line` 替代。