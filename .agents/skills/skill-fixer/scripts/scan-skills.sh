#!/bin/bash
# 扫描并报告所有 skills 的状态

SKILLS_DIR=".agents/skills"
REPORT_FILE="skill-scan-report-$(date +%Y%m%d-%H%M%S).md"

echo "# Skill 扫描报告" > "$REPORT_FILE"
echo "生成时间: $(date)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "🔍 扫描 $SKILLS_DIR 目录..."
echo ""

total_skills=0
valid_skills=0
invalid_skills=0

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    skill_file="$skill_dir/SKILL.md"
    
    if [ ! -f "$skill_file" ]; then
        echo "❌ $skill_name: 缺少 SKILL.md 文件"
        echo "## ❌ $skill_name" >> "$REPORT_FILE"
        echo "- 状态: 缺少 SKILL.md 文件" >> "$REPORT_FILE"
        invalid_skills=$((invalid_skills + 1))
        continue
    fi
    
    total_skills=$((total_skills + 1))
    
    # 检查 YAML frontmatter
    if head -1 "$skill_file" | grep -q "^---"; then
        # 提取 frontmatter 信息
        name_line=$(grep -i "^name:" "$skill_file" | head -1)
        desc_line=$(grep -i "^description:" "$skill_file" | head -1)
        
        if [ -n "$name_line" ] && [ -n "$desc_line" ]; then
            echo "✅ $skill_name: 格式正确"
            echo "## ✅ $skill_name" >> "$REPORT_FILE"
            echo "- 状态: 格式正确" >> "$REPORT_FILE"
            echo "- $name_line" >> "$REPORT_FILE"
            echo "- $desc_line" >> "$REPORT_FILE"
            valid_skills=$((valid_skills + 1))
        else
            echo "⚠️  $skill_name: 有 frontmatter 但字段不全"
            echo "## ⚠️  $skill_name" >> "$REPORT_FILE"
            echo "- 状态: frontmatter 字段不全" >> "$REPORT_FILE"
            invalid_skills=$((invalid_skills + 1))
        fi
    else
        echo "❌ $skill_name: 缺少 YAML frontmatter"
        echo "## ❌ $skill_name" >> "$REPORT_FILE"
        echo "- 状态: 缺少 YAML frontmatter" >> "$REPORT_FILE"
        
        # 提取可能的描述
        first_line=$(head -5 "$skill_file" | grep -v "^#" | head -1 | sed 's/^#* //' | cut -c1-80)
        echo "- 建议描述: $first_line" >> "$REPORT_FILE"
        
        invalid_skills=$((invalid_skills + 1))
    fi
done

echo "" >> "$REPORT_FILE"
echo "## 统计摘要" >> "$REPORT_FILE"
echo "- 总 skills 数: $total_skills" >> "$REPORT_FILE"
echo "- 格式正确: $valid_skills" >> "$REPORT_FILE"
echo "- 需要修复: $invalid_skills" >> "$REPORT_FILE"

echo ""
echo "📊 扫描完成:"
echo "总 skills 数: $total_skills"
echo "✅ 格式正确: $valid_skills"
echo "❌ 需要修复: $invalid_skills"
echo ""
echo "📄 详细报告: $REPORT_FILE"

if [ $invalid_skills -gt 0 ]; then
    echo ""
    echo "🔧 修复建议:"
    echo "1. 使用 fix-skill.sh 脚本修复单个 skill:"
    echo "   ./fix-skill.sh <skill-name> \"<description>\""
    echo ""
    echo "2. 或手动添加 YAML frontmatter 到 SKILL.md 开头:"
    echo "   ---"
    echo "   name: <skill-name>"
    echo "   description: <skill-description>"
    echo "   license: MIT"
    echo "   compatibility: opencode"
    echo "   metadata:"
    echo "     audience: users"
    echo "     workflow: <workflow-type>"
    echo "   ---"
fi