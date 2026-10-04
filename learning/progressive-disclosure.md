---
type: Concept
title: "Progressive Disclosure"
description: Load only what the current decision needs — a resident layer of always-required rules plus pointer routing to on-demand detail, with four failure modes and their defences.
tags: [learning, knowledge-management, context, method]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T05:20:00+08:00 }
id: "20261005T052000"
status: budding
difficulty: intermediate
domain: learning-and-growth
related:
  - "[[okf-format|OKF Format]]"
  - "[[selective-persistent-memory|Selective Persistent Memory]]"
  - "[[review-and-recall-rhythm|Review and Recall Rhythm]]"
  - "[[memory-palace-dual-coding|Memory Palace Dual Coding]]"
sources:
  - id: note-vault-pd
    resource: "Scope: owner's Note vault — 80_Zettelkasten/渐进式披露.md; 20_Areas/知识管理/渐进式披露与检索元工具标准范式.md"
    title: "Note vault: progressive disclosure concept + retrieval meta-tool paradigm (SkillGrep)"
confidence: 0.75
summary: >
  Progressive disclosure shows only what the current task requires and hides the rest behind pointers:
  a small always-loaded layer of rules, an on-demand detail layer, and retrieval that degrades gracefully
  instead of failing — because for an agent, resident context is working memory and working memory is billed.
---

# Progressive Disclosure

## Overview

The failure mode is not too little information — it is loading everything in case it is needed. For a
human this fills working memory; for an agent it fills the context window and the bill. Progressive
disclosure is the discipline of deciding **what must be present at every step** versus what can be fetched
at the moment it is needed.

The layering is the same for a person, a document, and an agent:

| Layer | Contains | Cost |
|-------|----------|------|
| **Resident** | the few rules/identity/facts that apply to *every* decision | paid every session |
| **Router (pointers)** | short hooks that say *when* to go deeper and *where* | nearly free |
| **On-demand detail** | procedures, references, history, edge cases | paid only when used |
| **Execution** | scripts and tools | never enters context — only their output does |

## The test for the resident layer

One question decides membership: *would the absence of this have to be known in every session?* Identity,
truthfulness rules, and safety boundaries usually pass. Ledgers, version history, environment specifics,
and reference detail usually fail — they belong behind a pointer.

## The four failure modes, and their defences

| Failure | What it looks like | Defence |
|---------|--------------------|---------|
| **Pointer rot** | the pointer names a file that moved or was renamed | write paths into the master index; grep globally when files move |
| **Over-hiding** | high-frequency rules pushed out of the resident layer, so every task pays a fetch | move it back up; measure by how often it is fetched, not by how often it is "needed" |
| **Trigger ambiguity** | detail exists but nobody knows when to load it | state the *scenario* in the resident layer, not just the location |
| **Cold-start drift** | a new session begins without the core loaded | a mandatory boot list that loads the spine before any work |

## Retrieval that degrades instead of failing

The paradigm in the source material layers retrieval in four attempts, each cheaper than giving up:

1. **Deterministic lookup** — exact identifiers (error codes, API names, function names).
2. **Expanded match** — synonyms, case-insensitive, related keywords.
3. **File-level fallback** — read only filenames/previews, not full texts.
4. **Answer with a declaration** — reply from general knowledge and say explicitly *"no exact match in the
   knowledge base"*.

The declaration step matters more than it looks: silently answering from general knowledge is how a
knowledge base stops being trustworthy. The same four-layer model appears in the metadata → instructions →
references → scripts structure of portable skills ([[agent-skills-standard|Agent Skills Standard]]).

## Where this shows up in this vault

- `AGENTS.md` is the resident layer; everything else is pointer-reachable.
- The boot sequence reads a **30-line window** of the log, not the history
  ([[selective-persistent-memory|Selective Persistent Memory]]).
- OKF's `index.md` exists precisely for this: list what is available before opening anything
  ([[okf-format|OKF Format]] §8).
- Skill metadata (`name`, `description`) is resident; a skill's body loads only when triggered, and its
  bundled scripts never enter context.

## Anti-patterns

- **Just-in-case loading** — bundling everything "so the agent has context".
- **Pointer-only indexes** — links with no description, so the reader must open each to triage.
- **Hidden high-frequency rules** — pushing the most-used rules one layer down to keep the resident layer
  tidy.
- **Silent fallback** — answering without declaring that the lookup missed.

## See Also

- [[selective-persistent-memory|Selective Persistent Memory]] — the evidence for windowed recall
- [[okf-format|OKF Format]] — `index.md` as the standard's progressive-disclosure surface
- [[memory-palace-dual-coding|Memory Palace Dual Coding]] — index-and-trigger the same idea, for human memory
- [[review-and-recall-rhythm|Review and Recall Rhythm]] — scheduled retrieval that keeps the router honest

## 中文速览

- **只呈现当下决策需要的信息，其余用指针路由**：常驻层（每次都要知道）→ 指针层（何时去哪查）→ 按需层（细节）→ 执行层（脚本不入上下文，只有结果入）。
- **常驻层准入判据**：这条内容的缺席，是不是每一次会话都必须知道？身份/求是/安全 → 常驻；台账/版本历史/环境细节 → 指针。
- **四类失效与防御**：指针失效（文件移动后全局 grep）· 过度隐藏（高频规则别往下藏，按取用频率衡量）· 触发不明（常驻层要写「什么时候该查」的场景）· 冷启动漂移（启动清单强制加载核心）。
- **检索四级回退**：精准检索 → 扩展匹配（同义词/大小写）→ 文件级回退（只读文件名与摘要）→ 一般知识作答**并明确声明「库内未找到完全匹配」**。
- 反面模式：以防万一全量加载、只有链接没有描述的索引、把高频规则藏起来、静默降级不声明。

## Provenance

Distilled from the owner's Note vault: `80_Zettelkasten/渐进式披露.md` and
`20_Areas/知识管理/渐进式披露与检索元工具标准范式.md` (the latter lives under `20_Areas/`, not
`30_Resources/` as first assumed).
