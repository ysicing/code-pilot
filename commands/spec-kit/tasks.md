---
description: 基于可用的设计文档，生成可操作的、按依赖排序的 tasks.md
handoffs:
  - label: Analyze For Consistency
    agent: spec-kit:analyze
    prompt: Run a project analysis for consistency
    send: true
  - label: Implement Project
    agent: spec-kit:implement
    prompt: Start the implementation in phases
    send: true
---

## 用户输入

```text
$ARGUMENTS
```

在继续之前，你**必须**考虑用户输入（如果不为空）。

## 概要

1. **设置**：从仓库根目录运行 `$HOME/.claude/scripts/specify/check-prerequisites.sh --json`，解析 FEATURE_DIR 和 AVAILABLE_DOCS 列表。所有路径必须是绝对路径。对于参数中的单引号（如 "I'm Groot"），使用转义语法：例如 'I'\''m Groot'（或尽可能使用双引号："I'm Groot"）。

2. **加载设计文档**：从 FEATURE_DIR 读取：
   - **必需**：plan.md（技术栈、库、结构）、spec.md（带优先级的用户故事）
   - **可选**：data-model.md（实体）、contracts/（API 端点）、research.md（决策）、quickstart.md（测试场景）
   - 注意：并非所有项目都有所有文档。基于可用内容生成任务。

3. **执行任务生成工作流**：
   - 加载 plan.md 并提取技术栈、库、项目结构
   - 加载 spec.md 并提取带优先级的用户故事（P1、P2、P3 等）
   - 如果 data-model.md 存在：提取实体并映射到用户故事
   - 如果 contracts/ 存在：将端点映射到用户故事
   - 如果 research.md 存在：提取设置任务的决策
   - 生成按用户故事组织的任务（参见下面的任务生成规则）
   - 生成显示用户故事完成顺序的依赖图
   - 为每个用户故事创建并行执行示例
   - 验证任务完整性（每个用户故事都有所有需要的任务，可独立测试）

4. **生成 tasks.md**：使用 `$HOME/.claude/templates/specify/tasks-template.md` 作为结构，填充：
   - 来自 plan.md 的正确功能名称
   - Phase 1：设置任务（项目初始化）
   - Phase 2：基础任务（所有用户故事的阻塞前提条件）
   - Phase 3+：每个用户故事一个阶段（按 spec.md 的优先级顺序）
   - 每个阶段包括：故事目标、独立测试标准、测试（如果请求）、实施任务
   - 最终阶段：完善和跨领域关注点
   - 所有任务必须遵循严格的检查清单格式（参见下面的任务生成规则）
   - 每个任务的清晰文件路径
   - 显示故事完成顺序的依赖部分
   - 每个故事的并行执行示例
   - 实施策略部分（MVP 优先、增量交付）

5. **报告**：输出生成的 tasks.md 的路径和摘要：
   - 总任务数
   - 每个用户故事的任务数
   - 识别的并行机会
   - 每个故事的独立测试标准
   - 建议的 MVP 范围（通常只是用户故事 1）
   - 格式验证：确认所有任务都遵循检查清单格式（复选框、ID、标签、文件路径）

任务生成上下文：$ARGUMENTS

tasks.md 应该可以立即执行 - 每个任务都必须足够具体，以便 LLM 可以在没有额外上下文的情况下完成它。

## 任务生成规则

**关键**：任务必须按用户故事组织，以实现独立实施和测试。

**测试是可选的**：仅在功能规范中明确请求或用户请求 TDD 方法时才生成测试任务。

### 检查清单格式（必需）

每个任务必须严格遵循此格式：

```text
- [ ] [TaskID] [P?] [Story?] Description with file path
```

**格式组件**：

1. **复选框**：始终以 `- [ ]` 开头（markdown 复选框）
2. **Task ID**：按执行顺序的序列号（T001、T002、T003...）
3. **[P] 标记**：仅在任务可并行化时包含（不同文件，没有对未完成任务的依赖）
4. **[Story] 标签**：仅对用户故事阶段任务为必需
   - 格式：[US1]、[US2]、[US3] 等（映射到 spec.md 的用户故事）
   - 设置阶段：无故事标签
   - 基础阶段：无故事标签
   - 用户故事阶段：必须有故事标签
   - 完善阶段：无故事标签
5. **描述**：带准确文件路径的清晰操作

**示例**：

- ✅ 正确：`- [ ] T001 Create project structure per implementation plan`
- ✅ 正确：`- [ ] T005 [P] Implement authentication middleware in src/middleware/auth.py`
- ✅ 正确：`- [ ] T012 [P] [US1] Create User model in src/models/user.py`
- ✅ 正确：`- [ ] T014 [US1] Implement UserService in src/services/user_service.py`
- ❌ 错误：`- [ ] Create User model`（缺少 ID 和故事标签）
- ❌ 错误：`T001 [US1] Create model`（缺少复选框）
- ❌ 错误：`- [ ] [US1] Create User model`（缺少 Task ID）
- ❌ 错误：`- [ ] T001 [US1] Create model`（缺少文件路径）

### 任务组织

1. **从用户故事（spec.md）** - 主要组织方式：
   - 每个用户故事（P1、P2、P3...）都有自己的阶段
   - 将所有相关组件映射到其故事：
     - 该故事需要的模型
     - 该故事需要的服务
     - 该故事需要的端点/UI
     - 如果请求测试：特定于该故事的测试
   - 标记故事依赖（大多数故事应该是独立的）

2. **从契约**：
   - 将每个契约/端点 → 映射到它服务的用户故事
   - 如果请求测试：每个契约 → 在该故事阶段实施前的契约测试任务 [P]

3. **从数据模型**：
   - 将每个实体映射到需要它的用户故事
   - 如果实体服务多个故事：放在最早的故事或设置阶段
   - 关系 → 适当故事阶段的服务层任务

4. **从设置/基础设施**：
   - 共享基础设施 → 设置阶段（Phase 1）
   - 基础/阻塞任务 → 基础阶段（Phase 2）
   - 故事特定设置 → 该故事的阶段内

### 阶段结构

- **Phase 1**：设置（项目初始化）
- **Phase 2**：基础（阻塞前提条件 - 必须在用户故事之前完成）
- **Phase 3+**：按优先级顺序的用户故事（P1、P2、P3...）
  - 每个故事内：测试（如果请求）→ 模型 → 服务 → 端点 → 集成
  - 每个阶段应该是一个完整的、可独立测试的增量
- **最终阶段**：完善和跨领域关注点
