---
trust_level: internal
name: cross-tag-method
description: 应用十字标签法进行知识管理。当需要为内容添加双标签体系（领域标签+内容类型标签）、构建网状知识结构，或按领域和类型维度组织笔记时使用。
datetime: "2026-06-07T13:39"
lastmod: "2026-08-18T23:30"
tags:
  - 方法
  - 技术
  - 案例
type: rule
---

## 触发场景

- 给笔记打标签、加双标签体系
- 不知道怎么给一条笔记分类
- 用十字标签法（领域标签+内容类型标签）标注笔记
- 确定一条笔记的领域标签和内容类型标签

# Cross Tag Method Skill (十字标签法)

## Core Principle

The Cross Tag Method uses a **frontmatter 双标签体系 (dual-tag system)** with two dimensions:

- **Y-Axis (Vertical) - Domain Tags (领域标签)**: Topics you continuously explore and accumulate knowledge about
- **X-Axis (Horizontal) - Content Type Tags (内容类型标签)**: The nature of the note and its future use

**Golden Rule**: Every knowledge note's frontmatter must have at least one domain tag + one content type tag.

> [!note] 标签分层
> 13 个标准标签只约束 YAML frontmatter 的 `tags:` 分类字段。正文中的 `#AI`、`#新闻情报` 等话题、实体、平台发布标签不受该白名单约束，也不由校验器自动删除。

## Tag System

### Domain Tags (Y-Axis)

These tags represent your knowledge domains:

| Tag | Description | Examples |
|-----|-------------|----------|
| `#生活` | Personal experiences, insights, and future changes | Work life, daily reflections |
| `#方法` | Immediately usable, environment-independent methods | Productivity techniques, tools |
| `#原理` | Explanations and understanding behind methods | Why things work, theoretical basis |
| `#概念` | Abstract knowledge summaries after cognitive processing | Key concepts, frameworks |
| `#目标` | Long-term or periodic goals you set | Annual goals, project milestones |
| `#学习` | Learning content and growth records | Courses, reading notes |
| `#工作` | Work-related responsibilities and practices | Projects, professional notes |
| `#技术` | Technology stacks, tools, and engineering practices | Development, tool usage |

### Content Type Tags (X-Axis)

These tags describe the specific type and use of note content:

| Tag | Description | Example |
|-----|-------------|---------|
| `#故事` | Specific narratives and plot | Personal anecdotes, case stories |
| `#案例` | Practical application examples | Real-world implementations |
| `#金句` | Brilliant expressions and statements | Memorable quotes, key phrases |
| `#感受` | Personal experiences and feelings | Emotional responses, reflections |
| `#观点` | Others' or your own viewpoints | Opinions, perspectives, arguments |

## Tagging Workflow

### Step 1: Record Note Content

- Keep cards short and focused - one card per content type
- Concentrate on core information, avoid mixing multiple content types

### Step 2: Determine Domain Tag (Y-Axis)

**Core Question**: Which domain that **I** continuously explore does this content belong to?

**Operation Points**:
1. Choose from the eight standard Y-axis tags
2. Do not add nested or ad-hoc values to frontmatter `tags:`
3. Use MOCs and wikilinks for finer-grained subject navigation

### Step 3: Determine Content Type Tag (X-Axis)

**Core Question**: What type is this content, and how will **I** use it in the future?

**Content Type Hierarchy** (from concrete to abstract):
```
故事 → 案例 → 金句 → 感受 → 观点
```

### Step 4: Apply Tag Combination

- Each card needs at least two tags: one domain tag + one content type tag
- Store classification tags in YAML frontmatter without the `#` prefix
- Example: `tags: [方法, 观点]` or `tags: [生活, 感受]`
- 正文 `#话题` 一律转义为 `\#话题`（validator 铁律口径）；仅明确发布语境的话题例外按 validator 规则处理并勾检查点

## Tag Combination Examples

| Note Content | Domain Tag (Y) | Content Type (X) |
|--------------|---------------|------------------|
| 公众号文《为什么我每天写日记》 | 生活 | 观点 |
| ZK 概念卡「贝叶斯定理」 | 概念 | 案例（具体应用实例）或 观点（解释性观点） |
| 读书笔记《原则》 | 学习 | 金句（摘录原句）或 感受（个人体会） |
| 工作日报 | 工作 | 观点（总结判断） |
| git 使用技巧 | 技术 | 案例（实操示例） |
| 直播名场面回顾 | 生活 | 故事 |

## X 轴覆盖规则（概念/日志/报告类笔记的落点）

> 评分实测发现：X 轴五项（故事/案例/金句/感受/观点）对"概念解释/日报/工具类"易卡死。裁决规则：

| 内容类型 | X 轴落点 | 判定 |
|----------|---------|------|
| 概念解释（是什么） | **案例**（举实例说明）或 **观点**（你的理解） | 有实例→案例；纯解释→观点 |
| 日志/日报（发生了什么） | **故事**（叙事）或 **观点**（总结判断） | 有叙事→故事；纯清单→观点 |
| 报告/分析 | **观点** | 结论性内容一律观点 |
| 规则/规范（怎么用） | **案例** | 可操作规则配案例 |
| 金句摘录 vs 感受 | 原句照录→**金句**；自己的体会→**感受** | 以"谁的表达"区分：原文 vs 自我 |

**兜底**：实在无法从五项中选出时，选**观点**（最抽象、最普适）并在正文说明理由——"观点"是 X 轴兜底位。

## 失败模式与兜底

| 触发条件 | 一线修复 | 仍失败兜底 |
|----------|---------|------------|
| X 轴五选一选不出来 | 按上表裁决规则逐条对照 | 兜底选观点，正文说明理由 |
| Y 轴近邻两可（方法 vs 技术） | 方法=操作方式（怎么做）；技术=工具栈（用什么）——问"内容讲的是动作还是工具" | 两可时取更常维护的领域，宁缺毋滥 |
| 概念 vs 原理 分不清 | 概念=是什么；原理=为什么/背后机制 | 取概念 |
| 正文 \#话题 与 frontmatter tags 混淆 | 正文话题需转义 `\#话题`（validator 口径）；frontmatter 才放白名单标签 | 统一按 validator 规则处理 |
| 打完标签 validator 报违规 | 跑 `python scripts/cross_tag_validator.py validate` 定位 | `fix --dry-run` 预览后修复 |

## 检查点（打标完成后）

- [ ] 至少 1 个 Y 轴 + 1 个 X 轴（Golden Rule）
- [ ] 标签 ∈ 白名单（Y 八项 + X 五项）
- [ ] frontmatter 无 `#` 前缀
- [ ] 正文 \#话题 已按需转义 `\#`
- [ ] 已跑 cross-tag-validator validate 确认 0 违规（或记录未跑原因）

## 反例与黑名单

| 禁止 | 原因 |
|------|------|
| 禁止添加白名单外的嵌套/临时标签 | 违反标签白名单铁律 |
| 禁止只打 Y 轴缺 X 轴 | 双维不成立，validator ci 失败 |
| 禁止 frontmatter 标签带 `#` 前缀 | YAML 解析异常 |
| 禁止正文话题混入 frontmatter | 污染图谱 |
| 禁止把方法误标技术（反之亦然） | 检索偏差 |
| 禁止"only when meaningful"式模糊授权 | 无法判定，执行依赖发挥 |

