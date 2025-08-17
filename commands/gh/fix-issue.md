---
description: 修复 GitHub Issue
argument-hint: [issue-number]
allowed-tools: Write, Read, LS, Glob, Grep, Bash(gh:*), Bash(git:*)
---

请按照以下步骤分析并修复 GitHub Issue $ARGUMENTS：

# 计划阶段

1. 使用 'gh issue view' 获取 Issue 详情
2. 理解 Issue 中描述的问题
3. 如有必要，提出澄清问题
4. 了解此 Issue 的相关背景
   - 在 scratchpad 中搜索与此 Issue 相关的之前想法
   - 搜索 PR 记录，查看此 Issue 是否有历史处理记录
   - 在代码库中搜索相关文件
5. 深入思考如何将 Issue 分解为一系列小而可管理的任务
6. 在新的 scratchpad 中记录你的计划
   - 在文件名中包含 Issue 名称
   - 在 scratchpad 中包含指向 Issue 的链接

# 创建阶段

- 为此 Issue 创建新分支
- 根据你的计划，通过小而可管理的步骤解决 Issue
- 每完成一个步骤后提交你的更改

# 测试阶段

- 如果你对 UI 做了更改且 puppeteer 在你的工具列表中，请通过 MCP 使用 puppeteer 测试更改
- 编写单元测试来描述代码的预期行为
- 运行完整的测试套件以确保没有破坏任何功能
- 如果测试失败，请修复它们
- 确保所有测试都通过后再进入下一步

# 开启 Pull Request

- 开启 PR 并请求代码评审

记住在所有 GitHub 相关任务中使用 GitHub CLI ('gh')。