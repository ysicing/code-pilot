---
description: 在任务生成后，对 spec.md、plan.md 和 tasks.md 执行非破坏性的跨文档一致性和质量分析
---

## 用户输入

```text
$ARGUMENTS
```

在继续之前，你**必须**考虑用户输入（如果不为空）。

## 目标

在实施之前，识别三个核心文档（`spec.md`、`plan.md`、`tasks.md`）之间的不一致、重复、歧义和未充分说明的项目。此命令只能在 `/spec-kit:tasks` 成功生成完整的 `tasks.md` 后运行。

## 操作约束

**严格只读**：**不要**修改任何文件。输出结构化的分析报告。提供可选的修复计划（用户必须明确批准后才能手动调用后续编辑命令）。

**Constitution 权威性**：项目 Constitution（`.claude/memory/constitution.md`）在此分析范围内是**不可协商**的。Constitution 冲突自动为 CRITICAL，需要调整 spec、plan 或 tasks——而不是稀释、重新解释或默默忽略原则。如果原则本身需要更改，必须在 `/spec-kit:analyze` 之外单独明确更新 Constitution。

## 执行步骤

### 1. 初始化分析上下文

从仓库根目录运行一次 `$HOME/.claude/scripts/specify/check-prerequisites.sh --json --require-tasks --include-tasks`，解析 JSON 获取 FEATURE_DIR 和 AVAILABLE_DOCS。派生绝对路径：

- SPEC = FEATURE_DIR/spec.md
- PLAN = FEATURE_DIR/plan.md
- TASKS = FEATURE_DIR/tasks.md

如果缺少任何必需文件，则中止并显示错误消息（指示用户运行缺少的前置命令）。
对于参数中的单引号（如 "I'm Groot"），使用转义语法：例如 'I'\''m Groot'（或尽可能使用双引号："I'm Groot"）。

### 2. 加载文档（渐进式披露）

从每个文档中仅加载必要的最小上下文：

**从 spec.md:**

- 概述/上下文
- 功能需求
- 非功能需求
- 用户故事
- 边界情况（如果存在）

**从 plan.md:**

- 架构/技术栈选择
- 数据模型引用
- 阶段
- 技术约束

**从 tasks.md:**

- Task ID
- 描述
- 阶段分组
- 并行标记 [P]
- 引用的文件路径

**从 constitution:**

- 加载 `.claude/memory/constitution.md` 进行原则验证

### 3. 构建语义模型

创建内部表示（不要在输出中包含原始文档）：

- **需求清单**：每个功能性+非功能性需求都有一个稳定的键（基于祈使短语派生 slug；例如，"User can upload file" → `user-can-upload-file`）
- **用户故事/操作清单**：具有验收标准的离散用户操作
- **任务覆盖映射**：将每个任务映射到一个或多个需求或故事（通过关键字/显式引用模式（如 ID 或关键短语）进行推断）
- **Constitution 规则集**：提取原则名称和 MUST/SHOULD 规范性声明

### 4. 检测过程（高效 Token 分析）

专注于高信号发现。总共限制为 50 个发现；在溢出摘要中聚合其余部分。

#### A. 重复检测

- 识别接近重复的需求
- 标记质量较低的措辞以便合并

#### B. 歧义检测

- 标记缺乏可衡量标准的模糊形容词（fast、scalable、secure、intuitive、robust）
- 标记未解决的占位符（TODO、TKTK、???、`<placeholder>` 等）

#### C. 规范不足

- 具有动词但缺少对象或可衡量结果的需求
- 缺少验收标准对齐的用户故事
- 引用 spec/plan 中未定义的文件或组件的任务

#### D. Constitution 对齐

- 与 MUST 原则冲突的任何需求或计划元素
- 从 constitution 中缺少强制性部分或质量门控

#### E. 覆盖率缺口

- 没有关联任务的需求
- 没有映射需求/故事的任务
- 任务中未反映的非功能需求（例如，性能、安全性）

#### F. 不一致性

- 术语漂移（同一概念在不同文件中命名不同）
- plan 中引用但 spec 中不存在的数据实体（或反之）
- 任务排序矛盾（例如，没有依赖说明的情况下，集成任务在基础设置任务之前）
- 冲突的需求（例如，一个需要 Next.js，而另一个指定 Vue）

### 5. 严重性分配

使用此启发式方法对发现进行优先级排序：

- **CRITICAL**：违反 constitution MUST、缺少核心 spec 文档，或阻止基线功能的零覆盖需求
- **HIGH**：重复或冲突的需求、模糊的安全/性能属性、不可测试的验收标准
- **MEDIUM**：术语漂移、缺少非功能任务覆盖、规范不足的边界情况
- **LOW**：样式/措辞改进、不影响执行顺序的小冗余

### 6. 生成紧凑分析报告

输出 Markdown 报告（不写入文件），具有以下结构：

## 规范分析报告

| ID | Category | Severity | Location(s) | Summary | Recommendation |
|----|----------|----------|-------------|---------|----------------|
| A1 | Duplication | HIGH | spec.md:L120-134 | Two similar requirements ... | Merge phrasing; keep clearer version |

（每个发现添加一行；生成以类别首字母为前缀的稳定 ID。）

**覆盖率摘要表：**

| Requirement Key | Has Task? | Task IDs | Notes |
|-----------------|-----------|----------|-------|

**Constitution 对齐问题：**（如果有）

**未映射任务：**（如果有）

**指标：**

- 总需求数
- 总任务数
- 覆盖率 %（具有 >=1 个任务的需求）
- 歧义数量
- 重复数量
- 关键问题数量

### 7. 提供下一步行动

在报告末尾，输出一个简明的下一步行动块：

- 如果存在 CRITICAL 问题：建议在 `/spec-kit:implement` 之前解决
- 如果只有 LOW/MEDIUM：用户可以继续，但提供改进建议
- 提供明确的命令建议：例如，"使用改进运行 /spec-kit:specify"、"运行 /spec-kit:plan 调整架构"、"手动编辑 tasks.md 以添加 'performance-metrics' 的覆盖"

### 8. 提供修复

询问用户："您希望我为前 N 个问题建议具体的修复编辑吗？"（不要自动应用它们。）

## 操作原则

### 上下文效率

- **最小的高信号 token**：专注于可操作的发现，而不是详尽的文档
- **渐进式披露**：增量加载文档；不要将所有内容转储到分析中
- **高效 token 输出**：将发现表限制为 50 行；汇总溢出
- **确定性结果**：在没有更改的情况下重新运行应产生一致的 ID 和计数

### 分析指南

- **永远不要修改文件**（这是只读分析）
- **永远不要虚构缺失的部分**（如果不存在，请准确报告它们）
- **优先处理 constitution 违规**（这些始终是 CRITICAL）
- **使用示例而不是详尽规则**（引用具体实例，而不是通用模式）
- **优雅地报告零问题**（发出带有覆盖率统计信息的成功报告）

## 上下文

$ARGUMENTS
