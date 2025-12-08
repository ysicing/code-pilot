---
description: 通过处理并执行 tasks.md 中定义的所有任务来执行实施计划
---

## 用户输入

```text
$ARGUMENTS
```

在继续之前，你**必须**考虑用户输入（如果不为空）。

## 概要

1. 从仓库根目录运行 `$HOME/.claude/scripts/specify/check-prerequisites.sh --json --require-tasks --include-tasks`，解析 FEATURE_DIR 和 AVAILABLE_DOCS 列表。所有路径必须是绝对路径。对于参数中的单引号（如 "I'm Groot"），使用转义语法：例如 'I'\''m Groot'（或尽可能使用双引号："I'm Groot"）。

2. **检查检查清单状态**（如果 FEATURE_DIR/checklists/ 存在）：
   - 扫描 checklists/ 目录中的所有检查清单文件
   - 对于每个检查清单，统计：
     - 总项目数：所有匹配 `- [ ]` 或 `- [X]` 或 `- [x]` 的行
     - 已完成项目：匹配 `- [X]` 或 `- [x]` 的行
     - 未完成项目：匹配 `- [ ]` 的行
   - 创建状态表：

     ```text
     | Checklist | Total | Completed | Incomplete | Status |
     |-----------|-------|-----------|------------|--------|
     | ux.md     | 12    | 12        | 0          | ✓ PASS |
     | test.md   | 8     | 5         | 3          | ✗ FAIL |
     | security.md | 6   | 6         | 0          | ✓ PASS |
     ```

   - 计算总体状态：
     - **PASS**：所有检查清单都有 0 个未完成项目
     - **FAIL**：一个或多个检查清单有未完成项目

   - **如果任何检查清单未完成**：
     - 显示包含未完成项目计数的表
     - **停止**并询问："有些检查清单未完成。您是否仍要继续实施？(yes/no)"
     - 等待用户响应后再继续
     - 如果用户说 "no" 或 "wait" 或 "stop"，则停止执行
     - 如果用户说 "yes" 或 "proceed" 或 "continue"，则继续步骤 3

   - **如果所有检查清单都已完成**：
     - 显示显示所有检查清单通过的表
     - 自动继续步骤 3

3. 加载并分析实施上下文：
   - **必需**：读取 tasks.md 以获取完整的任务列表和执行计划
   - **必需**：读取 plan.md 以获取技术栈、架构和文件结构
   - **如果存在**：读取 data-model.md 以获取实体和关系
   - **如果存在**：读取 contracts/ 以获取 API 规范和测试需求
   - **如果存在**：读取 research.md 以获取技术决策和约束
   - **如果存在**：读取 quickstart.md 以获取集成场景

4. **项目设置验证**：
   - **必需**：基于实际项目设置创建/验证 ignore 文件：

   **检测和创建逻辑**：
   - 检查以下命令是否成功以确定仓库是否为 git 仓库（如果是，则创建/验证 .gitignore）：

     ```sh
     git rev-parse --git-dir 2>/dev/null
     ```

   - 检查 Dockerfile* 是否存在或 plan.md 中有 Docker → 创建/验证 .dockerignore
   - 检查 .eslintrc* 是否存在 → 创建/验证 .eslintignore
   - 检查 eslint.config.* 是否存在 → 确保配置的 `ignores` 条目涵盖所需模式
   - 检查 .prettierrc* 是否存在 → 创建/验证 .prettierignore
   - 检查 .npmrc 或 package.json 是否存在 → 创建/验证 .npmignore（如果发布）
   - 检查 terraform 文件（*.tf）是否存在 → 创建/验证 .terraformignore
   - 检查是否需要 .helmignore（存在 helm charts）→ 创建/验证 .helmignore

   **如果 ignore 文件已存在**：验证它包含基本模式，仅附加缺少的关键模式
   **如果 ignore 文件缺失**：使用检测到的技术的完整模式集创建

   **按技术分类的常见模式**（从 plan.md 技术栈）：
   - **Node.js/JavaScript/TypeScript**：`node_modules/`、`dist/`、`build/`、`*.log`、`.env*`
   - **Python**：`__pycache__/`、`*.pyc`、`.venv/`、`venv/`、`dist/`、`*.egg-info/`
   - **Java**：`target/`、`*.class`、`*.jar`、`.gradle/`、`build/`
   - **C#/.NET**：`bin/`、`obj/`、`*.user`、`*.suo`、`packages/`
   - **Go**：`*.exe`、`*.test`、`vendor/`、`*.out`
   - **Ruby**：`.bundle/`、`log/`、`tmp/`、`*.gem`、`vendor/bundle/`
   - **PHP**：`vendor/`、`*.log`、`*.cache`、`*.env`
   - **Rust**：`target/`、`debug/`、`release/`、`*.rs.bk`、`*.rlib`、`*.prof*`、`.idea/`、`*.log`、`.env*`
   - **Kotlin**：`build/`、`out/`、`.gradle/`、`.idea/`、`*.class`、`*.jar`、`*.iml`、`*.log`、`.env*`
   - **C++**：`build/`、`bin/`、`obj/`、`out/`、`*.o`、`*.so`、`*.a`、`*.exe`、`*.dll`、`.idea/`、`*.log`、`.env*`
   - **C**：`build/`、`bin/`、`obj/`、`out/`、`*.o`、`*.a`、`*.so`、`*.exe`、`Makefile`、`config.log`、`.idea/`、`*.log`、`.env*`
   - **Swift**：`.build/`、`DerivedData/`、`*.swiftpm/`、`Packages/`
   - **R**：`.Rproj.user/`、`.Rhistory`、`.RData`、`.Ruserdata`、`*.Rproj`、`packrat/`、`renv/`
   - **通用**：`.DS_Store`、`Thumbs.db`、`*.tmp`、`*.swp`、`.vscode/`、`.idea/`

   **工具特定模式**：
   - **Docker**：`node_modules/`、`.git/`、`Dockerfile*`、`.dockerignore`、`*.log*`、`.env*`、`coverage/`
   - **ESLint**：`node_modules/`、`dist/`、`build/`、`coverage/`、`*.min.js`
   - **Prettier**：`node_modules/`、`dist/`、`build/`、`coverage/`、`package-lock.json`、`yarn.lock`、`pnpm-lock.yaml`
   - **Terraform**：`.terraform/`、`*.tfstate*`、`*.tfvars`、`.terraform.lock.hcl`
   - **Kubernetes/k8s**：`*.secret.yaml`、`secrets/`、`.kube/`、`kubeconfig*`、`*.key`、`*.crt`

5. 解析 tasks.md 结构并提取：
   - **任务阶段**：Setup、Tests、Core、Integration、Polish
   - **任务依赖**：顺序 vs 并行执行规则
   - **任务详细信息**：ID、描述、文件路径、并行标记 [P]
   - **执行流程**：顺序和依赖要求

6. 遵循任务计划执行实施：
   - **阶段性执行**：在进入下一个阶段之前完成每个阶段
   - **遵守依赖**：按顺序运行顺序任务，并行任务 [P] 可以一起运行
   - **遵循 TDD 方法**：在相应的实施任务之前执行测试任务
   - **基于文件的协调**：影响相同文件的任务必须顺序运行
   - **验证检查点**：在继续之前验证每个阶段的完成

7. 实施执行规则：
   - **设置优先**：初始化项目结构、依赖、配置
   - **测试先于代码**：如果需要为契约、实体和集成场景编写测试
   - **核心开发**：实施模型、服务、CLI 命令、端点
   - **集成工作**：数据库连接、中间件、日志记录、外部服务
   - **完善和验证**：单元测试、性能优化、文档

8. 进度跟踪和错误处理：
   - 在每个完成的任务后报告进度
   - 如果任何非并行任务失败，则停止执行
   - 对于并行任务 [P]，继续成功的任务，报告失败的任务
   - 提供带有调试上下文的清晰错误消息
   - 如果实施无法继续，建议下一步
   - **重要提示**：对于已完成的任务，确保在 tasks 文件中将任务标记为 [X]。

9. 完成验证：
   - 验证所有必需任务都已完成
   - 检查实施的功能是否与原始规范匹配
   - 验证测试通过且覆盖率满足要求
   - 确认实施遵循技术计划
   - 报告最终状态及已完成工作的摘要

注意：此命令假定 tasks.md 中存在完整的任务分解。如果任务不完整或缺失，建议先运行 `/spec-kit:tasks` 重新生成任务列表。
