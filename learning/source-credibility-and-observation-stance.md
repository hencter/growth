---
type: Concept
title: "Source Credibility and Observation Stance"
description: Grading sources L0–L5, separating signal from noise, and holding conclusions open — the intake filter that decides what deserves to enter your notes.
tags: [learning, evidence, information, method]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T04:36:11+08:00 }
id: "20261005T043611"
status: budding
difficulty: intermediate
domain: learning-and-growth
related:
  - "[[investigation-before-judgement|Investigation Before Judgement]]"
  - "[[independent-thinking-against-information-overload|Independent Thinking Against Information Overload]]"
  - "[[metacognition-monitoring-protocol|Metacognition Monitoring Protocol]]"
  - "[[learning-acceleration-loop|Learning Acceleration Loop]]"
sources:
  - id: note-vault-grading
    resource: "Scope: owner's Note vault — 30_Resources/知识管理/信源分级快速参考指南.md; 30_Resources/知识管理/信号与噪声方法论.md; 20_Areas/Learning/信息源可信度与观测立场.md"
    title: "Note vault: L0–L5 source grading, signal vs noise, observation stance"
confidence: 0.7
summary: >
  Not all inputs deserve the same trust: grade every source L0–L5, ask whether a claim changes the base
  rate (signal) or merely commands attention (noise), and when the evidence conflicts, hold the conclusion
  explicitly open instead of resolving it by preference.
---

# Source Credibility and Observation Stance

## Overview

Learning speed is capped by intake quality: material that enters your notes ungraded gets re-cited later
with the credibility you assumed at intake, not the credibility it earned. Two instruments fix the intake —
a **grading scale** for sources and a **signal test** for claims — plus one stance for ambiguity: keep the
conclusion labelled *under observation* rather than forcing a verdict.

## The L0–L5 grading scale

| Tier | What it is | Treatment | Weight |
|------|------------|-----------|--------|
| **L0** | original artefact — regulatory filings, financial statements, papers, official posts, official repositories | quote directly | +5 |
| **L1** | first-hand distribution — wire services (Reuters/AFP/Bloomberg), official press releases, official forums | verify against L0 where possible | +3 |
| **L2** | second-hand — mainstream, trade, and technical media | cross-verify | baseline |
| **L3** | aggregation — front pages, hot-search lists, Reddit front page | multi-source verification | −3 |
| **L4** | community signal — Hacker News, Product Hunt, V2EX, trending repos | must be confirmed at L0 | −5 |
| **L5** | AI summary / unverifiable — generated abstracts, social rumour, anonymous sourcing | do not cite as fact | −10 |

Verification status is scored separately from tier: **verified +10**, **pending −5**, **unverifiable −15**
(link dead, no official source). The recurring classification error in practice is treating an official
blog (L0) as a community signal (L4) — vendor blogs are primary sources for their own announcements and
secondary for everything else.

> ⚠️ The numeric weights are this vault family's house convention, not an external standard. Use them as a
> consistent ordering, not as measurements.

## Signal versus noise

The working definition: **signal changes the base rate; noise does not.** A claim that would not move your
prior is entertainment, however true it is.

**Five-question signal checklist**

1. Does it change the base rate?
2. Is there at least a second independent source?
3. Is the internal logic coherent?
4. Is it current enough to matter?
5. Is the source authority appropriate to the claim?

**Four filters** map to four noise types: source filter (prefer primary) → time filter → relevance filter →
emotion filter, against emotional, repetitive, irrelevant, and false noise respectively.

Strength ordering: **strong signal** (changes the base rate, multi-source, coherent) · **weak signal**
(small effect, single source) · **pseudo-signal** (no base-rate change, emotionally driven) · **noise**.
One-liner on prediction quality: accuracy, honesty (was it the best judgement available at the time?), and
economic value — grading outcomes by luck rather than process is the error this prevents.

## Bayesian update, informally

1. Write down the base rate before reading anything.
2. Judge how strongly the evidence discriminates between hypotheses.
3. Update: *new belief ≈ old belief × strength of evidence* (order-of-magnitude reasoning, not arithmetic).
4. Decide on the updated probability, and record what would reverse the update.

## The observation stance

When a source is questionable or two credible sources conflict, the correct output is **not** a forced
verdict — it is an explicit `under observation` label plus the specific evidence that would settle it.
Silence is not neutrality; an unlabelled guess is a claim.

## Anti-patterns

- **Tier inflation** — treating a repost as the original because it is convenient.
- **Volume as verification** — ten articles repeating one wire story is one source.
- **Confusing attention with importance** — the most-discussed claim is not the most base-rate-relevant.
- **Premature closure** — resolving a genuine conflict by preference instead of labelling it open.

## See Also

- [[investigation-before-judgement|Investigation Before Judgement]] — the discipline this intake filter serves
- [[independent-thinking-against-information-overload|Independent Thinking Against Information Overload]] — the cognitive side of the same problem
- [[metacognition-monitoring-protocol|Metacognition Monitoring Protocol]] — confidence labels that carry the grade forward
- [[learning-acceleration-loop|Learning Acceleration Loop]] — phase 2 needs this filter to be trustworthy

## 中文速览

- **信源分级 L0–L5**：L0 一手原物（公告/财报/论文/官方博客/官方仓库，+5）→ L1 一次分发（路透/官方新闻稿/官方论坛，+3）→ L2 二次分发（主流与行业媒体，基准）→ L3 聚合（头条/热搜，−3）→ L4 社区信号（HN/Product Hunt/V2EX，必须回到 L0 验证，−5）→ L5 AI 摘要与无法验证（−10）。
- **验证状态单独计分**：已验证 +10 / 待验证 −5 / 无法验证 −15。最常见分错：把官方博客（L0）当社区信号（L4）。
- **信号 vs 噪声**：信号改变基础率，噪声不改变。五问检查清单：改变基础率？≥2 个独立来源？逻辑自洽？时效性？信源权威？四类过滤（信源/时间/相关性/情绪）对应四类噪声（情绪/重复/无关/虚假）。
- **贝叶斯四步**：先写基础率 → 评估证据区分度 → 更新（新信念 ≈ 旧信念 × 证据强度）→ 按更新后的概率决策，并写下令你改变结论的条件。
- **观测立场**：源头可疑或可信源互相矛盾时，正确输出是标注「观测中」+ 说明什么证据能定论，**不是**硬给一个结论。
- ⚠️ 具体分值（+5/+3/−3/−5/−10、阈值）是本库家族的自定口径，不是外部标准——当排序用，别当测量值。
- 反面模式：层级通胀（把转载当原文）、以数量代替验证（十篇文章同源）、把热度当重要、过早收敛（用偏好解决真矛盾）。

## Provenance

Distilled from the owner's Note vault: `30_Resources/知识管理/信源分级快速参考指南.md`,
`30_Resources/知识管理/信号与噪声方法论.md`, `20_Areas/Learning/信息源可信度与观测立场.md`.
