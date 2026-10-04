---
trust_level: internal
name: obsidian-bases
description: Create and edit Obsidian Bases (.base files) with views, filters, formulas, and summaries. Use when working with .base files, creating database-like views of notes, or when the user mentions Bases, table views, card views, filters, or formulas in Obsidian.
datetime: "2026-06-07T13:39"
lastmod: "2026-08-18T23:10"
tags:
  - 技术
  - 方法
  - 案例
type: task
---

## 触发场景

> [!tip] 公式函数完整参考见 [[references/FUNCTIONS_REFERENCE.md|FUNCTIONS_REFERENCE.md]]（全局/任意类型/日期/字符串/列表/数字/文件函数全表）

- 帮我在 Obsidian 里建一个数据库视图（表格 / 卡片 / 列表 / 地图）
- 新建或修改 .base 文件，给笔记加筛选、排序、汇总
- 用过滤器按标签 / 文件夹 / 属性筛笔记，写公式做统计

# Obsidian Bases Skill

## Workflow

1. **Create the file**: Create a `.base` file in the vault with valid YAML content
2. **Define scope**: Add `filters` to select which notes appear (by tag, folder, property, or date)
3. **Add formulas** (optional): Define computed properties in the `formulas` section
4. **Configure views**: Add one or more views (`table`, `cards`, `list`, or `map`) with `order` specifying which properties to display
5. **Validate**: Verify the file is valid YAML with no syntax errors. Check that all referenced properties and formulas exist. Common issues: unquoted strings containing special YAML characters, mismatched quotes in formula expressions, referencing `formula.X` without defining `X` in `formulas`
6. **Test in Obsidian**: Open the `.base` file in Obsidian to confirm the view renders correctly. If it shows a YAML error, check quoting rules below

## Schema

Base files use the `.base` extension and contain valid YAML.

```yaml
# Global filters apply to ALL views in the base
filters:
  # Can be a single filter string
  # OR a recursive filter object with and/or/not
  and: []
  or: []
  not: []

# Define formula properties that can be used across all views
formulas:
  formula_name: 'expression'

# Configure display names and settings for properties
properties:
  property_name:
    displayName: "Display Name"
  formula.formula_name:
    displayName: "Formula Display Name"
  file.ext:
    displayName: "Extension"

# Define custom summary formulas
summaries:
  custom_summary_name: 'values.mean().round(3)'

# Define one or more views
views:
  - type: table | cards | list | map
    name: "View Name"
    limit: 10                    # Optional: limit results
    groupBy:                     # Optional: group results
      property: property_name
      direction: ASC | DESC
    filters:                     # View-specific filters
      and: []
    order:                       # Properties to display in order
      - file.name
      - property_name
      - formula.formula_name
    summaries:                   # Map properties to summary formulas
      property_name: Average
```

## Filter Syntax

Filters narrow down results. They can be applied globally or per-view.

### Filter Structure

```yaml
# Single filter
filters: 'status == "done"'

# AND - all conditions must be true
filters:
  and:
    - 'status == "done"'
    - 'priority > 3'

# OR - any condition can be true
filters:
  or:
    - 'file.hasTag("book")'
    - 'file.hasTag("article")'

# NOT - exclude matching items
filters:
  not:
    - 'file.hasTag("archived")'

# Nested filters
filters:
  or:
    - file.hasTag("tag")
    - and:
        - file.hasTag("book")
        - 'priority > 3'
```

## Quoting Rules

| 场景 | 写法 | 说明 |
|------|------|------|
| 字符串值 | `'status == "done"'` | 外层单引号、内层双引号 |
| 含特殊 YAML 字符 | `'file.name.startsWith("2024")'` | 必须引号包裹 |
| 函数调用 | `file.hasTag("book")` | 双引号参数 |
| 数字比较 | `'priority > 3'` | 无需引号（纯数字+运算符） |
| 布尔 | `'done == true'` | 无需引号 |

> [!warning] 常见错误
> 未加引号的含空格表达式会破坏 YAML 解析；引号不配对（如外层双引号内再用双引号）会导致 Filter 失效。验证：在 Obsidian 中打开 .base 文件，若显示 YAML 错误按上表检查引号。

## 失败模式与兜底

| 触发条件 | 一线修复 | 仍失败兜底 |
|----------|---------|------------|
| Filter 语法错误（YAML 报错） | 按 Quoting Rules 检查引号配对 | 拆成单条件逐个测试定位 |
| 公式引用未定义 | 检查 formulas 节是否定义了 formula.X | 删除该公式属性或补定义 |
| 视图不渲染 | 检查 views 的 type/order 字段拼写 | 简化视图（去掉 groupBy/summaries）逐个排查 |
| references 函数记不清 | 加载 [[references/FUNCTIONS_REFERENCE.md\|FUNCTIONS_REFERENCE.md]] | 用 help 命令或官方文档核对 |
| .base 文件乱码 | 用 UTF-8 无 BOM 写入（禁 PowerShell Out-File） | 从 git 历史还原 |

## 检查点（.base 文件交付前）

- [ ] YAML 语法合法（单一块、闭合分隔线）
- [ ] filters 引号配对正确
- [ ] formulas 引用的属性都已定义
- [ ] views 的 type/order 字段拼写正确
- [ ] Obsidian 中实际渲染验证通过
- [ ] frontmatter 完整（type/datetime/tags）

## 反例与黑名单

| 禁止 | 原因 |
|------|------|
| 禁止未引号的含空格 Filter 表达式 | 破坏 YAML 解析 |
| 禁止引用未定义的 formula.X | 视图报错 |
| 禁止用 PowerShell Out-File 写 .base | 中文乱码 |
| 禁止手动改文件时破坏 YAML 缩进 | 解析失败 |
| 禁止把 .base 当 Markdown 处理 | 格式不同，用本 skill 或 obsidian-cli bases 命令 |
