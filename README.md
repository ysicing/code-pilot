# Claude Code 多智能体工作流系统

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue)](https://claude.ai/code)

> 将开发工作流从手动命令链升级为自动化专家团队，采用**轻量级质量门控**和**专业化分工**。

## 🎯 核心理念

**质量门控自动化 + 专业化分工 + 轻量级流程**

本仓库提供了一个**轻量级的 Claude Code 元框架**，实现：

- **🎛️ 质量门控自动化**：客观90%标准替代主观判断
- **🧠 专业化分工**：每个工具专注一个领域（避免"万能AI"）  
- **⚡ 轻量级流程**：核心工作流步骤，无冗余环节
- **📊 上下文隔离**：每个智能体保持专业性，避免污染
- **🎯 智能测试**：比例化测试与UI感知策略，防止过度测试

## 🚀 从手动混乱到自动化质量

**之前**：需要持续监督的手动命令链
```bash
/ask → /code → /test → /bugfix → /optimize
# 1-2小时手动协调，主观质量判断
```

**之后**：一键自动化专家工作流与客观质量门控
```bash
/requirements-pilot "实现JWT用户认证系统"
# 或使用新的 BMAD AI团队流水线
/bmad-pilot "实现JWT用户认证系统"
# 30分钟自动执行，90%质量门控，智能测试决策
```

## 📋 两种主要使用模式

### 1. 🏭 需求驱动工作流（自动化专家团队）

**架构**：以需求为中心的工作流，配备质量门控和智能测试
```
requirements-generate → requirements-code → requirements-review → (✅ 就绪?) → 智能测试决策
         ↑                                              ↓ (⚠️ 需要改进)
         ←←←←←← 自动优化循环 ←←←←←←
```

**使用方法**：
```bash
# 一条命令完成完整开发工作流
/requirements-pilot "构建用户管理系统，支持RBAC权限"
# 或使用 BMAD AI团队完整流水线
/bmad-pilot "构建用户管理系统，支持RBAC权限"

# 高级工作流与智能测试
先使用 requirements-generate，然后 requirements-code，再用 requirements-review，
如果就绪则询问用户："代码完成。运行测试？(y/n/lint)"
```

### 2. 🎛️ 阶段化开发（手动协调）

**架构**：针对特定阶段的专业工具

#### **📋 阶段1：需求分析**
```bash
/story-breakdown     # 将复杂功能转化为可实现的用户故事
                     # - 1-3天完成预估
                     # - 明确验收标准  
                     # - 实现优先级排序
                     # - 依赖关系映射
```

#### **🏛️ 阶段2：架构设计**  
```bash
/ask                # 高级系统架构师咨询
                    # - 多专家咨询（4个专家）
                    # - UltraThink方法论进行全面分析
                    # - 战略技术指导与权衡分析
                    # - 纯架构指导，不修改代码

/role-debate        # 专业角色技术辩论
                    # - 架构选型深度辩论（单体vs微服务）
                    # - 技术权衡讨论（安全vs性能）
                    # - 结构化论证过程
                    # - 客观裁决和平衡建议

/screenshot         # 智能屏幕截图分析（仅 macOS）
                    # - UI/UX 设计评估和问题诊断
                    # - 错误信息分析和解决方案
                    # - 界面一致性和可访问性审查
                    # - 多维度视觉设计分析
```

#### **⚡ 阶段3：实现开发**
```bash
/requirements-pilot # 完整自动化流水线（推荐）
                    # - 100分质量评估与用户批准门控
                    # - 智能测试决策（--test/--no-test）
                    # - 文件结构管理（.claude/specs/）

/bmad-pilot         # BMAD AI团队完整开发流水线
                    # - 交互式多智能体协作（PO、架构师、SM、开发、QA）
                    # - UltraThink方法论集成
                    # - 质量门控与用户确认机制
                    # - 仓库感知的上下文驱动开发

/code               # 直接功能实现
                    # - 适用于简单功能或特定组件

/refactor           # 安全渐进式重构与SOLID原则评估
                    # - 代码质量改进和架构优化
                    # - SOLID原则合规性分析
                    # - 渐进式重构策略
```

#### **🔍 阶段4：质量保证**
```bash
/review             # 多维度代码审查
                    # - 4专家审查员（质量、安全、性能、架构）
                    # - 3级评分：✅ 就绪 / ⚠️ 需改进 / ❌ 重大问题
                    # - 实用性优于完美性的实用专注
```

#### **🧪 阶段5：测试验证**
```bash
/test               # 智能测试策略
                    # - UI变更：仅Lint方法
                    # - 小变更（1-5行）：比例化测试
                    # - 业务逻辑：全面测试
```

#### **🐛 阶段6：问题解决**
```bash
/debug              # UltraThink调试协调器
                    # - 4阶段系统化调试
                    # - 假设精炼（5-7个 → 1-2个解决方案）
                    # - 修复前用户确认门控
                    # - 基于证据的诊断策略
```

#### **🚀 阶段7：发布准备**
```bash
/release-check      # 生产就绪验证
                    # - 基于风险的go/no-go决策
                    # - 实用清单方法
                    # - 问题的明确缓解计划
```

## 🔧 **灵活使用模式**

### 模式1：完整自动化（新功能）
```bash
# 单条命令处理整个工作流
/requirements-pilot "JWT认证与刷新令牌" --test
# → 需求(90+) → 用户批准 → 代码 → 审查(90+) → 测试

# 或使用 BMAD AI团队完整流水线
/bmad-pilot "JWT认证与刷新令牌" --test
# → 仓库扫描 → PO需求收集 → 架构设计 → Sprint规划 → 开发 → QA测试
```

### 模式2：步骤式控制（复杂功能）  
```bash
/story-breakdown "电商结账流程"  # 分解为故事
/ask "结账流程：微服务vs单体架构"  # 架构指导
/role-debate architect vs performance "单体vs微服务的性能影响"  # 技术选型辩论
/requirements-pilot "支付处理故事1"  # 逐个故事实现
# 或使用 BMAD 团队流水线
/bmad-pilot "支付处理系统" --direct-dev  # 跳过Sprint规划
/review "验证支付安全性"  # 质量门控
/release-check "支付系统"  # 生产就绪
```

### 模式3：问题驱动（Bug修复）
```bash
/debug "生产API超时问题"  # 系统化诊断
/code "实现连接池修复"  # 直接修复实现  
/release-check "更新的API服务"  # 验证生产就绪
```

### 模式4：质量优先（关键系统）
```bash
/story-breakdown "金融交易系统"
/ask "金融数据的安全架构"
/requirements-pilot "核心交易逻辑" --test
# 或使用 BMAD 团队流水线确保最高质量
/bmad-pilot "金融交易核心系统" --test
/review "安全和性能验证"  
/release-check "金融系统组件"
```

## 🚀 快速开始

### 第一步：用户级设置（推荐）

**选项A：用户级全局配置（推荐）**
```bash
# 导航到用户主目录
cd ~

# 如果存在现有的.claude目录，进行备份
if [ -d ".claude" ]; then
  mv .claude .claude-old
  echo "现有.claude已备份为.claude-old"
fi

# 克隆此仓库作为新的.claude配置
git clone https://github.com/ysicing/code-pilot.git .claude
cd .claude

# 如果有现有配置，复制除agents和commands之外的文件
if [ -d "../.claude-old" ]; then
  # 复制除agents和commands目录之外的所有内容
  find ../.claude-old -maxdepth 1 -type f -exec cp {} . \;
  
  # 复制任何自定义子目录（排除agents和commands）
  for dir in ../.claude-old/*/; do
    dirname=$(basename "$dir")
    if [ "$dirname" != "agents" ] && [ "$dirname" != "commands" ]; then
      cp -r "$dir" ./
    fi
  done
  
  echo "之前的配置已合并（排除agents和commands）"
fi
```

**选项B：项目特定设置**
```bash
# 导航到你的项目目录
cd /path/to/your/project

# 如果存在现有的.claude目录，进行备份
if [ -d ".claude" ]; then
  mv .claude .claude-old
fi

# 克隆此仓库作为项目的.claude配置
git clone https://github.com/ysicing/code-pilot.git .claude

# 如果有现有的项目特定配置
if [ -d ".claude-old" ]; then
  # 从旧配置复制非agent/command文件
  find .claude-old -maxdepth 1 -type f -exec cp {} .claude/ \;
  
  # 复制自定义子目录（排除agents和commands）
  for dir in .claude-old/*/; do
    dirname=$(basename "$dir")
    if [ "$dirname" != "agents" ] && [ "$dirname" != "commands" ]; then
      cp -r "$dir" .claude/
    fi
  done
fi
```

### 第二步：验证Claude Code安装
```bash
# 确保已安装Claude Code
npm install -g @anthropic-ai/claude-code
# 或检查是否已安装
claude --version
```

### 第三步：首次自动化工作流

**选项A：完整自动化（新功能推荐）**
```bash
# 导航到你的项目目录
cd /path/to/your/project

# 一条命令处理所有事情 - 需求、实现、审查、测试
/requirements-pilot "创建支持JWT令牌的用户认证REST API"

# 或使用 BMAD AI团队完整开发流水线
/bmad-pilot "创建支持JWT令牌的用户认证REST API"

# 高级用法与测试控制
/requirements-pilot "构建电商购物车系统" --test
/requirements-pilot "添加UI主题切换器" --no-test  # 仅UI变更
/requirements-pilot "快速功能实现" --skip-scan  # 跳过仓库扫描（不推荐）

# BMAD 高级用法
/bmad-pilot "构建电商购物车系统" --test
/bmad-pilot "添加UI主题切换器" --skip-tests --direct-dev  # 快速开发
```

**选项B：步骤式控制（复杂功能推荐）**
```bash
# 需求分析优先
/story-breakdown "用户管理系统，支持RBAC权限"

# 架构咨询
/ask "微服务中基于角色访问控制的最佳实践"

# 带质量门控的实现
/requirements-pilot "用户注册故事" --test
# 或使用 BMAD 团队流水线
/bmad-pilot "用户管理核心功能" --test

# 生产就绪
/release-check "用户管理组件"
```

### 第四步：理解文件结构

设置后，你的项目将拥有：
```bash
your-project/
├── .claude/
│   ├── commands/          # 17个专业斜杠命令
│   │   ├── ask.md
│   │   ├── bmad-pilot.md
│   │   ├── bugfix.md
│   │   ├── code.md
│   │   ├── debug.md
│   │   ├── multi-role.md
│   │   ├── optimize.md
│   │   ├── refactor.md
│   │   ├── release-check.md
│   │   ├── requirements-pilot.md
│   │   ├── review.md
│   │   ├── role-debate.md
│   │   ├── screenshot.md
│   │   ├── search-gemini.md
│   │   ├── story-breakdown.md
│   │   ├── test.md
│   │   └── ultrathink.md
│   ├── agents/           # 17个专家智能体配置
│   │   ├── bmad-architect.md
│   │   ├── bmad-dev.md
│   │   ├── bmad-orchestrator.md
│   │   ├── bmad-po.md
│   │   ├── bmad-qa.md
│   │   ├── bmad-sm.md
│   │   ├── bugfix.md
│   │   ├── bugfix-verify.md
│   │   ├── code.md
│   │   ├── debug.md
│   │   ├── optimize.md
│   │   ├── requirements-code.md
│   │   ├── requirements-generate.md
│   │   ├── requirements-review.md
│   │   ├── requirements-testing.md
│   │   └── roles/
│   │       ├── architect.md
│   │       ├── frontend.md
│   │       ├── performance.md
│   │       ├── qa.md
│   │       ├── refactorer.md
│   │       └── security.md
│   ├── CLAUDE.md         # Claude Code系统指令
│   └── specs/            # 生成的规格文档（自动创建）
├── your-source-code/
└── other-project-files
```

### 第五步：自定义（可选）

1. **编辑CLAUDE.md**以匹配你的项目特性：
   ```bash
   # 打开并自定义主配置
   code .claude/CLAUDE.md
   ```

2. **为你的工作流自定义命令**：
   ```bash
   # 根据需要编辑特定命令
   code .claude/commands/requirements-pilot.md
   ```

3. **为你的领域调整智能体配置**：
   ```bash
   # 修改智能体行为
   code .claude/agents/requirements-generate.md
   ```

## 🎯 常见使用模式

### Web应用开发
```bash
# 前端功能开发
/requirements-pilot "创建响应式用户仪表板，支持暗色模式" --no-test
# 或使用 BMAD 流水线
/bmad-pilot "创建响应式用户仪表板，支持暗色模式" --skip-tests

# 后端API开发  
/requirements-pilot "构建用户管理REST API" --test
# 或使用 BMAD 团队协作开发
/bmad-pilot "构建用户管理REST API" --test

# 全栈功能
/story-breakdown "电商购物车与结账系统"
/requirements-pilot "购物车前端" --no-test
/requirements-pilot "购物车API后端" --test
/requirements-pilot "支付集成" --test
# 或使用 BMAD 统一流水线
/bmad-pilot "电商购物车完整系统" --test
```

### 数据科学项目
```bash
# 数据分析工作流
/ask "数据管道架构的最佳实践"
/code "实现数据预处理管道"
/review "数据质量和性能验证"

# 模型开发
/requirements-pilot "构建用户推荐ML模型" --test
# 或使用 BMAD 团队进行数据科学项目
/bmad-pilot "构建用户推荐ML模型与评估系统" --test
```

### DevOps和基础设施
```bash
# 基础设施即代码
/requirements-pilot "Docker容器化设置" --test
/requirements-pilot "Kubernetes部署配置" --test
# 或使用 BMAD 团队进行基础设施开发
/bmad-pilot "完整的容器化部署系统" --test

# CI/CD管道
/story-breakdown "完整CI/CD管道与测试"
/requirements-pilot "GitHub Actions工作流" --test
# 或使用 BMAD 流水线开发CI/CD
/bmad-pilot "企业级CI/CD管道系统" --test
```

## ⚠️ 故障排除

### 常见问题与解决方案

**问题：命令不起作用**
```bash
# 检查项目根目录是否存在.claude目录
ls -la .claude/

# 验证CLAUDE.md是否正确配置
cat .claude/CLAUDE.md | head -20
```

**问题：质量门控失败**
```bash
# 命令可能未通过质量检查
# 查看需求规格：
cat .claude/specs/your-feature/requirements-spec.md

# 尝试进一步分解功能：
/story-breakdown "你的复杂功能描述"
```

**问题：测试策略不合适**
```bash
# 对于仅UI变更，使用--no-test
/requirements-pilot "更新按钮颜色" --no-test

# 对于业务逻辑，始终使用--test
/requirements-pilot "用户认证逻辑" --test

# 对于不确定的情况，让系统决定
/requirements-pilot "混合UI和逻辑变更"
```

**问题：智能体专业化不起作用**
```bash
# 检查智能体配置
ls -la .claude/agents/
# 每个智能体应该专业化 - 避免混合关注点

# 为任务使用正确的命令：
/ask "架构问题"  # 不是/code
/code "直接实现"  # 不是/ask
```

### 最佳实践

1. **从简单开始**：大多数新功能使用`/requirements-pilot`
2. **质量优先**：让质量门控（90%阈值）指导进度
3. **适当测试**：逻辑用`--test`，仅UI用`--no-test`
4. **分解复杂功能**：大型项目使用`/story-breakdown`
5. **实现前先架构**：战略决策使用`/ask`

## 🔧 高级配置

### 自定义项目设置

为团队或特定领域自定义系统：

1. **项目特定的CLAUDE.md**：
   ```bash
   # 添加你项目的特定要求
   echo "## 项目特定指令" >> .claude/CLAUDE.md
   echo "- 所有新代码使用TypeScript" >> .claude/CLAUDE.md
   echo "- 遵循我们的API命名约定" >> .claude/CLAUDE.md
   ```

2. **自定义命令**：
   ```bash
   # 创建领域特定命令
   cp .claude/commands/code.md .claude/commands/api-code.md
   # 编辑api-code.md用于API特定开发
   ```

3. **团队工作流**：
   ```bash
   # 创建团队特定工作流
   mkdir .claude/workflows/
   # 添加团队流程文档
   ```

## 📈 性能提示

1. **使用完整自动化**：`/requirements-pilot`比手动链更高效
2. **适当范围**：保持功能专注（1-3天实现）
3. **质量门控**：信任90%阈值 - 它们防止返工
4. **智能测试**：让系统根据变更类型决定测试策略

## 💡 **关键创新**

### 1. **质量门控自动化**
用客观90%评分替代主观判断：
```python
# 传统方式："我觉得代码准备好了"
if developer_subjective_opinion:
    proceed()

# 本系统：客观质量测量
if requirements_score >= 90 and code_quality >= 90:
    proceed()
else:
    optimize_and_retry()
```

### 2. **专业化分工**
避免"万能AI"，使用领域专家：
```bash
❌ 一个AI做所有事：需求 + 编码 + 测试 + 部署
✅ 专家团队：需求专家 + 代码专家 + 质量专家 + 测试专家
```

### 3. **智能测试防止过度测试**
基于变更影响的比例化测试：
```bash
# UI颜色变更（1行） → 仅Lint检查
# 业务逻辑变更（50行） → 完整测试套件
# 新功能 → 全面测试包括边界情况
```

## 📚 工作流示例

### 企业用户认证系统

**步骤式方法**：
```bash
# 需求分析
/story-breakdown "企业SSO与LDAP集成"

# 架构咨询  
/ask "高可用系统的LDAP集成模式"

# 带质量门控的实现
/requirements-pilot "核心认证服务" --test

# 生产就绪验证
/release-check "认证系统组件"
```

**结果**：
- ✅ 可实现的用户故事，1-3天预估
- ✅ 架构指导与风险/权衡分析
- ✅ 生产就绪实现，90%+质量评分
- ✅ 基于变更复杂度的智能测试策略
- ✅ 明确的go/no-go发布决策

### API网关开发

**完整自动化**：
```bash
/requirements-pilot "微服务API网关，支持限流和熔断器" --test
```

**结果**：
- ✅ 需求确认，90+质量评分
- ✅ 实现前用户批准门控
- ✅ 为代码生成优化的技术规格
- ✅ 多维度代码审查（质量/安全/性能）
- ✅ 基于组件复杂度的智能测试

## 📋 完整命令参考

### 📋 需求与规划
- `/story-breakdown` - 将功能分解为可实现的用户故事
- `/requirements-pilot` - 完整自动化需求驱动流水线
- `/bmad-pilot` - BMAD AI团队完整开发流水线

### 🏛️ 架构与咨询  
- `/ask` - 高级系统架构师，4专家咨询方法论

### ⚡ 实现与开发
- `/code` - 带约束的直接功能实现
- `/refactor` - 安全渐进式重构与SOLID原则评估

### 🔍 质量保证
- `/screenshot` - 智能屏幕截图分析和UI评估（仅 macOS）
- `/review` - 多维度代码审查（质量/安全/性能/架构）
- `/test` - 智能测试策略，比例化覆盖

### 🐛 问题解决
- `/debug` - UltraThink调试协调器，4阶段系统化分析
- `/bugfix` - 系统化bug修复工作流

### 🚀 运维与部署
- `/optimize` - 性能优化协调
- `/release-check` - 生产就绪验证，go/no-go决策

### 🧠 高级分析
- `/ultrathink` - **重大决策专用**：MECE原则结构化深度分析，用于架构选型、技术战略等重大决策
- `/multi-role` - 多专家并行分析
- `/role-debate` - 专业角色间深度辩论和技术选型
- `/screenshot` - 智能屏幕截图分析和视觉评估（仅 macOS）
- `/search-gemini` - Gemini网络搜索获取最新信息

## 🏗️ 架构概览

### 核心组件

#### **Commands目录** (`/commands/`)
- **需求规划**：`/story-breakdown` - 功能分解为可实现故事
- **完整流水线**：
  - `/requirements-pilot` - 自动化需求驱动流水线
  - `/bmad-pilot` - BMAD AI团队完整开发流水线
- **咨询服务**：`/ask` - 高级系统架构师，4专家咨询方法论
- **实现工具**：
  - `/code` - 带约束的功能开发
  - `/refactor` - 安全渐进式重构与SOLID原则评估  
- **质量保证**：
  - `/test` - 全面测试策略
  - `/debug` - UltraThink调试协调器，4阶段系统化分析
  - `/review` - 多维度审查（质量、安全、性能、架构）
  - `/screenshot` - 智能屏幕截图分析和UI评估（仅 macOS）
- **Bug解决**：`/bugfix` - 系统化bug修复工作流
- **性能优化**：`/optimize` - 性能优化协调
- **发布管理**：`/release-check` - 生产就绪验证，go/no-go决策
- **流水线**：`/requirements-pilot` - 完整流水线，质量门控和批准工作流
- **高级分析**：
  - `/ultrathink` - MECE原则结构化深度分析
  - `/multi-role` - 多专家并行分析 
  - `/role-debate` - 专业角色间技术选型辩论
  - `/search-gemini` - Gemini网络搜索获取最新信息

#### **Agents目录** (`/agents/`)
- **BMAD 多智能体系统**：
  - **bmad-orchestrator**：工作流协调和上下文管理
  - **bmad-po**：交互式产品负责人，需求收集与质量评分
  - **bmad-architect**：系统架构师，技术设计与质量评分  
  - **bmad-sm**：Scrum Master，Sprint规划和任务分解
  - **bmad-dev**：开发者，基于规格实现功能
  - **bmad-qa**：QA工程师，全面测试与质量验证
- **requirements系列**：
  - **requirements-generate**：代码生成优化的技术规格，直接实现映射
  - **requirements-code**：最小架构开销的直接实现智能体
  - **requirements-review**：实用审查，专注功能性而非架构完美（3级评分）
  - **requirements-testing**：智能测试，比例化覆盖和UI感知策略
- **专业工具智能体**：
  - **bugfix**：分析和修复软件缺陷的bug解决专家
  - **bugfix-verify**：客观评估的修复验证专家
  - **code**：直接实现的开发协调员
  - **debug**：UltraThink系统化问题分析，多智能体协调
  - **optimize**：性能优化协调

### 多智能体协调系统

**BMAD AI团队（6个专家）**：
1. **编排器** - 工作流协调，上下文管理与质量门控
2. **产品负责人** - 交互式需求收集，90+质量评分
3. **系统架构师** - 技术设计，架构质量验证
4. **Scrum Master** - Sprint规划，任务分解与依赖管理
5. **开发者** - 基于规格的功能实现
6. **QA工程师** - 全面测试，质量验证与缺陷检测

**Requirements系列（4个核心专家）**：
1. **需求生成器** - 实现就绪的技术规格
2. **代码实现器** - 直接代码生成，实用专注
3. **质量审查员** - 90%阈值验证，3级评分
4. **智能测试智能体** - 比例化测试，UI感知和过度测试预防

**关键特性**：
- **质量门控自动化**：客观90%标准用于进展决策
- **专业化分工**：每个智能体在独立上下文中工作，保持专业专注
- **智能测试**：UI感知策略防止过度测试同时保持质量
- **轻量级流程**：核心步骤，无官僚主义
- **实用专注**：工作解决方案优于架构完美

## 🤝 贡献

这是一个专注于**轻量级质量门控**的Claude Code配置框架。欢迎贡献：

1. **新阶段命令**：额外的开发阶段覆盖
2. **质量门控增强**：更好的客观测量标准  
3. **智能测试规则**：更复杂的测试决策算法
4. **工作流模式**：特定领域的新自动化序列

## 📄 许可证

MIT许可证 - 使用此框架通过自动化质量门控和专业化分工增强你的Claude Code工作流。

## 🙏 致谢

本项目基于 [myclaude](https://github.com/cexll/myclaude) 进行二次迭代，在此基础上实现了重大增强和创新。我们衷心感谢：

- **@cexll** 创建了奠基性的myclaude项目，为本项目提供了灵感
- **Claude (Anthropic)** 在整个开发过程中提供了卓越的AI协助和大力支持
- Claude Code社区成员们提供的宝贵反馈和贡献

特别感谢与Claude的持续合作，使得复杂的多智能体工作流系统和质量门控自动化成为可能。
