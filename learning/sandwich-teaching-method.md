---
type: Concept
title: "Sandwich Teaching Method"
description: Entering a new field by analogy → minimal definition → immediate hands-on loop, because the bottleneck for beginners is a retrieval address, not information volume.
tags: [learning, teaching, method, curriculum]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T05:28:00+08:00 }
id: "20261005T052800"
status: budding
difficulty: intermediate
domain: learning-and-growth
related:
  - "[[output-based-retention|Output-Based Retention]]"
  - "[[learning-acceleration-loop|Learning Acceleration Loop]]"
  - "[[first-principles-thinking|First Principles Thinking]]"
  - "[[naval-learning-method|Naval Learning Method]]"
sources:
  - id: note-vault-sandwich
    resource: "Scope: owner's Note vault — 80_Zettelkasten/三明治教学法.md"
    title: "Note vault: sandwich teaching method (analogy → definition → practice)"
confidence: 0.8
summary: >
  Teach a new field in three layers — an analogy drawn from the learner's own domain, a two-to-three
  sentence minimal definition of the input→process→output, then a minimal hands-on step that produces
  feedback immediately; volume is not the bottleneck, a retrieval address is.
---

# Sandwich Teaching Method

## Overview

The intuition that beginners need *more information* is wrong. They need a **retrieval address**: somewhere
in their existing knowledge to hang the new term. Analogy is not rhetorical politeness — it is pre-allocation
of storage. The method therefore has a fixed order that may not be shuffled: **analogy → minimal definition
→ hands-on**.

## The three layers

| Layer | Content | Rule |
|-------|---------|------|
| **1. Analogy** | map the new field onto a system the learner already runs | use *their* domain's vocabulary; never open with a definition |
| **2. Minimal definition** | 2–3 sentences covering only input → process → output, plus a crude ASCII diagram | resist completeness; completeness is a later layer |
| **3. Immediate practice** | one minimal operation or pseudo-code block | must produce observable feedback in minutes |

Worked analogy (teaching biology to a programmer): the ribosome is a compiler, alternative splicing is
function overloading, the genome is a multi-billion-character legacy codebase, and the ~99% non-coding
region is commented-out zombie code. Each analogy is wrong in detail and useful in structure — which is
exactly the trade being made.

## Fast/slow alternation

New tooling follows a **black box first, white box second** order:

1. Run it and get a result (feedback, motivation, a working baseline).
2. Then open it up and study the algorithm.

Doing it in the reverse order produces learners who understand the mechanism and have never seen it work.

## Curriculum by data flow

Sequence the syllabus along the target domain's **standard data flow**, so the main line is a chain of
format conversions. In bioinformatics: FASTQ → quality control → alignment (SAM/BAM) → variants (VCF).
Each step is a hand-off the learner can see, and each hand-off is a natural chapter boundary.

## Misconception pre-emption

List the field's default-assumption traps *before* the first lesson. The source's example — programmers
entering bioinformatics — carries three: assuming data is independent and identically distributed,
assuming data is clean, and assuming problems have exact solutions. In reality: high noise, batch effects,
and NP-hard problems solved by heuristics.

Pair this with a **diagnostic opening**: scenario questions rather than definition questions, to find where
the learner actually stands, and follow a correct answer with an abnormal case (power loss, memory
exhaustion). Reciting a definition is not understanding a constraint.

## Numbers in the source

| Claim | Value | Status |
|-------|-------|--------|
| Minimal definition length | 2–3 sentences | design rule |
| Diagnostic-to-route turnaround | ~30-day personalised route | design rule |
| Non-coding share of the genome in the analogy | ~99% | illustrative, not a citation |

## Anti-patterns

- **Definition first** — the most common way to lose a beginner in the first minute.
- **Complete theory before contact** — produces people who can explain but not operate.
- **Analogy without correction** — analogies are scaffolding; say where each one breaks.
- **Teaching by coverage** — marching through a syllabus in textbook order instead of data-flow order.

## See Also

- [[output-based-retention|Output-Based Retention]] — why layer 3 is non-optional
- [[learning-acceleration-loop|Learning Acceleration Loop]] — this method is the loop applied to teaching
- [[naval-learning-method|Naval Learning Method]] — skeleton-building from the teacher's side
- [[first-principles-thinking|First Principles Thinking]] — where the analogy must eventually be replaced

## 中文速览

- **跨学科入门的瓶颈是「检索地址」，不是信息量**：先用类比给新知识占位，再给最小定义，最后立刻动手。
- **三层顺序不可打乱**：①用学员本行的概念做类比（禁止直接抛定义）②2-3 句最小定义（只讲输入-处理-输出 + 一张 ASCII 图）③一段最小操作，几分钟内拿到反馈。
- **快慢交替**：新工具先黑盒跑通（拿成就感），再白盒拆算法（给理解）。
- **按数据流排课**：以目标领域的标准数据流为主线（如生信 FASTQ→质控→比对→变异），格式转换就是章节边界。
- **默认假设排雷前置**：先列误区清单再开第一课（程序员进生信的三误区：数据独立同分布 / 干净 / 有精确解）。
- **开场诊断 + 韧性测试**：用场景判断题定位水平，答对后立刻追问异常场景（断电/内存不足）。
- 反面模式：定义先行、讲完理论才动手、类比不做边界修正、按教材顺序覆盖式教学。

## Provenance

Distilled from the owner's Note vault: `80_Zettelkasten/三明治教学法.md`.
