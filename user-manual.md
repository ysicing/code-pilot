# Claude Code 多智能体工作流系统 - 新手使用手册

## 🎯 快速开始

### 什么是这个系统？

这是一个**Claude Code 增强配置框架**，将原本需要手动协调的开发任务转换为自动化的专家团队工作流。

**简而言之**：无需逐步指导 AI 完成复杂任务，只需直接描述"我要实现XX功能"，系统自动调用专业智能体（同子代理）完成整个开发流程。

### 核心价值

- **🎛️ 质量门控自动化**：90% 客观标准替代主观判断
- **🧠 专业化分工**：每个智能体专精一个领域
- **⚡ 一键式工作流**：从需求到代码到测试全自动
- **📊 智能测试决策**：根据变更复杂度自动选择测试策略

## 🚀 五分钟上手

### 第一步：安装配置

```bash
# 用户级配置（推荐）
cd ~
git clone https://github.com/ysicing/code-pilot.git .claude

# 或者项目级配置
cd your-project
git clone https://github.com/ysicing/code-pilot.git .claude

# 可选使用我提供的配置
cd .claude
cp CLAUDE.md.example CLAUDE.md
```

### 第二步：第一个自动化工作流

```bash
# 进入你的项目目录
cd your-project

# 快速开发：需求分析 → 代码实现 → 质量审查 → 测试
/requirements-pilot "实现用户注册API，支持邮箱验证"

# 或复杂功能团队协作：仓库扫描 → 产品需求 → 系统架构 → Sprint规划 → 开发 → QA测试
/bmad-pilot "实现用户注册API，支持邮箱验证"

# 【新增】或使用 Kiro 智能开发助手：结构化功能开发（推荐）
/kiro 我需要实现用户注册API，支持邮箱验证
# Kiro 会智能路由到最合适的专家，支持项目状态管理和中断恢复
```

**系统会自动：**
1. 生成详细技术规格（90 分以上才继续）
2. 征求你的确认和修改意见
3. 实现代码并进行质量审查（90 分以上才完成）
4. 智能判断是否执行测试

### 第三步：理解系统反馈

系统会给出类似这样的输出：
```
✅ 需求规格评分：92/100 - 已达到实现标准
⏸️ 等待用户确认：是否开始实现？(y/n)
✅ 代码实现完成，质量评分：94/100
🤔 变更影响分析：建议执行测试 (运行测试？y/n)
```

## 📋 两种主要使用模式

### 模式1：完全自动化（适合新功能）

**什么时候用**：实现新功能、新特性
**特点**：一条命令解决所有问题

```bash
# 基础用法
/requirements-pilot "实现JWT用户认证"

# 强制测试
/requirements-pilot "支付处理功能" --test

# 跳过测试（仅UI改动）
/requirements-pilot "更新按钮样式" --no-test
```

### 模式2：分步控制（适合复杂项目）

**适用场景**：大型功能、涉及设计讨论的项目
**特点**：每个阶段可以精确控制

```bash
# 步骤1：功能分解
/story-breakdown "电商购物车系统"

# 步骤2：架构咨询
/ask "购物车数据存储的最佳实践"

# 步骤3：技术选型讨论
/role-debate security vs performance "Redis vs 数据库存储购物车"

# 步骤4：逐个实现
/requirements-pilot "购物车添加商品功能" --test

# 步骤5：质量检查
/review "验证购物车逻辑的正确性"

# 步骤6：发布准备
/release-check "购物车模块"
```

## 🛠️ 智能体架构说明

### 系统设计理念

本系统采用**双层智能体架构**，实现任务执行和专业咨询的清晰分离：

| 智能体类型 | 位置 | 格式 | 特点 | 调用方式 |
|-----------|------|------|------|---------|
| **功能智能体** | `/agents/` | YAML+MD | 执行具体任务，完整工具集 | 直接命令调用 |
| **角色智能体** | `/agents/roles/` | YAML+MD | 提供专业建议，有限工具集 | 多角色协作调用 |

### `/agents/` - 功能智能体（执行者）
**定位**：专门负责执行特定任务的工作流智能体

**核心特征**：
- ✅ **任务导向**：专注完成具体开发任务
- ✅ **完整工具集**：可读写文件、执行命令、搜索等
- ✅ **独立工作**：可单独完成复杂任务流程
- ✅ **输出实现**：代码、配置、解决方案

**典型智能体**：
- `bugfix` - Bug修复专家（多层次智能检测v2.0，支持框架特定错误，包括TDZ错误*和Hook时序问题**）

> *TDZ错误：Temporal Dead Zone（时间死区）错误，指在变量初始化之前访问变量导致的错误
> **Hook时序问题：React Hooks只能在函数组件顶层调用的限制违反
- `requirements-code` - 代码实现专家  
- `debug` - 调试分析专家
- `optimize` - 性能优化专家

**调用示例**：
```bash
/bugfix "登录页面样式错乱"                    # 多层次自动检测前端修复
/requirements-pilot "实现 JWT 认证"              # 完整开发流程
/debug "API超时问题"                          # 系统化调试
```

### `/agents/roles/` - 角色智能体（顾问者）
**定位**：提供专业领域知识的咨询型角色

**核心特征**：
- ✅ **知识导向**：专注提供专业分析和建议
- ✅ **有限工具集**：主要用于读取和分析
- ✅ **协作性质**：需要与其他角色配合
- ✅ **输出建议**：分析报告、评估结果、专业建议

**专业角色**：
- `architect` - 系统架构师
- `security` - 安全专家
- `performance` - 性能专家
- `frontend` - 前端专家
- `qa` - 质量保证专家
- `refactorer` - 重构实施专家

**调用示例**：
```bash
/multi-role security,performance "API安全性和性能评估"
/multi-role architect,frontend,qa "界面重构方案评估"
/role-debate security vs performance "JWT vs Session认证"
```

### 典型协作工作流

```bash
# 1. 功能智能体执行实现
/requirements-pilot "用户认证模块"

# 2. 角色智能体深度分析  
/multi-role security,architect --agent "评估认证模块安全架构"

# 3. 功能智能体优化实施
/refactor "UserAuth.authenticate方法"

# 4. 角色智能体验证结果
/multi-role qa,security "验证重构后的质量和安全性"
```

## 🛠️ 完整命令详解（19个命令）

### 📋 功能类似命令对比表

| 命令类别 | 命令 | 核心功能 | 适用场景 | 输出类型 | 协作关系 |
|---------|------|----------|----------|----------|----------|
| **需求分析** | `/story-breakdown` | 功能分解 | 复杂功能拆分 | 用户故事列表 | 为其他命令提供输入 |
| | `/ask` | 技术咨询 | 架构设计咨询 | 专业建议 | 辅助决策制定 |
| | `/requirements-pilot` | 快速开发工作流 | 端到端快速实现 | 完整解决方案 | 集成多个环节 |
| | `/bmad-pilot` | AI团队协作工作流 | 复杂功能团队开发 | 企业级完整方案 | 多智能体深度协作 |
| | **`/kiro`** | **智能开发助手** | **结构化功能开发** | **自适应专家服务** | **智能路由和状态管理** |
| | **`/kiro-status`** | **项目状态管理** | **多功能项目跟踪** | **状态报告和建议** | **工作流协调** |
| **深度分析** | `/ultrathink` | MECE结构化深度分析 | 重大技术决策/战略规划 | 深度分析报告 | 为重大决策提供依据 |
| **代码实现** | `/code` | 直接实现 | 明确需求的功能 | 代码文件 | 独立执行 |
| | `/refactor` | 重构实施 | 代码质量改进 | 重构后代码 | 配合/review使用 |
| **质量保证** | `/review` | 代码审查 | 发现问题建议 | 审查报告 | 为/refactor提供输入 |
| | `/test` | 测试验证 | 功能质量验证 | 测试结果 | 验证其他命令结果 |
| **问题解决** | `/debug` | 系统化调试 | 复杂问题分析 | 调试分析 | 深度问题诊断 |
| | `/bugfix` | Bug修复 | 具体错误修复 | 修复方案 | 直接解决问题 |
|         |         |       | 多层次智能检测 | v2.0简化验证 | 框架特定错误 |
| **性能优化** | `/optimize` | 性能优化 | 性能瓶颈解决 | 优化方案 | 专业性能改进 |
| **多角色协作** | `/multi-role` | 并行分析 | 综合专业评估 | 多维分析报告 | 整合专业视角 |
| | `/role-debate` | 对立辩论 | 技术选型争议 | 辩论结果 | 帮助技术决策 |

### 🔄 典型命令协作流程

#### 1. 代码质量改进工作流
```bash
/review "UserService类"                    # ① 发现问题和建议
↓
/refactor "UserService.authenticate方法"   # ② 实施具体重构  
↓
/test "UserService重构后验证"              # ③ 验证重构效果
```

#### 2. 技术选型决策工作流  
```bash
/ask "微服务vs单体架构适用性"              # ① 获取专业建议
↓
/role-debate architect vs performance     # ② 深度技术辩论
"微服务架构的性能影响"
↓
/multi-role architect,qa --agent          # ③ 多角度验证决策
"评估最终架构方案"
```

#### 3. 问题解决工作流
```bash
/debug "生产API偶发超时"                   # ① 系统化分析
↓  
/bugfix "数据库连接池配置问题"             # ② 具体问题修复
/bugfix "Cannot access 'refetchAIReview' before initialization" # ② TDZ时序错误自动检测
↓
/optimize "API响应时间优化"                # ③ 性能进一步优化
```

#### 4. 复杂功能开发工作流
```bash
/story-breakdown "电商支付系统"            # ① 功能分解
↓
/ask "支付安全架构最佳实践"               # ② 架构咨询
↓
/requirements-pilot "核心支付逻辑" --test # ③ 实现核心功能
↓  
/multi-role security,qa --agent          # ④ 安全质量评估
"支付模块安全性评估"
```

#### 5. 重大技术决策工作流
```bash
/ultrathink "选择微服务还是单体架构"      # ① 深度分析所有因素
"考虑团队能力、维护成本、业务复杂度、扩展需求"
↓
/role-debate architect vs performance     # ② 针对争议点深度辩论
"微服务架构的性能影响和扩展性权衡"
↓
/multi-role architect,security,qa --agent # ③ 多角度验证最终决策
"评估选定架构方案的全面影响"
```

### 🎯 命令选择决策树

#### 当不确定使用哪个命令时，按此流程选择：

```
🎯 需要实现新功能？
   ├─ 是：功能复杂吗？
   │  ├─ 复杂 → 🔄 /story-breakdown 先分解
   │  └─ 简单 → ⚡ /requirements-pilot 直接实现
   │
   ├─ 🐛 需要修复问题？
   │  ├─ 复杂问题 → 🔍 /debug 系统分析
   │  └─ 简单Bug → 🔧 /bugfix 直接修复（多层次智能检测）
   │
   ├─ 📈 需要改进代码？
   │  ├─ 发现问题 → 👁️ /review 代码审查
   │  └─ 实施改进 → ♻️ /refactor 重构实施
   │
   ├─ 🤔 需要重大决策？ ← ultrathink 的核心场景
   │  ├─ 技术选型/架构决策 → 🧠 /ultrathink 深度分析
   │  ├─ 简单咨询 → 💡 /ask 专家建议
   │  ├─ 有明确争议 → ⚔️ /role-debate 技术辩论
   │  └─ 综合评估 → 👥 /multi-role 多角度分析
   │
   └─ 🚀 性能问题？ → 🎯 /optimize 性能优化
```

#### ⚡ 快速选择指南

| 我想要... | 推荐命令 | 预估时间 | 备注 |
|-----------|---------|----------|------|
| 实现新功能 | `/requirements-pilot` | 10-30分钟 | 一站式解决方案 |
| 复杂功能团队开发 | `/bmad-pilot` | 30-90分钟 | 多智能体协作，企业级流程 |
| 修复Bug | `/bugfix` | 5-15分钟 | 直接问题修复（多层次智能检测v2.0） |
| 分析复杂问题 | `/debug` | 15-30分钟 | 系统化调试 |
| 改进代码质量 | `/review` → `/refactor` | 20-40分钟 | 先分析再实施 |
| 获取技术建议 | `/ask` | 3-8分钟 | 快速专家咨询 |
| **重大技术决策** | `/ultrathink` | 30-60分钟 | **MECE深度分析，战略级思考** |
| 解决技术争议 | `/role-debate` | 10-20分钟 | 对比不同方案 |
| 多角度分析 | `/multi-role` | 8-15分钟 | 综合专业评估 |
| 提升性能 | `/optimize` | 15-40分钟 | 性能专项优化 |
| 分解复杂任务 | `/story-breakdown` | 5-15分钟 | 化繁为简 |

### 📋 需求和规划类
```bash
/story-breakdown "复杂功能描述"
# 将大功能分解为1-3天完成的小任务
# 输出：用户故事、验收标准、优先级、依赖关系

/requirements-pilot "功能描述" [--test|--no-test|--skip-scan]
# 快速自动化工作流：需求→代码→审查→测试
# 90 分质量门控，用户确认机制
# --skip-scan: 跳过初始仓库扫描（不推荐）

/bmad-pilot "项目描述" [选项]
# BMAD AI团队完整开发流水线：仓库扫描→PO需求→架构设计→Sprint规划→开发→QA测试
# 选项：--skip-tests, --direct-dev, --skip-scan
# 适合：复杂功能、企业级项目
```

### 🏛️ 架构咨询类
```bash
/ask "技术问题"
# 4专家咨询团：架构师+安全专家+性能专家+质量专家
# 适合：技术选型、架构设计、最佳实践咨询

/role-debate "角色1 vs 角色2" "辩论主题"
# 技术选型深度辩论：展示不同观点，帮助决策
# 示例：/role-debate security vs performance "JWT vs Session认证"
```

### ⚡ 实现开发类
```bash
/code "具体功能描述"
# 直接代码实现，适合明确需求的功能开发
# 有一定约束，确保代码质量

/refactor "代码范围"
# 安全渐进式重构与SOLID原则评估
# 代码质量改进和架构优化
# 渐进式重构策略，确保安全性

/screenshot [--window|--full|--crop]
# macOS专用：智能截图分析
# UI评估、错误诊断、设计审查
```

### 🔍 质量保证类
```bash
/review "代码范围"
# 多维度代码审查：质量+安全+性能+架构
# 3级评分：✅就绪 / ⚠️需改进 / ❌重大问题

/test "组件或功能"
# 智能测试策略：
# - UI变更：仅Lint检查
# - 小变更：比例化测试
# - 业务逻辑：全面测试
```

### 🐛 问题解决类
```bash
/debug "问题描述"
# UltraThink调试协调器：4阶段系统化分析
# 假设收敛：从多个假设精炼到1-2个解决方案

/bugfix "错误描述"                        # 多层次智能检测，支持框架特定错误
# 系统化bug修复：分析→实现→验证
# 内置验证机制确保修复有效性
```

### 🚀 优化部署类
```bash
/optimize "性能目标"
# 性能优化协调：分析瓶颈→制定方案→实施优化
# 涵盖前端、后端、数据库、架构优化

/release-check "组件或系统"
# 生产就绪验证：风险评估→go/no-go决策
# 实用清单方法，确保发布质量
```

### 🧠 高级分析类

#### `/ultrathink` - 深度战略分析
```bash
/ultrathink "复杂问题"
# MECE原则结构化深度分析：多维度权衡、风险评估、方案对比
# 🎯 专用场景：重大技术决策、架构选择、长期规划
# 📊 输出：结构化分析报告、方案对比表、实施路径

# 典型应用场景：
/ultrathink "选择微服务还是单体架构"
/ultrathink "10年遗留系统现代化策略"  
/ultrathink "团队从5人扩展到20人的技术策略"
/ultrathink "数据库迁移：PostgreSQL vs DynamoDB全面分析"
```

#### 其他分析命令对比
```bash
/ask "技术问题"
# 快速专家咨询：获取直接建议和最佳实践
# 适合：日常技术咨询、架构方向指导

/multi-role "角色1,角色2" "分析目标"
# 多专家并行分析：不同专业角度的综合评估
# 适合：需要多个专业视角的评估分析

/role-debate "角色1 vs 角色2" "争议主题"
# 对立观点深度辩论：技术选型的利弊权衡
# 适合：有明确争议点的技术选型

/search-gemini "搜索查询"
# Gemini网络搜索：获取最新技术信息
# 适合：技术调研、问题排查、最佳实践查询
```

### BMAD 专业智能体系统

**BMAD (Business, Market, Architecture, Development)** 是一个AI驱动的敏捷开发方法论，通过专业化智能体团队实现从商业需求到技术实现的完整工作流。

#### BMAD核心智能体（7个）
```bash
# 业务分析层
/bmad-po "需求描述"        # 产品负责人：需求分析、用户故事、验收标准
/bmad-analyst "分析主题"   # 业务分析师：市场研究、竞争分析、商业案例

# 技术架构层  
/bmad-architect "系统设计需求"  # 系统架构师：技术架构、系统设计、技术选择
/bmad-sm "冲刺规划需求"         # 敏捷教练：任务分解、冲刺规划、流程协调

# 实现验证层
/bmad-dev "开发任务描述"        # 开发工程师：代码实现、技术文档
/bmad-qa "测试需求描述"         # 质量保证：测试策略、质量验证

# 编排协调层
/bmad-orchestrator "复杂项目协调"  # 主编排器：工作流协调、多智能体任务管理
```

#### BMAD vs Requirements-Pilot 对比

| 特性 | Requirements-Pilot | BMAD方法论 |
|------|-------------------|-----------|
| **执行时间** | 10-30分钟 | 30-90分钟 |
| **适用场景** | 快速功能开发 | 企业级项目 |
| **覆盖范围** | 技术实现 | 商业+技术全流程 |
| **质量门控** | 90%技术质量 | 多维度质量验证 |
| **智能体数量** | 4个技术智能体 | 7个全角色智能体 |

#### 使用场景建议

**🚅 快速开发（推荐Requirements-Pilot）**
```bash
# 简单功能快速实现
/requirements-pilot "添加用户登录功能"
/requirements-pilot "实现数据导出API"
```

**🏢 企业级项目（推荐BMAD）**
```bash
# 复杂系统完整流程
/bmad-pilot "构建企业级ERP系统，集成财务、人事、项目管理模块"
/bmad-pilot "设计多租户SaaS平台，支持自定义配置和第三方集成"
```

#### 🎯 分析命令选择指南

| 分析需求 | 推荐命令 | 使用场景 |
|---------|---------|----------|
| 重大决策深度分析 | `/ultrathink` | 架构选型、技术战略、系统重构 |
| 快速技术咨询 | `/ask` | 日常开发问题、最佳实践咨询 |
| 多专业角度评估 | `/multi-role` | 代码审查、方案评估、质量分析 |
| 技术选型争议 | `/role-debate` | 有明确对立观点的技术选择 |
| 最新信息调研 | `/search-gemini` | 技术趋势、文档查找、问题排查 |

## 🎯 常见使用场景

### 场景1：新功能开发
```bash
# 简单功能（推荐）
/requirements-pilot "用户头像上传功能"

# 复杂功能（使用团队协作开发）
/bmad-pilot "用户权限管理系统，支持RBAC和LDAP集成"

# 或分步实现复杂功能
/story-breakdown "用户权限管理系统"
/ask "RBAC权限设计最佳实践"
/requirements-pilot "用户角色管理" --test
/requirements-pilot "权限分配界面" --no-test
```

### 场景2：Bug修复
```bash
# 简单bug（包括前端逻辑错误）
/bugfix "Cannot access 'refetchAIReview' before initialization"
/bugfix "登录页面在Safari浏览器下样式错乱"

# 复杂问题
/debug "生产环境API偶发超时，日志显示数据库连接池耗尽"
/code "实现数据库连接池监控和自动恢复"
/test "连接池异常场景测试"
```

### 场景3：性能优化
```bash
# 全面性能分析
/multi-role performance,architect "系统整体性能瓶颈分析"

# 具体优化实施
/optimize "将API响应时间从500ms优化到100ms以内"
/test "性能优化后的压力测试"
```

### 场景4：重大技术决策
```bash
# 深度战略分析
/ultrathink "选择微服务还是单体架构"
"考虑团队规模、业务复杂度、维护成本、扩展需求、技术债务"

# 基于分析结果的深度辩论
/role-debate architect vs performance "微服务架构的性能影响和维护复杂度"

# 综合验证最终决策
/multi-role architect,security,qa --agent "评估最终架构选择的全面影响"
```

### 场景5：技术选型决策
```bash
# 日常架构咨询
/ask "API设计：GraphQL vs REST的适用场景"

# 有明确争议的快速辩论
/role-debate security vs performance "JWT vs Session认证机制选择"

# 综合分析
/multi-role security,architect "认证系统安全架构评估"
```

### 场景6：代码审查和重构
```bash
# 第一步：发现问题
/review "用户认证模块的安全性和代码质量"

# 第二步：实施重构
/refactor "UserAuth.authenticate方法" 
# 系统会基于review结果进行SOLID原则评估和渐进式重构

# 第三步：验证效果
/test "认证模块重构后的功能验证"

# 第四步：专业评估（可选）
/multi-role security,qa --agent "评估重构后的安全性和质量"
```

## ⚠️ 常见问题和解决方案

### 问题1：质量门控失败
**现象**：系统提示"需求规格评分78/100，未达到实现标准"

**解决方案**：
```bash
# 让系统自动优化需求
/story-breakdown "你的功能描述"  # 先分解为更具体的任务
/requirements-pilot "分解后的具体任务"  # 针对具体任务重新生成规格
```

### 问题2：不知道用哪个命令
**原则**：参考上面的命令选择决策树
- 实现新功能：用 `/requirements-pilot`
- 修复bug：用 `/bugfix` （多层次智能检测，支持React/Vue等框架错误） 
- 技术咨询：用 `/ask`
- **重大决策**：用 `/ultrathink`（架构选型、技术战略、系统重构）
- 技术选型有争议：用 `/role-debate`
- 复杂问题分析：用 `/debug`
- 代码质量改进：先用 `/review` 再用 `/refactor`
- 多角度分析：用 `/multi-role`

### 问题3：测试策略不合适
```bash
# UI只改样式，不需要测试
/requirements-pilot "更新按钮颜色为蓝色" --no-test

# 核心业务逻辑必须测试
/requirements-pilot "支付流程逻辑" --test

# 不确定时让系统判断（默认）
/requirements-pilot "用户注册表单优化"
```

### 问题4：输出太复杂
```bash
# 使用分步模式，每次只处理一个问题
/story-breakdown "复杂功能"  # 先分解
/ask "具体技术问题"  # 再咨询
/code "单一明确的功能"  # 最后实现
```

## 📈 进阶使用技巧

### 技巧1：链式命令使用
```bash
# 第一步：分析现状
/ask "当前系统的主要性能瓶颈"

# 第二步：制定方案（基于第一步结果）
/role-debate performance vs security "缓存策略vs数据一致性"

# 第三步：实现优化（基于辩论结论）
/requirements-pilot "实现Redis缓存层" --test

# 第四步：验证效果
/optimize "验证缓存实现的性能提升效果"
```

### 技巧2：多角色协作
```bash
# 安全+性能双重评估
/multi-role security,performance "API 接口安全性和性能评估"

# 架构+前端+QA三方评估
/multi-role architect,frontend,qa --agent "用户界面重构方案评估"
```

### 技巧3：渐进式实现
```bash
# 第一阶段：基础功能
/requirements-pilot "用户登录基础功能" --test

# 第二阶段：安全增强
/requirements-pilot "添加多因素认证" --test

# 第三阶段：体验优化
/requirements-pilot "登录界面体验优化" --no-test
```

## 🎓 最佳实践

### 1. 功能描述要具体
```bash
❌ /requirements-pilot "改进用户体验"
✅ /requirements-pilot "实现用户头像上传，支持裁剪和压缩"

❌ /bugfix "系统有问题"  
✅ /bugfix "用户点击提交按钮后页面空白，控制台显示404错误"
✅ /bugfix "Cannot access 'useState' before initialization"
```

### 2. 信赖质量门控
```bash
# 当系统说评分不够时，不要强行继续
# 而是优化需求描述或分解任务
✅ 如果需求规格 < 90 分，先用 /story-breakdown 分解
✅ 如果代码质量 < 90 分，相信系统的改进建议
```

### 3. 合理使用测试选项
```bash
✅ 业务逻辑：--test
✅ UI样式调整：--no-test  
✅ 不确定时：不加参数，让系统智能判断
```

### 4. 善用专业角色辩论
```bash
# 当面临技术选择时
/role-debate security vs performance "技术选择主题"
# 比直接 /ask 更能看到不同观点的权衡
```

## 💡 成功案例参考

### 案例1：电商网站开发
```bash
# 1. 项目规划
/story-breakdown "电商网站：用户注册、商品展示、购物车、订单支付"

# 2. 架构设计
/ask "电商网站微服务架构设计最佳实践"

# 3. 分模块实现
/requirements-pilot "用户注册模块，支持邮箱验证" --test
/requirements-pilot "商品展示页面，支持分类筛选" --no-test  
/requirements-pilot "购物车功能，支持数量调整和删除" --test
/requirements-pilot "订单支付集成，对接支付网关" --test

# 4. 性能优化
/optimize "商品列表页加载速度优化到2秒以内"

# 5. 发布准备
/release-check "电商网站核心功能模块"
```

### 案例2：API服务重构
```bash
# 1. 现状分析
/ask "当前API架构的主要问题和改进方向"

# 2. 技术选型辩论
/role-debate architect vs performance "GraphQL vs REST API重构选择"

# 3. 重构实施
/requirements-pilot "重构用户API为RESTful设计" --test
/requirements-pilot "添加API版本控制和向后兼容" --test

# 4. 安全加固
/multi-role security,architect "API安全性全面评估和改进建议"

# 5. 性能验证
/test "API重构后的性能和功能测试"
```

## 🔧 自定义和扩展

### 项目特定配置
```bash
# 在项目的 .claude/CLAUDE.md 中添加项目特定指令
echo "## 项目特定要求" >> .claude/CLAUDE.md
echo "- 所有API必须包含OpenAPI文档" >> .claude/CLAUDE.md
echo "- 前端组件必须支持TypeScript" >> .claude/CLAUDE.md
```

### 创建自定义命令
```bash
# 复制现有命令并修改
cp .claude/commands/code.md .claude/commands/api-code.md
# 编辑 api-code.md 来定制API开发流程
```

---

## 🎯 总结

这个系统的核心价值是**将复杂的软件开发工作流自动化**：

1. **新手**：直接用 `/requirements-pilot` 就能完成大部分工作
2. **进阶用户**：组合使用多个命令，精确控制每个阶段
3. **专家用户**：自定义工作流，适应特定团队需求

**请注意**：信赖质量门控，90 分标准是经过验证的。当系统提示需要改进时，通常意味着确实有改进空间。
