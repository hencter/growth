#!/bin/bash
# Skill 修复脚本
# 用法: ./fix-skill.sh <skill-name> [description]

set -e

SKILL_NAME="$1"
DESCRIPTION="$2"
SKILL_DIR=".agents/skills/$SKILL_NAME"
SKILL_FILE="$SKILL_DIR/SKILL.md"

if [ -z "$SKILL_NAME" ]; then
    echo "用法: $0 <skill-name> [description]"
    echo "示例: $0 folo \"Manage RSS subscriptions via Folo CLI\""
    exit 1
fi

if [ ! -d "$SKILL_DIR" ]; then
    echo "错误: skill 目录不存在: $SKILL_DIR"
    exit 1
fi

if [ ! -f "$SKILL_FILE" ]; then
    echo "错误: SKILL.md 文件不存在: $SKILL_FILE"
    exit 1
fi

# 检查是否已有 YAML frontmatter
if head -1 "$SKILL_FILE" | grep -q "^---"; then
    echo "✅ Skill '$SKILL_NAME' 已有 YAML frontmatter"
    exit 0
fi

# 生成描述（如果未提供）
if [ -z "$DESCRIPTION" ]; then
    # 从文件内容提取第一行作为描述
    FIRST_LINE=$(head -5 "$SKILL_FILE" | grep -v "^#" | head -1 | sed 's/^#* //' | cut -c1-100)
    DESCRIPTION="$FIRST_LINE"
fi

# 创建临时文件
TEMP_FILE=$(mktemp)

# 添加 YAML frontmatter
cat > "$TEMP_FILE" << EOF
---
name: $SKILL_NAME
description: $DESCRIPTION
license: MIT
compatibility: opencode
metadata:
  audience: users
  workflow: skill-maintenance
---

EOF

# 追加原始内容
cat "$SKILL_FILE" >> "$TEMP_FILE"

# 替换原文件
mv "$TEMP_FILE" "$SKILL_FILE"

echo "✅ Skill '$SKILL_NAME' 修复完成"
echo "📝 添加的 frontmatter:"
echo "---"
echo "name: $SKILL_NAME"
echo "description: $DESCRIPTION"
echo "license: MIT"
echo "compatibility: opencode"
echo "metadata:"
echo "  audience: users"
echo "  workflow: skill-maintenance"
echo "---"
echo ""
echo "🔄 需要重启 OpenCode 才能生效"
echo "🔍 验证命令: skill({ name: \"$SKILL_NAME\" })"