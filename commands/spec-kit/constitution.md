---
description: 从交互式或提供的原则输入创建或更新项目 Constitution，确保所有依赖模板保持同步
handoffs:
  - label: Build Specification
    agent: spec-kit:specify
    prompt: Implement the feature specification based on the updated constitution. I want to build...
---

## 用户输入

```text
$ARGUMENTS
```

在继续之前，你**必须**考虑用户输入（如果不为空）。

## 概要

你正在更新 `.claude/memory/constitution.md` 中的项目 Constitution。此文件是一个模板，包含方括号中的占位符标记（例如 `[PROJECT_NAME]`、`[PRINCIPLE_1_NAME]`）。你的工作是 (a) 收集/派生具体值，(b) 精确填充模板，以及 (c) 在依赖文档中传播任何修订。

遵循以下执行流程：

1. 加载 `$HOME/.claude/memory/constitution.md` 中的现有 Constitution 模板。
   - 识别所有格式为 `[ALL_CAPS_IDENTIFIER]` 的占位符标记。
   **重要提示**：用户可能需要比模板中使用的原则更少或更多的原则。如果指定了数量，请尊重它 - 遵循通用模板。你将相应地更新文档。

2. 收集/派生占位符的值：
   - 如果用户输入（对话）提供了一个值，请使用它。
   - 否则从现有仓库上下文推断（README、docs、先前的 Constitution 版本（如果嵌入））。
   - 对于治理日期：`RATIFICATION_DATE` 是原始采用日期（如果未知，请询问或标记为 TODO），`LAST_AMENDED_DATE` 是今天（如果进行了更改），否则保留先前的值。
   - `CONSTITUTION_VERSION` 必须根据语义版本控制规则递增：
     - MAJOR：向后不兼容的治理/原则删除或重新定义。
     - MINOR：添加新原则/部分或大幅扩展指导。
     - PATCH：澄清、措辞、拼写错误修复、非语义改进。
   - 如果版本升级类型模糊，请在最终确定之前提出推理。

3. 起草更新的 Constitution 内容：
   - 用具体文本替换每个占位符（除了项目有意选择尚未定义的故意保留的模板槽外，不留下方括号标记——明确说明任何保留的原因）。
   - 保留标题层次结构，一旦替换，可以删除注释，除非它们仍然添加澄清指导。
   - 确保每个原则部分：简洁的名称行，段落（或项目符号列表）捕获不可协商的规则，如果不明显，则明确说明理由。
   - 确保治理部分列出修订程序、版本控制策略和合规性审查期望。

4. 一致性传播检查清单（将先前检查清单转换为主动验证）：
   - 读取 `$HOME/.claude/templates/specify/plan-template.md`，确保任何"Constitution Check"或规则与更新的原则对齐。
   - 读取 `$HOME/.claude/templates/specify/spec-template.md` 以进行范围/需求对齐——如果 Constitution 添加/删除强制性部分或约束，则更新。
   - 读取 `$HOME/.claude/templates/specify/tasks-template.md`，确保任务分类反映新的或删除的原则驱动的任务类型（例如，可观察性、版本控制、测试纪律）。
   - 读取 `$HOME/.claude/templates/specify/commands/*.md` 中的每个命令文件（包括这个），以验证在需要通用指导时不再有过时的引用（仅代理特定名称，如 CLAUDE）。
   - 读取任何运行时指导文档（例如，`README.md`、`docs/quickstart.md` 或代理特定的指导文件（如果存在））。更新对更改的原则的引用。

5. 生成同步影响报告（更新后在 Constitution 文件顶部添加为 HTML 注释）：
   - 版本更改：旧 → 新
   - 修改的原则列表（如果重命名，旧标题 → 新标题）
   - 添加的部分
   - 删除的部分
   - 需要更新的模板（✅ 已更新 / ⚠ 待处理）及文件路径
   - 如果有任何占位符故意延迟，则跟进 TODO。

6. 最终输出前的验证：
   - 没有剩余未解释的方括号标记。
   - 版本行与报告匹配。
   - 日期使用 ISO 格式 YYYY-MM-DD。
   - 原则是声明性的、可测试的，并且没有模糊的语言（"should" → 在适当的地方用 MUST/SHOULD 理由替换）。

7. 将完成的 Constitution 写回 `.claude/memory/constitution.md`（覆盖）。

8. 向用户输出最终摘要：
   - 新版本和升级理由。
   - 任何标记为手动跟进的文件。
   - 建议的 commit 消息（例如，`docs: amend constitution to vX.Y.Z (principle additions + governance update)`）。

格式和样式要求：

- 完全按照模板中的 Markdown 标题使用（不要降级/升级级别）。
- 换行长的理由行以保持可读性（<100 个字符理想情况），但不要用尴尬的断行强制执行。
- 在部分之间保留一个空行。
- 避免尾随空格。

如果用户提供部分更新（例如，只有一个原则修订），仍然执行验证和版本决策步骤。

如果缺少关键信息（例如，批准日期真的未知），请插入 `TODO(<FIELD_NAME>): explanation` 并在同步影响报告中的延迟项目下包含。

不要创建新模板；始终对现有的 `.claude/memory/constitution.md` 文件进行操作。
