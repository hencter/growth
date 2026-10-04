---
type: Concept
title: "Memory Palace Dual Coding"
description: Splitting semantic memory from spatial memory — the graph answers "what relates to what", the palace answers "where is it", and the two orders must not be merged.
tags: [learning, memory, obsidian, method]
generated: { by: dsh/deepseek-flash, at: 2026-10-05T04:36:11+08:00 }
id: "20261005T043611"
status: budding
difficulty: intermediate
domain: learning-and-growth
related:
  - "[[review-and-recall-rhythm|Review and Recall Rhythm]]"
  - "[[progressive-disclosure|Progressive Disclosure]]"
  - "[[zettelkasten-methodology|Zettelkasten Methodology]]"
  - "[[learning-acceleration-loop|Learning Acceleration Loop]]"
sources:
  - id: note-vault-palace
    resource: "Scope: owner's Note vault — 80_Zettelkasten/Obsidian记忆宫殿双编码法.md"
    title: "Note vault: Obsidian memory palace + dual coding protocol"
confidence: 0.55
summary: >
  Run two memory systems in parallel instead of one: the knowledge graph carries semantic order (what
  connects to what) and a memory palace carries episodic order (where a thing sits) — palace positions
  optimise for recallability, categories stay in the graph.
---

# Memory Palace Dual Coding

## Overview

Most note systems force one structure to do two jobs: represent relationships *and* provide retrieval
cues. That is why filing fights feel unwinnable — a folder hierarchy is a spatial order pretending to be
a semantic one.

The dual-coding split resolves it:

| System | Order it holds | Answers | Optimised for |
|--------|----------------|---------|---------------|
| **Knowledge graph** (wiki links) | semantic | "what relates to what?" | correctness of connection |
| **Memory palace** (spatial route) | episodic | "where did I put it?" | speed of recall |

Positions in the palace are chosen for **recallability** (vivid, unique, absurd); categorisation is left to
the graph. Once separated, "where should this note live" stops being a taxonomy debate.

## Building the minimum palace

1. **Body-pit** — use your own body as the first route (feet → knees → … → hair). It is always available
   and always in the same order.
2. **Encode with three rules**: involve the senses; put *yourself* inside the image interacting with it;
   exaggerate or make it absurd. Blandness is why palace attempts fail.
3. **One concept per locus**, one locus per slot on the route.
4. **Walk the route to retrieve**, not to review: the walk is the retrieval attempt.

## The memory-OS analogy

The source frames the palace as an operating system, which is a useful mental model because every
component must be imageable and explicable:

| OS part | Palace part |
|---------|-------------|
| CPU | the central seat — what attention is on right now |
| RAM | the entrance whiteboard — temporary information |
| Disk | palace floors — categorised long-term storage |
| Filesystem | index cards — one cue per stored bundle |
| Background process | the review sprite — spaced repetition running unasked |

## Index, do not store the text

A palace stores **cues**, not content: the book's cover/title/timestamp plus a page-per-chapter marker
image. Retrieval walks the route until the marker fires, and the marker pulls the chapter back. Trying to
store prose spatially is how palaces become unusable.

## Implementing it inside Obsidian (no plugins)

- Put the locus in frontmatter: `palace_location: "<wikilink to the palace note>#<locus>"` — a property plus a heading
  anchor is enough.
- Backlinks do the rest: the palace note becomes a hub, because every note with a `palace_location`
  pointing at it is listed there.
- **One-hour minimum loop**: 5 loci + 5 new terms + a story linking them + close the notes and walk the
  route from memory + inspect the backlink hub. All native capability — anchors, properties, backlinks.

## Where the AI belongs

The assistant is an **association generator**: give it the concept and the locus, ask for one absurd,
sensory image. Placement decisions stay human — the encoding strength comes from exaggeration and spatial
uniqueness, and those are yours.

> ⚠️ Honest scope: the source note itself labels effectiveness as `[inference]`, and the AI-accelerated
> encoding path had not been tested in practice there. Treat this as a designed experiment you are running,
> not a validated technique.

## Anti-patterns

- **Storing text in the palace** — cues only; prose belongs in notes.
- **Reusing one locus** for many concepts — spatial uniqueness is the entire mechanism.
- **Merging orders** — filing the palace by topic destroys the episodic cue that made it work.
- **Building 50 loci before walking 5** — the minimum loop first, or the palace becomes another
  unfinished project.

## See Also

- [[review-and-recall-rhythm|Review and Recall Rhythm]] — retrieval practice, the behavioural half
- [[progressive-disclosure|Progressive Disclosure]] — index-and-trigger as a general pattern
- [[zettelkasten-methodology|Zettelkasten Methodology]] — the semantic side of the split
- [[learning-acceleration-loop|Learning Acceleration Loop]] — where encoding sits in the loop

## 中文速览

- **两套记忆系统分工**：图谱管语义（什么和什么有关），宫殿管情景（东西放在哪）。位置按「可回忆性」选（五感、我在画面里互动、荒诞夸张），分类交给图谱链接——「这条笔记该归哪个文件夹」的争论就此消失。
- **最小宫殿（身体桩）**：脚→膝→…→头发；一个位置一个概念；走路线＝检索动作。
- **记忆操作系统类比**：CPU＝中央王座（当下注意力）、内存＝入口白板、硬盘＝宫殿楼层、文件系统＝索引卡片、后台进程＝复习精灵（间隔重复）。
- **只存索引不存全文**：实体书封面/标题/时间戳 + 每章一个标记图像；翻到图像触发整章。
- **Obsidian 原生落地**：frontmatter 写 `palace_location: <指向宫殿笔记的 wikilink>#锚点`，靠反链让宫殿笔记成为中枢；**一小时最小闭环**＝5 个位置 + 5 个新词 + 编故事 + 合上笔记走一遍 + 看反链中枢。
- **分工**：AI 只做「联想生成器」（给概念与位置，要一句荒诞画面），放哪里由人定。
- ⚠️ 源笔记自标效果置信度为 [推断]，AI 加速编码路径未经验证——把它当作你自己在跑的一个实验。

## Provenance

Distilled from the owner's Note vault: `80_Zettelkasten/Obsidian记忆宫殿双编码法.md`.
