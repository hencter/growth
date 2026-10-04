---
type: Meta
title: "Imported Skills Ledger"
aliases:
  - "技能导入台账"
description: 外部技能导入台账 — 23 个从 Note 库移植的技能与 hugo-static-site 技能包的来源、校验、绑定风险、冲突处理与卸载路径。
tags: [meta, skills, ledger, provenance]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T05:50:00+08:00 }
id: "20261005T055000"
status: budding
difficulty: intermediate
domain: knowledge-management
related:
  - "[[learning|学习 — 加速学习方法论]]"
  - "[[agent-skills-standard|Agent Skills Standard]]"
  - "[[agent-skills-system|Agent Skills System]]"
  - "[[conventions|Conventions]]"
sources:
  - id: note-vault-skills
    resource: "Scope: owner's Note vault — skills/ (read-only source of the 23 imported skills)"
    title: "Owner's Note vault — skills/ directory"
  - id: hugo-skill-pack
    resource: "https://hugozh.cn/skill/skill-manifest.json"
    title: "hugo-static-site skill pack manifest (hugozh.cn)"
confidence: 0.9
summary: >
  导入台账：23 个技能从 Note 库按「零改动优先」原则移植（跳过强绑定其 memory/、swarm_reports/、根级 scripts/ 的技能），外加来自 hugozh.cn 的 hugo-static-site 13 文件技能包（SHA-256 全部校验通过）；本页记录来源、体积、冲突与卸载方法。
---

# 技能导入台账

> 目的：让导入进来的**机器配置**有出处、有风险标注、可回滚。技能不是图谱节点（AGENTS.md §2），所以本页不建 wiki 链接，也不出现在图谱统计里。

## 一、导入范围与判据

| 判据 | 做法 |
|------|------|
| 能用就用 | 纯 Markdown、无 Note 库专有路径 → **零改动**移植 |
| 绑得深就跳过 | 引用其 `memory/*`、`swarm_reports/`、根级 `scripts/*.py`、`.opencode/` 的技能 → 不导入，理由记录在下方 |
| 有冲突就标注 | 与 Nova 规范冲突的（标签白名单、PARA 目录、状态枚举）→ 标为参考层，不覆盖 Nova 的 [[conventions\|Conventions]] |
| 必留痕 | 每个导入项记来源、文件数、体积、绑定等级；hugo 技能包另逐文件校验 SHA-256 |

## 二、从 Note 库导入的 23 个技能

来源：Note 库的 `skills/` 目录（**只读**，原件未改动；环境相关的绝对位置按 §1 不写入笔记）。落点：`.agents/skills/`。

### 毛式方法论系（10 个，零改动）

| 技能 | 文件 | KB | 绑定 |
|------|-----:|----:|------|
| `practice-cognition` | 2 | 10.3 | 无 |
| `contradiction-analysis` | 4 | 13.8 | 无 |
| `protracted-strategy` | 3 | 12.2 | 无 |
| `concentrate-forces` | 2 | 8.6 | 无 |
| `mass-line` | 3 | 11.4 | 无 |
| `criticism-self-criticism` | 3 | 11.3 | 无 |
| `spark-prairie-fire` | 2 | 8.3 | 无 |
| `overall-planning` | 2 | 9.1 | 无 |
| `investigation-first` | 3 | 11.9 | 无 |
| `arming-thought` | 1 | 7.0 | 轻：引用其 `AGENTS.md L2` 与 `.opencode/commands/`（不可用时按该技能自身的降级路径走） |

### 学习与知识管理系（3 个）

| 技能 | 文件 | KB | 绑定与处理 |
|------|-----:|----:|------------|
| `cross-tag-method` | 1 | 7.1 | 轻：其十字标签法（领域 × 内容类型）可移植；文中引用的校验脚本属 Note 库根级 `scripts/`，**本库不适用** → 当方法论参考，不覆盖 Nova 标签约定 |
| `obsidian-markdown` | 4 | 11.3 | 中：语法部分通用；其中「必填 `type` + `datetime`」「标签白名单」为 Note 库家规 → 以本库 AGENTS.md §3 为准 |
| `obsidian-bases` | 2 | 13.3 | 轻：`.base` 视图/公式/汇总通用，可用于学习看板 |

### 认知与复盘系（7 个）

| 技能 | 文件 | KB | 绑定与处理 |
|------|-----:|----:|------------|
| `grill-me` | 1 | 1.0 | 无 |
| `zoom-out` | 1 | 0.7 | 无 |
| `minimalist-review` | 1 | 3.5 | 无 |
| `karlmarx-skill` | 73 | 268.6 | 无（含 131 KB logo，属资产非代码） |
| `grill-with-docs` | 3 | 9.5 | 无（`CONTEXT.md`/`docs/adr/` 是目标项目通用约定，非本库路径） |
| `self-evolution` | 1 | 7.7 | 中重：写入目标指向 `memory/*`、`.opencode/agent/` → **末尾追加移植说明**，改指向本库 `log.md` + `_meta/promotions.md` + `_agents/` |
| `thinker-distiller` | 1 | 6.3 | 中重：产出路径写 `80_Zettelkasten/`、`70_MOCs/`、`swarm_reports/` → **末尾追加移植说明**，改指向 `concepts/` 与根 hub |

### 技能自举系（3 个）

| 技能 | 文件 | KB | 绑定与处理 |
|------|-----:|----:|------------|
| `skill-creator` | 26 | 241.7 | 中：查重写死「现有 124 个一级包」+ `glob skills/*/SKILL.md`；`claude` CLI 相关脚本在本环境不可用 → **追加移植说明**；`init_skill.py`/`package_skill.py` 可用 |
| `skill-fixer` | 3 | 8.4 | 重：路径硬编码 `.opencode/skills/` → 已改为 `.agents/skills/`（SKILL.md 与两个 `.sh`），**属有意修改**，记录在案 |
| `skill-quality-optimizer` | 2 | 5.5 | 轻：9 维评分 + 棘轮 + 独立子代理评分，通用；文中台账/标签引用按本库规范执行 |

**导入合计（脚本复核值）**：23 个技能 / **144 个文件** / **688.4 KB**。加上本库原生的 `nova-kb`、`obsidian`、`auto-commit` 与新增 `hugo-static-site`，`.agents/skills/` 现为 **27 个技能 / 160 个文件 / 793.0 KB**（实测 812,067 B）。上表体积为含移植补丁后的测量值。

### 刻意跳过（4 个 + 理由）

| 技能 | 跳过理由 |
|------|----------|
| `knowledge-management` | 协议级绑定：`swarm_reports/`、`CONTEXT.md` 自愈、`memory/session-log.md`、其 `AGENTS.md L5/L9` → 与 `nova-kb` 职责重叠且规范不同 |
| `luck-learning-memory` | 数据级绑定：其中 `memory.md`（20.6 KB）是该库 2026-05 前的学习快照，含 40+ 条其库内真实路径；本库的跨会话记忆由 AGENTS.md §7 + `log.md` 承担 |
| `cross-tag-validator` | 依赖该库根级 `scripts/*.py` 与 Python + Obsidian CLI 运行时；且标签白名单为其库专有 |
| `knowledge-base-management` / `obsidian-vault` / `obsidian-knowledge-grep` / `agent-skill-matrix` / `agent-selection-guide` / `semantic-version` / `skill-installer` / `improve-codebase-architecture` | 或为 PARA 专属路由（本库是 concepts/tools/patterns/learning 拓扑）、或为 OpenCode 代理花名册（DSH 不存在这些代理）、或为 Codex 的 `$CODEX_HOME` 安装器、或与学习无关（代码架构重构） |

## 三、`hugo-static-site`（hugozh.cn 技能包）

| 项 | 值 |
|----|----|
| 来源 | <https://hugozh.cn/skill/skill-manifest.json>（清单）· 仓库 `hencter/hugozh` |
| 落点 | `.agents/skills/hugo-static-site/`（目录名与内部相对路径严格照清单，未拍平、未改名） |
| 文件 | 13（`SKILL.md`、`README.md`、`INSTALL-PROMPT.txt`、`references/` 10 篇） |
| 体积 | 93,953 B |
| 校验 | **13/13 逐文件 SHA-256 与清单一致**（按 `files[].url` 取发布字节，非 git clone，避免 CRLF 转换） |
| 生效 | 落盘后本会话技能目录实时刷新，`hugo-static-site` 已可加载（无需重启会话） |
| 第一条铁律 | *永远不要在内容里留下未转义的 `{{<` 或 `{{%`——哪怕在围栏代码块里*（Hugo 在 Markdown 之前抽取短代码，官方文档也不豁免代码块） |

## 四、已知缺陷与修正记录

| 项 | 状态 |
|----|------|
| Note 库侧 8 个 SKILL.md 在句中物理截断（`practice-cognition`、`concentrate-forces`、`criticism-self-criticism`、`overall-planning`、`minimalist-review`、`skill-quality-optimizer`、`grill-with-docs`、`karlmarx-skill`） | 已在**副本**上补完句尾并加 `<!-- import fix -->` 标记；原件未改 |
| `skill-fixer` 的 `.opencode/skills/` 硬编码 | 已在副本上改为 `.agents/skills/`（3 处，含两个 `.sh`） |
| `self-evolution` / `thinker-distiller` / `skill-creator` 的路径与查重假设 | 已在副本末尾追加「Portability note」，写明本库对应路径 |
| 冲突：其 `obsidian-markdown` 要求 `datetime` 必填、`cross-tag-method` 要求标签白名单 | 一律以本库 `AGENTS.md` §3 与本页为准；冲突技能按「参考层」使用 |
| 冲突：OKF v0.2 的 `status`（draft/stable/deprecated）与其「`evergreen` 等成熟度枚举」 | 已在 `AGENTS.md` §3 建立映射（seedling/budding→draft，evergreen→stable，superseded/archived→deprecated） |

## 五、卸载与体积

- **卸载**：删除 `.agents/skills/<技能名>/` 目录即可；技能无注册表、无外部依赖、无代码安装步骤。
- **会话成本**：技能目录会被扫描进会话技能列表。27 个技能的 `description` 合计 **7,066 字符**（CJK 1,123 + 非 CJK 5,943）≈ **2,600 token** 粗估——这是每次会话都要付的固定开销。若要收窄，删掉当前不用的技能目录，比拆分或改名更省事。
- **许可**：Note 库侧的第三方技能许可见该库 `skills/THIRD_PARTY_NOTICES.md`；`hugo-static-site` 为 MIT（笔记文本），译文部分另有许可。

## 六、为什么值得留在本库

| 技能组 | 在「更快学习」里的角色 |
|--------|------------------------|
| 毛式方法论 10 件套 | 遇到「学什么、先解决哪个、怎么不被现实打回」时的决策器 |
| 认知与复盘 7 件 | 把「想清楚」变成可执行的碰撞（拷问、结构分析、蒸馏、拉高视角） |
| 知识管理 3 件 | 笔记语法与视图，保证沉淀不变成堆积 |
| 自举 3 件 | 让「造新方法」本身可复用——这是学习方法能持续升级的原因 |
