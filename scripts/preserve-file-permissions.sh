#!/bin/bash

# 权限保护脚本
# 保持文件的原有权限

# 获取文件路径
if [ -n "${1:-}" ]; then
  file_path="$1"
else
  file_path=$(jq -r '.tool_input.file_path // empty' <<<"${CLAUDE_TOOL_INPUT:-$(cat)}")
fi

# 如果文件存在，保持其权限不变
if [ -f "$file_path" ]; then
    # 获取原始权限
    original_perms=$(stat -c %a "$file_path" 2>/dev/null)
    
    # 如果获取权限成功，确保权限保持不变
    if [ -n "$original_perms" ]; then
        chmod "$original_perms" "$file_path" 2>/dev/null
    fi
fi

exit 0