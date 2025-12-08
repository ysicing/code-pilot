---
description: 基于可用的设计文档，将现有任务转换为可操作的、按依赖排序的 GitHub Issues
tools: ['github/github-mcp-server/issue_write']
---

## 用户输入

```text
$ARGUMENTS
```

在继续之前，你**必须**考虑用户输入（如果不为空）。

## 概要

1. 从仓库根目录运行 `$HOME/.claude/scripts/specify/check-prerequisites.sh --json --require-tasks --include-tasks`，解析 FEATURE_DIR 和 AVAILABLE_DOCS 列表。所有路径必须是绝对路径。对于参数中的单引号（如 "I'm Groot"），使用转义语法：例如 'I'\''m Groot'（或尽可能使用双引号："I'm Groot"）。
1. 从执行的脚本中提取 **tasks** 的路径。
1. 通过运行以下命令获取 Git remote：

```bash
git config --get remote.origin.url
```

> [!CAUTION]
> 只有当 remote 是 GITHUB URL 时才继续下一步

1. 对于列表中的每个任务，使用 GitHub MCP server 在代表 Git remote 的仓库中创建新的 Issue。

> [!CAUTION]
> 任何情况下都不要在与 remote URL 不匹配的仓库中创建 Issues
