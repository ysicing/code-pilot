# 实现计划：[FEATURE]

**分支**：`[###-feature-name]` | **日期**：[DATE] | **规范**：[链接]
**输入**：来自 `/specs/[###-feature-name]/spec.md` 的功能规范

**说明**：此模板由 `/spec-kit:plan` 命令填充。详见 `$HOME/.claude/templates/specify/commands/plan.md` 了解执行工作流。

## 摘要

[从功能规范中提取：主要需求 + 研究中的技术方案]

## 技术背景

<!--
  所需操作：将此部分中的内容替换为项目的技术细节。
  此处呈现的结构是以顾问的身份提供以指导迭代过程。
-->

**语言/版本**：[例如，Python 3.11、Swift 5.9、Rust 1.75 或 需要澄清]
**主要依赖项**：[例如，FastAPI、UIKit、LLVM 或 需要澄清]
**存储**：[如适用，例如，PostgreSQL、CoreData、文件 或 不适用]
**测试**：[例如，pytest、XCTest、cargo test 或 需要澄清]
**目标平台**：[例如，Linux 服务器、iOS 15+、WASM 或 需要澄清]
**项目类型**：[single/web/mobile - 决定源代码结构]
**性能目标**：[特定于领域，例如，1000 req/s、10k lines/sec、60 fps 或 需要澄清]
**约束**：[特定于领域，例如，<200ms p95、<100MB 内存、离线可用 或 需要澄清]
**规模/范围**：[特定于领域，例如，10k 用户、1M LOC、50 个屏幕 或 需要澄清]

## 项目章程检查

*门控：必须在第 0 阶段研究前通过。第 1 阶段设计后重新检查。*

[根据项目章程文件确定的门控]

## 项目结构

### 文档（此功能）

```text
specs/[###-feature]/
├── plan.md              # 此文件（/spec-kit:plan 命令输出）
├── research.md          # 第 0 阶段输出（/spec-kit:plan 命令）
├── data-model.md        # 第 1 阶段输出（/spec-kit:plan 命令）
├── quickstart.md        # 第 1 阶段输出（/spec-kit:plan 命令）
├── contracts/           # 第 1 阶段输出（/spec-kit:plan 命令）
└── tasks.md             # 第 2 阶段输出（/spec-kit:tasks 命令 - 不由 /spec-kit:plan 创建）
```

### 源代码（存储库根目录）
<!--
  所需操作：将下面的占位符树替换为此功能的具体布局。
  删除未使用的选项并使用实际路径展开所选结构
  （例如，apps/admin、packages/something）。交付的计划必须
  不包含选项标签。
-->

```text
# [如果不使用则删除] 选项 1：单个项目（默认）
src/
├── models/
├── services/
├── cli/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# [如果不使用则删除] 选项 2：Web 应用程序（检测到"前端" + "后端"时）
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/

# [如果不使用则删除] 选项 3：Mobile + API（检测到"iOS/Android"时）
api/
└── [与上面的后端相同]

ios/ 或 android/
└── [特定于平台的结构：功能模块、UI 流程、平台测试]
```

**结构决策**：[记录所选的结构并引用上面获取的真实目录]

## 复杂性追踪

> **仅在项目章程检查有必须正当理由说明的违规时填写**

| 违规 | 为何需要 | 被拒绝的更简单替代方案及其原因 |
|-----------|------------|-------------------------------------|
| [例如，第 4 个项目] | [当前需求] | [为什么 3 个项目不足以及其原因] |
| [例如，存储库模式] | [特定问题] | [为什么直接数据库访问不足] |
