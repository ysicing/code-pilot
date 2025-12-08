---
description: 使用计划模板执行实施规划工作流，生成设计文档
handoffs:
  - label: Create Tasks
    agent: spec-kit:tasks
    prompt: Break the plan into tasks
    send: true
  - label: Create Checklist
    agent: spec-kit:checklist
    prompt: Create a checklist for the following domain...
---

## 用户输入

```text
$ARGUMENTS
```

在继续之前，你**必须**考虑用户输入（如果不为空）。

## 概要

1. **设置**：从仓库根目录运行 `$HOME/.claude/scripts/specify/setup-plan.sh --json`，解析 JSON 获取 FEATURE_SPEC、IMPL_PLAN、SPECS_DIR、BRANCH。对于参数中的单引号（如 "I'm Groot"），使用转义语法：例如 'I'\''m Groot'（或尽可能使用双引号："I'm Groot"）。

2. **加载上下文**：读取 FEATURE_SPEC 和 `.claude/memory/constitution.md`。加载 IMPL_PLAN 模板（已复制）。

3. **执行计划工作流**：遵循 IMPL_PLAN 模板中的结构：
   - 填充技术上下文（将未知项标记为 "NEEDS CLARIFICATION"）
   - 从 Constitution 填充 Constitution Check 部分
   - 评估门控（如果违规无理由则 ERROR）
   - Phase 0：生成 research.md（解决所有 NEEDS CLARIFICATION）
   - Phase 1：生成 data-model.md、contracts/、quickstart.md
   - Phase 1：通过运行 agent 脚本更新 agent 上下文
   - 设计后重新评估 Constitution Check

4. **停止并报告**：命令在 Phase 2 规划后结束。报告分支、IMPL_PLAN 路径和生成的文档。

## 阶段

### Phase 0：大纲和研究

1. **从上面的技术上下文中提取未知项**：
   - 对于每个 NEEDS CLARIFICATION → 研究任务
   - 对于每个依赖 → 最佳实践任务
   - 对于每个集成 → 模式任务

2. **生成并派发研究代理**：

   ```text
   对于技术上下文中的每个未知项：
     任务："为 {feature context} 研究 {unknown}"
   对于每个技术选择：
     任务："查找 {domain} 中 {tech} 的最佳实践"
   ```

3. **在 `research.md` 中整合发现**，使用格式：
   - 决策：[选择的内容]
   - 理由：[为什么选择]
   - 考虑的替代方案：[还评估了什么]

**输出**：包含所有已解决 NEEDS CLARIFICATION 的 research.md

### Phase 1：设计和契约

**前提条件**：`research.md` 完成

1. **从功能规范中提取实体** → `data-model.md`：
   - 实体名称、字段、关系
   - 来自需求的验证规则
   - 状态转换（如果适用）

2. **从功能需求生成 API 契约**：
   - 对于每个用户操作 → 端点
   - 使用标准 REST/GraphQL 模式
   - 输出 OpenAPI/GraphQL schema 到 `/contracts/`

3. **Agent 上下文更新**：
   - 运行 `$HOME/.claude/scripts/specify/update-agent-context.sh claude`
   - 这些脚本检测正在使用的 AI agent
   - 更新适当的 agent 特定上下文文件
   - 仅添加当前计划中的新技术
   - 保留标记之间的手动添加

**输出**：data-model.md、/contracts/*、quickstart.md、agent 特定文件

## 关键规则

- 使用绝对路径
- 在门控失败或未解决的澄清上 ERROR
