---
type: Meta
title: "Backlog — 待办与进行中"
description: 本库唯一的待办清单（durable）：进行中的运行、紧接的训练项与复习排程、已排队的可选项；每条必须可验收。
tags: [meta, backlog, todo]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T13:51:06+08:00 }
id: "20261005T135106"
status: budding
difficulty: beginner
domain: knowledge-management
related: ["[[system-architect-t1-sprint|S-1 起点诊断运行单]]", "[[lemmy-federation-evidence|Lemmy 采用 ActivityPub —— 证据清单]]", "[[rapid-domain-entry-protocol|Rapid Domain Entry Protocol]]"]
confidence: 0.9
summary: 待办总账——1 条进行中（能迁移：Lemmy ADR）、3 条本运行内、5 条已排队；每条都带验收标准，完成即移入 log.md。
---

# Backlog — 待办与进行中

> 这是**唯一的待办清单**。会话里的临时清单会丢，这份不会。**每条待办必须可验收**——写不出验收标准，说明还没想清，不进清单。
> 最近整理：2026-10-05 13:53

## 🔴 进行中（1 条）

- [ ] **能迁移：写一份 Lemmy 版 ADR**（RDEP 运行唯一剩余项）
  - 证据：[[lemmy-federation-evidence|Lemmy 采用 ActivityPub —— 证据清单]]（仪器已备；含 **4 处无证据区**）
  - 交付：境 / 择 / 存 / 果（**含好处与代价**）/ 备选（≥2）/ 推翻条件——每条标 \[查过源]\ / \[印象]\ / \[推断]\
  - 验收：随机指一句须答出出处；答不出 ≥3 句 = 「AI 的 ADR」，不通过
  - 归属：**你判断，我验收**

## 🟡 本运行内紧接着（3 条）

- [ ] **两条训练项**（每次交付前自检）
  - **输入通道校验**：语音 / AI 转写来的断言，入档前核对来源
  - **断言范围**：绝对断言（"不会出错""不可能推翻"）改成带条件的断言
- [ ] **遗留账**：Consequences 写**全部后果**（含好处），不只代价（已重申两次）
- [ ] **S6 抗遗忘**：第 3 / 10 / 30 天检索复习 → **10-08 · 10-15 · 11-04**
  - 复习对象：[[adr-001-rust-choice|ADR-001]]、[[builder-verifiability|建造者可验证性]]、[[ai-native-architecture-constraints|AI 原生架构约束]]、Lemmy ADR

## 🟢 已排队（可选，随时开）

- [ ] **RDEP 第二个运行：通知方案**（你自己提出的真实问题）—— 硬约束「一定能触达用户」；备选：公众号 / 站内 / 邮件；建议邮件先行
- [ ] **验证 Obsidian ignore filter 生效**：`.obsidian/app.json` 已加 `public/ resources/ layouts/ static/`，**但尚未验证**——Obsidian 未重载索引，CLI 仍报 orphans 132 / deadends 136（比改动前还多 2，因站点重建又往 `public/` 写了文件）。**重载 Obsidian 后**重跑 `obsidian orphans total`，预期降到 ~8；未验证前不得当作已完成
- [ ] **开启 Obsidian CLI**：`version` / `vault` 当前报「Command line interface is not enabled（Settings > General > Advanced）」；图查询类命令（orphans / deadends / unresolved）可用- [ ] **站点部署**：GitHub Actions → GitHub Pages（\aseURL\ 已指向 \https://hencter.github.io/growth/\）
- [ ] **站点 agent 可读层**：每页 \.md\ 或 \pages.json\（让 Agent 直接读站点，不必解析 HTML）
- [ ] **Note 库副本对齐**：Note 侧的 \hugo-static-site\ 仍是旧版（12 文件、3 处哈希不符）——需你授权写 Note 库
- [ ] **skills token 成本裁剪**：27 个技能，描述开销约 2 600 tokens/会话，按使用频率裁剪

## ⚪ 本会话已完成（留痕，不追踪）

- RDEP 首个运行：S-1 → S5 全部关闭；**S3 闸门通过**；五条标准 **4 ✅ / 1 ⬜**（只剩迁移）
- 站点「学习进度与状态」看板上线（数据源＝笔记 frontmatter，改一行即更新）
- [[adr-001-rust-choice|ADR-001：Rust 选型]] + 两个衍生概念：[[builder-verifiability|建造者可验证性]]、[[ai-native-architecture-constraints|AI 原生架构约束]]
- 25 个手写虚构时间戳修正；§2.3 / §2.6 / §3 时钟规则加固

## 规则

1. 一条待办 = 一个可验收动作；完成即写 \log.md\ 并从本页移走（本页不堆历史）
2. 本页控制在 ~60 行内，超了归档到 \log-archive/\
3. 定时的复习排程**以本页日期为准**（会话内提醒可能不跨会话）