---
description: 创建新的 Claude Code 自定义命令
argument-hint: [command-name] [description]
allowed-tools: Write, Read, LS, Bash(mkdir:*), Bash(ls:*), WebSearch(*)
---

# 创建命令

创建新的 Claude Code 自定义命令，遵循正确结构和最佳实践。

## 用法：

`/create-command [command-name] [description]`

## 流程：

### 1. 命令分析

- 确定命令用途和范围
- 选择合适位置（项目级还是用户级）
- 分析类似现有命令的模式

### 2. 命令结构规划

- 定义必需的 parameters 和 arguments
- 规划命令 workflow 和步骤
- 识别所需 tools 和权限
- 考虑错误处理和边界情况

### 3. 命令创建

- 使用正确的 YAML frontmatter 创建命令文件
- 包含全面的文档
- 添加用法示例和 parameter 描述
- 使用 `$ARGUMENTS` 实现适当的 argument 处理

### 4. 质量保证

- 验证命令语法和结构
- 测试命令功能
- 确保正确的 tool 权限
- 根据最佳实践进行评审

## Template 结构：

```markdown
---
description: 命令的简要描述
argument-hint: 期望的 arguments 格式
allowed-tools: 所需 tools 列表
---

# Command Name

详细描述此命令的作用以及何时使用。

## 用法：

`/[category:]command-name [arguments]`

## 流程：

1. 逐步说明
2. 清晰的 workflow 定义
3. 错误处理考虑

## 示例：

- 具体使用示例
- 不同的 parameter 组合

## 注意事项：

- 重要考虑事项
- 限制或要求
```

## 最佳实践：

- 保持命令专注和单一用途
- 使用描述性名称和清晰文档
- 在 frontmatter 中包含正确的 tool 权限
- 提供有用的示例和使用模式
- 通过验证优雅地处理 arguments
- 遵循现有命令惯例
- 部署前彻底测试

## 你的任务：

按照以下指导原则创建名为"$ARGUMENTS"的新命令：

1. 如果描述不清楚，询问命令用途的澄清
2. 确定合适的位置(项目级 vs 用户级), 放到对应的custom目录下
3. 创建具有正确结构的命令文件
4. 包含全面的文档和示例
5. 验证命令语法和功能
