---
type: Pattern
title: "Investigation Before Judgement"
description: A discipline for forming conclusions — investigate first-hand before asserting, grade the evidence, price your confidence, and write down what would change your mind.
tags: [learning, evidence, method, thinking]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T04:36:11+08:00 }
id: "20261005T043611"
status: budding
difficulty: intermediate
domain: learning-and-growth
related:
  - "[[learning-acceleration-loop|Learning Acceleration Loop]]"
  - "[[first-principles-thinking|First Principles Thinking]]"
  - "[[source-credibility-and-observation-stance|Source Credibility and Observation Stance]]"
  - "[[metacognition-monitoring-protocol|Metacognition Monitoring Protocol]]"
sources:
  - id: note-vault-investigation
    resource: "Scope: owner's Note vault — 20_Areas/Learning/信息源可信度与观测立场.md; 30_Resources/知识管理/错误案例库.md; 80_Zettelkasten/假设驱动分析与ACH.md"
    title: "Note vault: source credibility, error case library, ACH"
confidence: 0.75
summary: >
  Conclusions are cheap and verification is expensive, so the discipline is inverted: gather first-hand
  facts until the judgement is constrained by reality, grade each piece of evidence, label confidence
  before writing, and record in advance what would change your mind.
---

# Investigation Before Judgement

## Overview

The failure mode this pattern prevents is not ignorance — it is **confident derivation from memory**.
A conclusion assembled from remembered summaries feels identical to one assembled from evidence, which
is why the counter-measure has to be procedural rather than motivational.

The rule in one line, from the source material's phrasing of a 1930 text: *no investigation, no right to
speak* — and no *correct* investigation, still no right to speak.

## The four moves

| # | Move | Concrete action | Violation signal |
|---|------|-----------------|------------------|
| 1 | **Investigate first** | Open the primary source before drafting a claim; "I remember" must be followed by "let me check" | quoting a number from memory |
| 2 | **Mark what cannot be found** | Label it `unverified` / `source not found` with the trace of where you looked | silently substituting a plausible figure |
| 3 | **Price the confidence** | Tag claims [fact] / [inference] / [speculative — with the condition that would confirm it] *before* writing | flat assertions with no signal |
| 4 | **Verify as part of done** | "Finished" requires an observable check (open the artifact, run the command, read the log) | announcing completion without the check |

## Evidence grading and hypothesis competition

Two instruments make move 1 executable rather than aspirational:

- **Grade every source A–D.** A = primary/official artifact, B = authoritative secondary, C = aggregation,
  D = unsourced claim or AI summary. The grade caps how much weight a claim may carry
  ([[source-credibility-and-observation-stance|Source Credibility and Observation Stance]]).
- **Run competing hypotheses (ACH).** Instead of seeking evidence for one answer, list the plausible
  hypotheses, build a hypothesis × evidence matrix, and mark each cell consistent / inconsistent / neutral.
  The winner is the hypothesis that survives the most disconfirming evidence — not the one with the most
  supporting evidence. Pre-commit the trigger: *what event would make me change my mind?*

The ACH step is what keeps move 1 from degenerating into confirmation-seeking with extra steps.

## Why it applies to learning, not just research

- Re-reading a textbook chapter and feeling fluent is an investigation *of your familiarity*, not of the
  claim. The two are routinely confused.
- A study plan built on remembered productivity advice is an uninvestigated judgement; the same plan built
  from your own logged time is not.
- The cost asymmetry is what justifies the discipline: an unverified claim that enters your notes is
  re-cited for months (see [[metacognition-monitoring-protocol|Metacognition Monitoring Protocol]] for the
  audit that catches it).

## Anti-patterns

- **Confidence inflation** — "probably", "roughly", "I'm fairly sure" used to paper over a missing source.
- **Investigation theatre** — searching until you find the answer you expected to find.
- **Closing on a single source** — one link is an anecdote; two independent sources is a signal.
- **Skipping the artefact check** — the difference between "I wrote it" and "it is correct".

## Case: the authority claim that inverted the facts (2026-10-05)

A learner with strong systems judgement argued Rust over Python and Go — and, in the same breath, justified it with "Rust comes from the design intent of C''s creator, aimed at the cloud-native era." Both halves are false, and the second is **inverted**: Rust was created by Graydon Hoare at Mozilla (2006; Mozilla sponsorship 2009; stable 1.0 in 2015) with goals of performance, type safety, concurrency and memory safety **without garbage collection**; the C-world legend **Ken Thompson sits on Go''s design team**, not Rust''s.

The lesson is not "the learner was wrong" — the trade-off reasoning was sound (Go''s GC is a real differentiator; crate-level reuse across desktop and server is a real benefit). The lesson is that **one unchecked authority claim can discredit an otherwise correct argument**. Authority-flavoured sentences ("X was designed by the creator of Y", "built for the Z era") are repeated far more often than they are verified, which makes them the highest-yield targets for a source check.

**Practice:** mark each claim as **[sourced] / [impression] / [inference]** before it enters a document; a claim that cannot be sourced is written as a judgement, never as a fact.> **Revision (2026-10-05, same day).** The learner clarified that the sentence referred to **Go**, not Rust — a voice-transcription artifact. Re-verified against sources: applied to Go the claim is **substantially defensible** — Go was designed by Griesemer, Pike and **Ken Thompson** (Bell Labs; 1983 Turing Award *with* Dennis Ritchie), its syntax is C-like, and the official intent was networked/multicore computing, fast builds and taming large-project complexity (go.dev FAQ). Two precision fixes are needed. The practice below therefore gets *sharper*: **voice and AI transcription inject errors the speaker cannot see**, which is exactly why every claim carries a source label before it enters a document. Second-order evidence: the learner **caught the misfit themselves one turn later** — judgement and boundary-awareness working, not failing.
## See Also

- [[source-credibility-and-observation-stance|Source Credibility and Observation Stance]] — the L0–L5 grading behind A–D
- [[metacognition-monitoring-protocol|Metacognition Monitoring Protocol]] — in-flight self-checks, post-hoc calibration
- [[learning-acceleration-loop|Learning Acceleration Loop]] — phase 2 of the learning loop
- [[first-principles-thinking|First Principles Thinking]] — what to do once the facts are on the table

## 中文速览

- **没有调查就没有发言权**：下判断前先打开一手源；「我记得」后面必须接「我查一下」。
- **四个动作**：①先查一手 ②查不到就标注（含追踪过程，禁止假装查到）③先标置信度再写（[事实]/[推断]/[推测-待确认]）④验证才算完成（打开产出看一眼、跑一次、读日志）。
- **两件工具**：证据 A–D 分级（A 一手官方 → D 无源/AI 摘要）；多假设竞争（ACH）——列假设 × 证据矩阵，标一致/不一致/中性，让证据淘汰错误假设，并预先写下「什么事件会让我改变想法」。
- **对学习同样成立**：重读一遍的「熟悉感」是对熟悉度的调查，不是对主张的调查；学习计划要用自己的时间日志来验证。
- 反面模式：置信度通胀、「调查表演」（只找到自己想找的答案）、单一来源就定论、没验证就说完成。

## Provenance

Distilled from the owner's Note vault: `20_Areas/Learning/信息源可信度与观测立场.md`,
`30_Resources/知识管理/错误案例库.md`, `80_Zettelkasten/假设驱动分析与ACH.md`. The Note vault is not a
node in this graph; cross-vault paths are recorded as plain text.
