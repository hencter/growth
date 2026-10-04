---
trust_level: internal
name: skill-fixer
description: 诊断和修复 OpenCode skill 加载问题，添加缺失的 YAML frontmatter
license: MIT
compatibility: opencode
metadata:
  audience: maintainers
  workflow: skill-maintenance
datetime: "2026-06-07T13:39"
tags:
  - 技术
  - 方法
type: rule
---

# Skill 修复器

## 功能

自动诊断和修复 OpenCode skill 加载问题，主要解决：
1. 缺少 YAML frontmatter 导致 skill 无法识别
2. 格式不规范导致加载失败
3. 路径问题检测

## 触发条件

当出现以下情况时使用本技能：

- Skill 无法加载（`Error: Skill "xxx" not found`）
- 用户说"skill 加载失败"、"skill 识别不了"
- 新安装的 skill 在重启 OpenCode 后仍不可用
- 需要批量修复 skills 目录

## 修复流程

### 1. 诊断阶段
```bash
# 检查 skill 是否存在
ls -la .agents/skills/<skill-name>/

# 检查 SKILL.md 格式
head -20 .agents/skills/<skill-name>/SKILL.md
```

### 2. 修复阶段
**缺失 YAML frontmatter 的修复模板：**
```yaml
---
name: <skill-name>
description: <skill-description>
license: MIT
compatibility: opencode
metadata:
  audience: users/maintainers
  workflow: <workflow-type>
---
```

**关键字段说明：**
- `name`: 必须与目录名一致
- `description`: 1-2 句话描述功能
- `license`: 默认 MIT
- `compatibility`: 必须为 `opencode`
- `metadata.audience`: `users`（终端用户）或 `maintainers`（维护者）
- `metadata.workflow`: 工作流类型（如 `news-aggregation`, `rss-management`, `code-review`）

### 3. 验证阶段
```bash
# 重启 OpenCode 后验证
skill({ name: "<skill-name>" })
```

## 使用示例

### 案例 1：修复 folo skill
```markdown
原始内容：
# Folo CLI Skill
## Trigger Conditions
...

修复后：
---
name: folo
description: Manage RSS subscriptions and browse timeline entries via Folo CLI
license: MIT
compatibility: opencode
metadata:
  audience: users
  workflow: rss-management
---

# Folo CLI Skill
## Trigger Conditions
...
```

### 案例 2：修复 news-aggregator-unified skill
```markdown
原始内容：
# Skill: news-aggregator-unified
# 统一新闻情报聚合器
...

修复后：
---
name: news-aggregator-unified
description: 一站式完成「多平台热点采集」+「信源分层评估」+「价值评分」+「报告生成」
license: MIT
compatibility: opencode
metadata:
  audience: users
  workflow: news-aggregation
---

# Skill: news-aggregator-unified
# 统一新闻情报聚合器
...
```

## 批量修复模式

当需要修复多个 skills 时：

1. 扫描 `.agents/skills/` 目录
2. 检查每个 skill 的 SKILL.md 是否包含 YAML frontmatter
3. 对缺失的 skill 应用修复模板
4. 生成修复报告

## 故障排除

### 常见问题
1. **skill 仍无法加载**
   - 检查目录名与 `name:` 字段是否一致
   - 确认文件编码为 UTF-8
   - 验证 YAML 格式正确（无缩进错误）

2. **部分内容丢失**
   - 修复时保留原始内容，仅在开头添加 frontmatter
   - 使用 `sed` 或文本编辑工具确保内容完整

3. **重启后仍无效**
   - OpenCode 可能需要完全重启（非热重载）
   - 检查 `.agents/skills/` 目录权限

## 输出格式

修复完成后输出：
- 修复的 skill 列表
- 添加的 frontmatter 内容
- 需要重启 OpenCode 的提醒
- 验证命令

## 注意事项

- 仅修改 `.agents/skills/` 目录下的文件
- 保留原始文件的全部内容
- 修复后必须重启 OpenCode 才能生效
- 建议在修改前备份重要 skills