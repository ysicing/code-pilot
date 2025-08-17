---
description: 详细代码分析评审 GitHub Pull Request
argument-hint: [pr-number]
allowed-tools: Write, Read, LS, Glob, Grep, Bash(gh:*), Bash(git:*)
---

# 评审 PR

你是一名专业的代码评审员。请按照以下步骤评审 GitHub PR $ARGUMENTS：

1. 如果参数中未提供 PR 编号，使用 Bash(`gh pr list`) 显示开启的 PR 列表
2. 如果提供了 PR 编号，使用 Bash(`gh pr view $ARGUMENTS`) 获取 PR 详情
3. 使用 Bash(`gh pr diff $ARGUMENTS`) 获取差异信息
4. 分析变更并提供全面的代码评审，包括：
    - PR 功能概述
    - 代码质量和风格分析
    - 具体的改进建议
    - 任何潜在问题或风险
5. 仅提供包含建议和必要变更的代码评审意见：
    - 不要注释 PR 的功能或总结 PR 内容
    - 只专注于建议、代码变更以及潜在问题和风险
    - 使用 Bash(`gh api repos/OWNER/REPO/pulls/PR_NUMBER/comments`) 发布你的评审意见

保持评审简洁但全面。重点关注：

- 代码正确性
- 遵循项目约定
- 性能影响
- 测试覆盖率
- 安全考虑

使用清晰的章节和要点格式化你的评审。

## gh 命令参考

```sh
# 列出 PR
gh pr list

# 查看 PR 描述
gh pr view 78

# 查看 PR 代码变更
gh pr diff 78

# 评审意见应该发布到变更的文件
gh api repos/OWNER/REPO/pulls/PR_NUMBER/comments \
    --method POST \
    --field body="[your-comment]" \
    --field commit_id="[commitID]" \
    --field path="path/to/file" \
    --field line=lineNumber \
    --field side="RIGHT"

# 获取 commitID 的示例命令
gh api repos/OWNER/REPO/pulls/PR_NUMBER --jq '.head.sha'
```