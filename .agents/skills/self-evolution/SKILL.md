---
trust_level: internal
name: self-evolution
version: 2.1.0
security_scan_date: 2026-06-09
description: >
  系统自举进化 — 任务复盘、教训沉淀、精锐代理固化与征召。
  使用场景：任务交付完成后的复盘阶段、需固化高价值子代理时、需检索历史教训时。
  触发词：复盘、教训、固化、自进化、Agent Registry、精锐代理。
required_permissions:
datetime: "2026-06-10T00:46"
lastmod: "2026-08-12T17:30"
tags:
  - 方法
  - 技术
type: concept

---

## 记忆读取 (Bootstrapping)

每次新任务开始时：
- 读取 [[CONTEXT]] 领域术语表（若存在），确保术语一致
- 读取 `memory/corrections.md` 最近条目 + `memory/handoff.md` 开放循环
- 读取 `memory/evolution/` 下最近 cited-path 复盘（若有）
- 将历史教训直接应用到本次参数设定中
- 持久化真相源是 `memory/`（AGENTS L13），不是已退役的 `agent_memory/` 空路径
- 所有记忆文件必须遵循知识库 Obsidian 格式（frontmatter + 维基链接 + 标签）

---

## 强制交付物：Cited Path 三闸（v2.1 · 最小图）

> 来源：GraphRAG / Context Graph 自举映射（2026-08-12）。  
> 原则：自举产出必须是**可遍历结构**，不是又一篇散文复盘。

每次 self-evolution **未交齐下列四项，不得声称复盘完成**：

1. **实体**（≥2）：规范化名；别名写在括号内（Gate 1 规范化）  
2. **关系**（≥1 条三元组）：当前只允许主关系类型 **`corrects`**  
   - 形状：`(纠正事件|用户反馈, corrects, 错误行为|错误假设)`  
   - 可选第二跳：`(该纠正, promotes_to, 规则或文件路径)`  
3. **出处**（每条边）：笔记路径 / 会话日期 / 用户原话摘要（Gate 2 provenance）  
4. **Cited path**（≥1 条可读路径）：问题 → 纠正 → 已改规则/文件 → 仍开放循环（Gate 3）

**一种关系先跑通**：在 `corrects` 路径稳定前，不扩展 `depends_on` / `implements` 等第二类边。

**落盘位置**：

```
memory/evolution/YYYY-MM-DD-<短标题>-cited-path.md
```

**最小模板**（无 callout 堆砌亦可）：

```markdown
---
type: note
title: evolution cited-path
datetime: YYYY-MM-DD
tags: [方法, 工作]
relation_types: [corrects]
---

# Cited Path · <一句话>

## 实体
- CanonicalName（alias1, alias2）

## 边
- (A, corrects, B) · 出处：...
- (A, promotes_to, path/to/file) · 出处：...

## 路径（给下一个幸知走）
1. ...
2. ...

## 仍开放
- ...
```

**验证清单**

- [ ] 实体无「同一对象多名未合并」  
- [ ] 每条边有出处  
- [ ] 路径终点能打开真实文件  
- [ ] 已追加 `memory/corrections.md` 或 `memory/decisions.md`（若适用）  
- [ ] 已更新 `memory/handoff.md` 开放循环（若状态变了）

---

## 失败模式与恢复

| 触发条件 | 一线修复 | 仍失败兜底 |
|---------|---------|-----------|
| `memory/evolution/` 不存在 | 创建目录并写入首条 cited-path | 写入 `memory/session-log.md` 并标记待补 evolution |
| 复盘只有叙事无三元组 | 拒绝完成；补实体/边/出处后再收口 | 降级为「部分复盘」，handoff 写明缺 Gate |
| `memory/corrections.md` 无法读取 | 用本会话用户纠正原文建临时边 | 标记部分复盘 |
| Agent Registry 目录 `.opencode/agent/` 不存在 | 跳过固化；候选记 `memory/evolution/pending-agents.md` | 同左 |
| 精锐自进化时旧版备份名称冲突 | 文件名追加时间戳到毫秒 | 独立备份目录 |
| `git revert` 产生冲突 | 手动解决后继续 commit | 从 clean commit 恢复后重做 |

---

## 终极阶段：系统复盘与元规则进化

任务交付完成后，**绝不直接休眠**，必须强制启动自举进化：

### 0. Cited Path 门禁（先于长文）

先写 `memory/evolution/...-cited-path.md` 四项交付物，再写长篇 5 Whys。  
无路径 = 未完成。

### 1. 启动 @进化复盘官

- 读取所有沟通与回滚日志
- 找出幻觉引发点和低效关键词
- 将避坑指南写入 `memory/evolution/`（优先 cited-path；长文可选 `lessons_learned_YYYYMMDD.md`）

**教训模板**：
```markdown
---
tags:
  - 教训
  - 复盘
  - self-evolution
aliases: ["root-cause-[简述]"]
created: YYYY-MM-DD
---
## 问题描述
[发生了什么]

## 根因分析（5 Whys）
1. 为什么？→ [原因1]
2. 为什么？→ [原因2]
...
5. 为什么？→ [根本原因]

## 触发条件
当 XXX 发生时（[具体场景描述]）

## 修复方案
- 短期：[立刻能做的事]
- 长期：[需要改 skill/配置的事]

## 交叉引用
- 相关教训：`lessons_learned_YYYYMMDD`
- 相关 skill：`skill-name`
```


### 2. 启动 @元提示词工程师

- 读取复盘日志
- 基于教训重写更严厉的子代理调度 SOP
- 归档到 `memory/evolution/optimized_prompts_library.md`（若无则创建）

**优化项模板**：
```markdown
## [优化项名称] · v[版本号]

**来源教训**：`lessons_learned_YYYYMMDD`
**触发场景**：当子代理做 [具体操作] 时
**原行为**：[原来怎么做的]
**优化行为**：[现在必须怎么做]

### 约束规则（硬性）
- [禁止事项1]
- [禁止事项2]

### 执行检查清单
- [ ] [检查项1]
- [ ] [检查项2]

### 回退条件
当 [场景] 发生时，跳过此优化，回退到 [原行为]
```


### 3. 用户反馈价值挖掘

- 分析用户指令中的系统改进需求
- 将验证有效的实践沉淀到规则库

**示例**：用户说「你每次都要我确认太烦了」→ 提取需求"减少不必要的确认点"→ 沉淀为规则「在无副作用的只读操作中跳过确认，仅在 git commit/文件覆盖/网络请求等不可逆操作前要求确认」

### 4. 产出索引更新

```bash
# 复盘完成后：evolution + memory 真相源 + 必要索引
git add memory/evolution/ memory/corrections.md memory/decisions.md memory/handoff.md \
  skills/self-evolution/SKILL.md
git commit -m "chore(自进化): cited-path 复盘与规则更新"
```

---

## 精锐保留与优先征召 (Agent Registry)

不要每次都重新发明轮子。对表现优异的子代理必须固化为永久配置。

### 判定标准

- 调用次数 ≥ 3 次
- 任务完成质量评分 ≥ 4/5（由主代理评估）
- 能处理至少 2 种不同类型的子任务

### 固化动作

创建 `.md` 配置文件到 `.opencode/agent/` 目录，文件名即为代理名：

```markdown
---
description: [何时使用此代理，具体到触发场景]
mode: subagent
trust_level: reviewed
tools:
  bash: deny
  edit: deny
  webfetch: deny
  task: false
  skill_load: deny
---
You are a [角色描述]. [具体职责说明].
```

**示例**：
```markdown
---
description: 复盘日志分析专家。在 @进化复盘官 启动时触发，读取日志输出结构化教训文档。
mode: subagent
trust_level: reviewed
tools:
  read
## Portability note (imported 2026-10-05)

本副本运行于 Nova 知识库（DSH）。原文件中的路径按下列映射解释：

- `memory/corrections.md` / `memory/handoff.md` / `memory/decisions.md` / `memory/session-log.md` → 本库 `log.md`（追加式时间线）+ `_meta/promotions.md`（升格台账）。
- `memory/evolution/<date>-<slug>-cited-path.md` → 本库 `conference/`（跨上下文留痕）或 `_meta/`（若为规范类教训）。
- `.opencode/agent/` → 本库 `_agents/<name>.md`（子代理 prompt），通过 DSH `subagent` 工具调用。
- `AGENTS L13` 等条款引用 → 本库 `AGENTS.md` §2.5 升格协议与 §7 会话记忆协议。