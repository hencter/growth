---
type: Pattern
title: "Metacognition Monitoring Protocol"
description: Externalised self-monitoring — pre-action check, in-flight monitoring, post-action calibration, four confidence labels, and a circuit breaker that fires when the checks stop happening.
tags: [learning, metacognition, calibration, protocol]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T04:36:11+08:00 }
id: "20261005T043611"
status: budding
difficulty: advanced
domain: learning-and-growth
related:
  - "[[investigation-before-judgement|Investigation Before Judgement]]"
  - "[[learning-acceleration-loop|Learning Acceleration Loop]]"
  - "[[review-and-recall-rhythm|Review and Recall Rhythm]]"
  - "[[selective-persistent-memory|Selective Persistent Memory]]"
sources:
  - id: note-vault-metacog
    resource: "Scope: owner's Note vault — 80_Zettelkasten/元认知.md; 80_Zettelkasten/元认知监控协议.md; 80_Zettelkasten/元认知与AGENTS.md建设.md; 70_MOCs/元认知-MOC.md"
    title: "Note vault: metacognition concept, monitoring protocol, rules-as-prevention"
  - id: flavell-1979
    resource: "https://doi.org/10.1037/0003-066X.34.10.906"
    title: "Flavell (1979), Metacognition and cognition monitoring — American Psychologist"
confidence: 0.7
summary: >
  Metacognition is knowledge about cognition plus the regulation of it; because bare introspection is
  unreliable, regulation must be externalised into three checkpoints, four confidence labels, and a
  breaker that triggers when the checkpoints are skipped.
---

# Metacognition Monitoring Protocol

## Overview

Metacognition, per Flavell's two-dimensional framing, is **metacognitive knowledge** (what you know about
people, tasks, and strategies) plus **metacognitive regulation** (monitoring and control).[^flavell] The
dimension that gets lost in practice is regulation — specifically, *in-flight* regulation. Reviewing
afterwards is reflection; it is a subset of metacognition, and it cannot catch an error that is being
committed right now.

The reason this needs a protocol rather than good intentions: introspection is unreliable when it is the
only instrument. Injected-concept experiments report detection rates around **20%**, which is why the
protocol below puts the checks *outside* the thinking loop, as observable artefacts — a labelled
confidence tag, a `[MONITOR]` line, a logged calibration.

## 1. Pre-action check (three questions)

Before any substantive output — a conclusion, a file, a decision:

| Question | Required content |
|----------|------------------|
| What am I doing? | one sentence naming the *business action*, not the tool call |
| On what basis? | the specific rule / source / precedent / instruction |
| How confident? | the label, written **before** the claim |

Skipping the check has an observable signature: work starts with no labelled confidence anywhere.

## 2. In-flight monitoring (trigger points)

For work with ≥3 steps, ≥5 minutes, or multiple tools, insert a check at every phase transition — and
whenever something blocks, errors, or interrupts:

> *What could I be getting wrong right now? Which constraint am I forgetting? Has my confidence dropped?*

Record the check as a visible mark (`[MONITOR]`) or a spoken note; an unrecorded check did not happen.

## 3. Post-action calibration (four items)

| Item | Action |
|------|--------|
| Rule compliance | walk the applicable checklist item by item |
| Error reflex | when challenged, the first move is "let me check / I'll fix it" — explanation is defence |
| Same-class search | grep globally for the same error elsewhere, not just here |
| Calibration review | compare the confidence you wrote to the outcome you got |

## 4. Four confidence labels

| Label | Meaning |
|-------|---------|
| `[fact]` | primary source / explicit confirmation / verbatim original |
| `[inference]` | several independent signals support it |
| `[speculative — to confirm]` | a single clue; must state the condition that would confirm it |
| `[confirmed]` | verified after the fact, replacing an earlier weaker label |

Data-bearing claims carry a source link that was actually opened, not remembered
([[investigation-before-judgement|Investigation Before Judgement]]).

## 5. Circuit breaker

Two consecutive missed checkpoints (no pre-check, no confidence label) trip a warning — `[METACOG WARN]` —
recorded and surfaced rather than silently absorbed. The threshold is a design choice, not a measurement:
its purpose is to make *the absence of monitoring* itself visible.

## Why externalise it

- An internal intention leaves no trace, so it cannot be audited, counted, or improved.
- External structure survives context loss — the note, the log, and the label persist after the reasoning
  is gone ([[selective-persistent-memory|Selective Persistent Memory]]).
- Rules that were themselves derived from failures are the strongest form: each rule carries the date of
  the failure that produced it, so the standard layer accretes evidence
  ([[learning-acceleration-loop|Learning Acceleration Loop]]).

> ⚠️ Honest scope: the protocol's own thresholds (≥3 steps / ≥5 minutes, two misses) are this vault's
> design choices, not research findings. The supporting research is about *calibration being trainable and
> imperfect* — not about these particular numbers.

## See Also

- [[investigation-before-judgement|Investigation Before Judgement]] — the evidence discipline the checks enforce
- [[review-and-recall-rhythm|Review and Recall Rhythm]] — where post-action calibration gets scheduled
- [[learning-acceleration-loop|Learning Acceleration Loop]] — the loop the protocol keeps honest
- [[selective-persistent-memory|Selective Persistent Memory]] — why the record must be external

## 中文速览

- **元认知 = 关于认知的知识 + 对认知的调节**（Flavell 双维）；最容易丢的是「执行中」的调节——事后复盘只是子集。
- **裸自省不可靠**（概念注入实验检测率约 20%），所以必须外置成可审计痕迹。
- **三阶段**：①执行前三问（我在执行什么 / 依据是什么 / 置信度先标再写）②执行中监控（≥3 步、≥5 分钟、多工具，在阶段转换/遇阻/报错/被打断时自问「我现在可能犯什么错」）③执行后校准四项（规则合规、被指出错第一反应是「我查一下」而非解释、全局搜同类错误、回看置信度与结果是否一致）。
- **置信度四标记**：[事实] / [推断] / [推测-待确认]（必须给可验证条件）/ [已确认]。
- **熔断**：连续 2 次漏检自检或标记 → 记 `[METACOG WARN]` 并汇报。
- ⚠️ 阈值（≥3 步/≥5 分钟/连续 2 次）是本库设计选择，不是研究结论。

## Provenance

Distilled from the owner's Note vault: `80_Zettelkasten/元认知.md`, `元认知监控协议.md`,
`元认知与AGENTS.md建设.md`, `70_MOCs/元认知-MOC.md`. Research pointers (Flavell 1979; SaySelf EMNLP 2024;
Wang et al. AAAI 2025 on decoupling metacognition from cognition) are cited in the source notes; only
Flavell is linked here as a resolvable reference.

[^flavell]: Flavell, J. H. (1979). Metacognition and cognitive monitoring. *American Psychologist* 34(10),
    906–911 — <https://doi.org/10.1037/0003-066X.34.10.906>.
