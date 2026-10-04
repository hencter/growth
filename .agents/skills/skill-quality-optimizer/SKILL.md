---
name: skill-quality-optimizer
description: |
  本库 Skill 质量评估与持续优化系统。借鉴达尔文.skill 的 9 维评分 + 棘轮机制 + 独立评估理念，
  适配本 Obsidian 知识库的十字标签法/wikilink/callout/frontmatter 规范。
  使用 swarm-orchestrate 调度子代理独立评分，git ratchet 保留改进回滚退步，human-in-the-loop 确认。
  触发词：优化 skill、skill 评分、技能质量、评估 skills、skill audit、质量检查、skill review。
trust_level: internal
datetime: "2026-06-09T20:42"
tags:
  - 方法
  - 技术
  - 案例
type: rule
---
# skill-quality-optimizer

> [!info] 本库 Skill 质量评估与持续优化系统
> 借鉴达尔文.skill 的 9 维评分 + 棘轮机制 + 独立评估理念，适配本 Obsidian 知识库的十字标签法 / wikilink / callout / frontmatter 规范。
> 使用 `swarm-orchestrate` 调度子代理独立评分，git ratchet 保留改进回滚退步，human-in-the-loop 确认。

- **标签**：#方法 #技术 \#技能管理
- **依赖**：[[swarm-orchestrate]]、[[criticism-self-criticism]]、[[self-evolution]]、[[skill-creator]]、[[skill-fixer]]、[[semantic-version]]

---

## 设计哲学

| 原则 | 说明 |
|------|------|
| **单一可编辑资产** | 每次只改一个 SKILL.md |
| **双重评估** | 结构评分（静态分析）+ 效果验证（实际使用场景） |
| **棘轮机制** | git 保留改进，自动回滚退步 |
| **独立评分** | 用子 agent 评分，避免自评偏差 |
| **人在回路** | 关键节点暂停确认 |

---

## 评估体系（本库专用 9 维，总分 100）

### 结构维度（55 分）

| # | 维度 | 权重 | 评分标准 |
|---|------|------|---------|
| 1 | Frontmatter 质量 | 8 | name 规范、description 含触发词、trust_level 标注、≤1024 字符 |
| 2 | 工作流清晰度 | 10 | 步骤明确可执行、有序号、每步有输入/输出 |
| 3 | 失败模式编码 | 10 | 显式写"如果 X 失败 → Y"分支；有 fallback 路径 |
| 4 | 检查点设计 | 5 | 关键决策前有用户确认；检查点显性标记 |
| 5 | 可执行具体性 | 12 | 有具体参数 / 格式 / 示例；禁止"根据情况/灵活把握"等模糊词 |
| 6 | 资源整合度 | 5 | references/scripts/assets 引用正确、路径可达 |
| 7 | 本库规范遵守 | 5 | 十字标签、wikilinks、callout 使用正确 |

### 效果维度（39 分）

| # | 维度 | 权重 | 评分标准 |
|---|------|------|---------|
| 8 | 整体架构 | 14 | 结构层次清晰、不冗余不遗漏、与知识库规范一致 |
| 9 | 实测表现 | 25 | 用测试 prompt 跑一遍，输出质量是否符合 skill 宣称的能力 |

### Meta-skill 维度（6 分）

| # | 维度 | 权重 | 评分标准 |
|---|------|------|---------|
| 0 | 反例与黑名单 | 6 | 必须有"不要做什么"的反例清单 |

---

## 优化循环（3 阶段）

### Phase 0: 初始化

```yaml
steps:
  1: 确认优化范围（全部或指定列表）
  2: git checkout -b auto-optimize/YYYYMMDD
  3: 初始化 results.tsv（header: skill, dimension, old_score, new_score, verdict, reason）
```

### Phase 1: 基线评估

```yaml
steps:
  1: 用子 agent 对每个 skill 执行 9 维评分
  2: 展示评分卡（表格形式）
  3: 🔴 CHECKPOINT — 用户确认后再进入 Phase 2
```

> [!warning] 独立评分规则
> 评分子 agent 必须与被评分的 skill 隔离，**禁止**在同一个 context 中自评自改。

### Phase 2: 优化循环

```yaml
loop:
  sort: 按分数从低到高
  per_round:
    - 只改一个维度
    - 子 agent 重新评分
    - 新分 > 旧分 → git commit keep
    - 新分 ≤ 旧分 → git revert（回滚退步）
  early_stop: 连续 2 轮 Δ < 2 分 → 早停
  checkpoint: 🛑 每个 skill 改完后确认
```

### Phase 3: 汇总

```yaml
output:
  - 优化报告：分数变化对比表
  - 改进摘要：每个 skill 改了哪些维度
  - 未达标列表：仍需人工介入的 skill
```

---

## 反例黑名单

> [!danger] 以下行为严格禁止

| # | 禁止行为 | 正确做法 |
|---|---------|---------|
| 1 | 同 context 自评自改 | 必须 spawn 独立子 agent |
| 2 | `git reset --hard` 当回滚 | 用 `git revert` |
| 3 | 为凑分堆冗余 | 触顶即停 |
| 4 | 跳过测试直接评分 | 必须跑测试 |
| 5 | 轮内改多个维度 | 每轮只改 1 个 |
| 6 | 静默跳过异常 | 先告知用户 |
| 7 | 破坏十字标签规范 | 保留 `#领域 #类型` 双标签结构 |
| 8 | 移除 wikilink/callout 改用纯文本 | 保持本库 Obsidian 方言 |

---

## 使用方式

| 触发语 | 执行动作 |
|--------|---------|
| "优化所有 skills" | 全量流程（Phase 0 → 1 → 2 → 3） |
| "评估所有 skills 质量" | 只执行 Phase 1，不进入优化 |
| "优化 [skill 名]" | 针对单个 skill 执行全流程 |

---

## 与现有 Ski
ll 体系的关系

- 与 `skill-creator`：新建 skill 走 skill-creator；**评估与迭代**走本技能。
- 与 `skill-fixer`：加载失败/缺 frontmatter 走 skill-fixer；质量提升走本技能。
- 与本库规范：评分维度涉及的标签、wikilink、frontmatter 一律以本库 `AGENTS.md` §3（OKF v0.2 + Nova 扩展）为准。

<!-- import fix 2026-10-05: 源 SKILL.md 在句中被物理截断，此处在副本上补完；原件（Note 库）未改动。by dsh/deepseek-flash -->
