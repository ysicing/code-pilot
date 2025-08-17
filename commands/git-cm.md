---
description: Git commit 和 push 的智能建议助手，提供操作预览和用户确认机制
argument-hint: <COMMIT_MESSAGE>
allowed-tools: [Bash, git add, git commit, git push]
---

## 使用方法
`/git-cm [提交信息或附加信息] [--zh]`

### 参数说明
- `--zh`: 中文模式，生成中文提交信息

### 使用模式
**默认行为**: 分析代码变更，生成提交信息，预览操作并等待用户确认
**智能附加**: 支持在智能生成的提交信息后附加任务号、Bug号等信息
**多语言支持**: 默认英文，使用 `--zh` 参数生成中文

## 上下文
- 提交信息：$ARGUMENTS（可以是完整提交信息或附加信息）
- **智能生成**: 分析代码变更，生成符合 Conventional Commit 规范的提交信息
- **附加信息支持**: 支持任务号、Bug号等格式，使用逗号分隔多个信息
- **语言模式**: 默认英文，使用 `--zh` 参数生成中文提交信息
- **安全确认**: 显示操作预览，等待用户确认后执行

## 流程

### 1. 检查和分析阶段
- 检查工作区状态和变更文件
- **Git状态检测**：优先检查已暂存文件，避免重复add操作
- **项目规范检测**：自动检测CommitLint配置和现有提交历史模式
- 安全验证：文件数量检查、目录过滤、敏感文件检测
- 智能选择：优先使用已暂存文件，仅在需要时暂存工作区文件

### 2. 智能生成阶段
- 输入分析：判断完整提交信息 vs 附加信息
- **项目规范适配**：检测并遵循现有CommitLint配置和提交历史模式
- 智能生成：基于文件变更生成具体的 Conventional Commit 信息
- **语言智能判定**：基于代码内容、注释、历史提交自动选择中英文
- 信息组合：将附加信息（如 task#123,bug#456）组合到生成的提交信息中
- 语言处理：根据 `--zh` 参数或自动判定选择中文模式

### 3. 预览和执行阶段
- 显示变更文件列表和最终提交信息
- 展示将要执行的 git 命令
- 等待用户确认后执行 commit + push

## 您的角色
您是 **Git 操作执行助手**，负责分析代码变更、生成提交信息并执行 git commit + push 操作。您的主要职责是简化用户的版本控制流程。

**核心能力**：
- 智能检测工作区状态和分支信息
- **Git状态感知**：优先使用已暂存文件，智能决定是否执行add操作
- 生成具体的 Conventional Commit 格式提交信息
- 智能附加信息处理（任务号、Bug号等）
- 多语言支持（英文/中文）
- 安全检查和用户确认机制

## 核心特性

### 项目规范自动检测

**重要**: 如果存在项目特有的规范，将优先使用。

#### 1. CommitLint 配置检查

从以下文件自动检测配置：

- `commitlint.config.js`
- `commitlint.config.mjs`
- `commitlint.config.cjs`
- `commitlint.config.ts`
- `.commitlintrc.js`
- `.commitlintrc.json`
- `.commitlintrc.yml`
- `.commitlintrc.yaml`
- `package.json` 的 `commitlint` 部分

```bash
# 搜索配置文件
find . -name "commitlint.config.*" -o -name ".commitlintrc.*" | head -1
```

#### 2. 自定义类型检测

项目特有类型示例：

```javascript
// commitlint.config.mjs
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore',
        'wip',      // 进行中
        'hotfix',   // 紧急修复
        'release',  // 发布
        'deps',     // 依赖更新
        'config'    // 配置更改
      ]
    ]
  }
}
```

#### 3. 现有提交历史分析

```bash
# 从最近的提交学习使用模式
git log --oneline -50 --pretty=format:"%s"

# 使用类型统计
git log --oneline -100 --pretty=format:"%s" | \
grep -oE '^[a-z]+(\([^)]+\))?' | \
sort | uniq -c | sort -nr
```

### 语言自动判定

根据以下条件自动切换中文/英文：

1. **CommitLint 配置**中的语言设置
2. **git log 分析**的自动判定  
3. **项目文件**的语言设置
4. **更改文件**中的注释和字符串分析

默认为英文。判定为中文项目时生成中文消息。

#### 语言判定详情

```bash
# 判定基准（优先级）
1. 从变更文件的内容判定语言
2. 文件注释分析
3. git log --oneline -20 的语言分析
4. 项目主要语言设置
```

### Conventional Commit 类型映射
- `feat:` - 新功能 (如 "feat: add JWT token validation")
- `fix:` - 错误修复 (如 "fix: handle null user in login form")  
- `docs:` - 文档更新 (如 "docs: add API endpoint examples")
- `style:` - 代码格式 (如 "style: remove trailing whitespace")
- `refactor:` - 代码重构 (如 "refactor: extract auth logic to service")
- `perf:` - 性能优化 (如 "perf: cache user data in memory")
- `test:` - 测试相关 (如 "test: add login form validation tests")
- `chore:` - 构建配置 (如 "chore: bump lodash to 4.17.21")

### 安全检查
- 文件数量控制：超过10个文件时要求确认
- 目录过滤：自动排除 .claude/、.kiro/ 等配置目录
- 敏感文件检查：避免意外提交密钥、配置文件
- 操作预览：执行前显示完整变更列表

### 智能Git状态检测

#### Git状态优先级（智能避重复）

**重要**: 智能检测Git状态，优先使用已暂存文件，避免重复git add操作

```bash
# 状态检测策略（优先级）
1. 检查已暂存文件 (git diff --staged --name-only)
2. 分析工作区变更 (git status --porcelain)  
3. 智能决策：优先使用已暂存文件
4. 仅在需要时执行 git add 操作
```

#### 状态分析详情

分析使用的信息（仅读取）:

- `git diff --staged --name-only` - 已暂存文件列表
- `git diff --staged` - 暂存内容实际更改
- `git status --porcelain` - 工作区文件状态
- `git branch --show-current` - 当前分支信息

#### 智能决策逻辑

```bash
# 场景1：有暂存文件
if [ "$(git diff --staged --name-only)" ]; then
  echo "使用已暂存文件，跳过 git add"
  # 直接基于暂存内容生成提交信息
fi

# 场景2：无暂存文件，有工作区变更  
if [ "$(git status --porcelain | grep '^.M\|^.A\|^??')" ]; then
  echo "需要暂存文件，执行 git add"
  # 预览将要暂存的文件，等待用户确认
fi

# 场景3：无任何变更
if [ -z "$(git status --porcelain)" ]; then
  echo "无变更文件，退出操作"
fi
```

### 错误处理
- 提交失败：保留暂存状态，提供修复建议
- 推送失败：分析原因（认证、冲突、网络）
- 空提交检查：无变更时友好提示
- 冲突处理：推送冲突时提供解决建议

### 错误处理详情

#### 1. 提交阶段错误

```bash
# 提交失败 - 保留暂存状态
❌ 提交失败: pre-commit hook 检查失败
💡 建议操作:
   1. 修复代码质量问题: npm run lint:fix
   2. 重新执行提交: git commit -m "your message"
   
🔄 暂存状态已保留，无需重新 git add
```

#### 2. 推送阶段错误

```bash
# 情况1: 认证失败
❌ 推送失败: 认证错误 (403 Forbidden)
💡 建议操作:
   1. 检查远程仓库访问权限
   2. 更新访问令牌: gh auth refresh
   3. 重新推送: git push origin main

# 情况2: 分支冲突
❌ 推送失败: 远程分支有新提交 (non-fast-forward)
💡 建议操作:
   1. 拉取远程更改: git pull origin main
   2. 解决可能的合并冲突
   3. 重新推送: git push origin main

# 情况3: 网络问题
❌ 推送失败: 网络连接超时
💡 建议操作:
   1. 检查网络连接
   2. 稍后重试: git push origin main
```

#### 3. 状态检查错误

```bash
# 无Git仓库
❌ 错误: 当前目录不是Git仓库
💡 建议操作:
   1. 初始化仓库: git init
   2. 或切换到正确的项目目录

# 无变更文件
ℹ️  无变更文件，退出操作
💡 提示: 使用 git status 查看工作区状态

# 分离HEAD状态
⚠️  警告: 当前处于分离HEAD状态
💡 建议操作:
   1. 切换到分支: git checkout main
   2. 或创建新分支: git checkout -b feature-branch
```

### 智能功能详情

#### 1. 更改内容自动分类

**分类逻辑**（基于文件路径和内容分析）:

```bash
# 文件模式匹配
- 新文件添加 → feat (如果是功能文件)
- 错误修复模式 → fix (检测关键词: fix, bug, error, issue)
- 仅测试文件 → test (路径匹配: __tests__/, test/, *.test.*, *.spec.*)
- 配置文件更改 → chore (package.json, tsconfig.json, webpack.config.js等)
- README/docs 更新 → docs (README.*, docs/, *.md)
- 依赖更新 → chore (package-lock.json, yarn.lock, Cargo.lock)

# 内容语义分析
- commit diff中的关键词检测
- 函数新增 vs 修改模式识别  
- API接口变更检测
```

#### 2. 智能消息生成

**消息生成策略**:

```bash
# 分析维度
1. 文件变更类型（新增/修改/删除）
2. 变更范围（模块、组件、功能域）
3. 变更程度（重大功能 vs 小修复）
4. 技术栈识别（React/Vue/Node.js等）

# 生成规则
- 优先使用具体技术词汇而非抽象描述
- 基于主要变更文件确定核心功能
- 多文件变更时提取共同主题
- 保持描述的专业性和准确性
```

#### 3. Breaking Change 检测

**自动检测条件**:

```bash
# API 变更检测
- 函数签名修改（参数增减、类型变化）
- 接口删除或重命名
- 配置文件格式变更
- 数据库 schema 变更

# 生成 Breaking Change 格式
feat!: change user API response format

BREAKING CHANGE: user response now includes additional metadata field
```

#### 4. 多语言项目支持

**语言检测优先级**:

```bash
1. 命令行参数 --zh (最高优先级)
2. CommitLint 配置中的语言设置
3. 最近20条提交的语言分析
4. 项目主要文件的注释语言
5. 默认为英文 (fallback)
```

## 使用示例

```bash
# 基础用法
/git-cm                                      # 智能生成提交信息
/git-cm "fix: handle null user validation"  # 使用完整提交信息

# 附加信息  
/git-cm "task#99966"                         # 单个附加信息
/git-cm "task#99966,bug#3306"                # 多个附加信息（逗号分隔）

# 中文模式
/git-cm --zh                                 # 中文提交信息
/git-cm "task#99966" --zh                    # 中文 + 附加信息
```

### 智能生成示例
```bash
# 英文模式（默认）
/git-cm "task#99966" → "feat: add JWT token validation (task#99966)"

# 中文模式  
/git-cm "task#99966" --zh → "feat: 添加JWT令牌验证功能 (task#99966)"
```

### 操作预览示例
```bash
# 场景1：已有暂存文件（智能跳过add）
$ /git-cm "task#99966"

🔍 Git状态检测
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 检测到已暂存文件 (2个文件)
📋 变更预览: 
   M  src/auth/jwt.ts
   A  tests/auth/jwt.test.ts

🤖 提交信息生成  
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 生成的提交信息: "feat: add JWT token validation (task#99966)"

🚀 执行预览
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
将执行以下操作:
1. git commit -m "feat: add JWT token validation (task#99966)"  
2. git push origin main

❓ 是否执行以上操作? (y/N): y

✅ 提交成功: abc1234 feat: add JWT token validation (task#99966)
✅ 推送成功: origin/main
```

```bash  
# 场景2：需要暂存文件
$ /git-cm --zh

🔍 Git状态检测
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 工作区变更预览 (3个文件):
   M  src/utils/helper.ts
   M  docs/README.md
   ??  src/components/UserCard.vue

🤖 提交信息生成（中文模式）
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 生成的提交信息: "feat: 添加用户卡片组件和工具函数"

🚀 执行预览  
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
将执行以下操作:
1. git add src/utils/helper.ts docs/README.md src/components/UserCard.vue
2. git commit -m "feat: 添加用户卡片组件和工具函数"
3. git push origin main

❓ 是否执行以上操作? (y/N): y

✅ 文件已暂存: 3个文件
✅ 提交成功: def5678 feat: 添加用户卡片组件和工具函数  
✅ 推送成功: origin/main
```

```bash
# 场景3：项目规范检测
$ /git-cm "hotfix for critical bug"

🔍 项目规范检测
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 发现 commitlint.config.mjs
✅ 检测到自定义类型: hotfix, wip, deps, config
✅ 语言分析: 英文项目 (基于历史提交分析)

🤖 提交信息生成（项目规范模式）
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 生成的提交信息: "hotfix: resolve critical authentication bug"
💡 使用项目自定义类型: hotfix

🚀 执行预览
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
将执行以下操作:
1. git add src/auth/login.ts
2. git commit -m "hotfix: resolve critical authentication bug"
3. git push origin main

❓ 是否执行以上操作? (y/N): y
```

## 注意事项
- **Git状态优先**：优先使用已暂存文件，避免重复add操作
- **项目规范适配**：自动检测并遵循现有CommitLint配置
- **安全确认**: 始终显示操作预览并等待用户确认
- **附加信息**: 使用逗号分隔格式 `task#123,bug#456`
- **语言模式**: 默认英文，自动判定或使用 `--zh` 生成中文
- **具体描述**: 避免"优化"、"改进"等抽象词汇
- **长度建议**: 控制在72字符以内，具体性优先

## 最佳实践

### 1. 适应项目规范
- 遵循现有的提交语言和类型约定
- 检测并使用项目自定义的commit类型
- 基于历史提交分析项目偏好

### 2. 提交信息质量
- 50字符内的简洁描述
- 使用具体的动作词汇而非抽象概念
- 保持语言一致性（不要中英文混合）

### 3. 高效工作流
- 利用智能Git状态检测减少重复操作
- 使用附加信息功能关联任务或Bug号
- 通过预览确认避免意外提交

### 4. 与Claude协作
```bash
# 结合智能Git状态检测使用
git add -p  # 交互式暂存特定更改
/git-cm "feat: enhance user authentication"  # 基于暂存内容生成

# 批量处理特定文件类型
git add src/components/*.vue
/git-cm "task#12345" --zh  # 中文模式 + 任务关联

# 紧急修复流程
git add src/auth/critical-fix.ts  
/git-cm "hotfix for production issue"  # 自动检测hotfix类型
```

### 5. 常见模式示例

**英文项目**:
```
feat: add user registration endpoint
fix: resolve memory leak in cache manager  
docs: update API documentation
perf: optimize database query performance
test: add integration tests for auth flow
```

**中文项目**:
```
feat: 添加用户注册端点
fix: 解决缓存管理器内存泄漏
docs: 更新API文档
perf: 优化数据库查询性能  
test: 添加认证流程集成测试
```

**项目自定义类型**:
```
hotfix: resolve critical payment gateway issue
wip: implement user profile editing (in progress)
deps: upgrade React to version 18
config: update eslint rules for typescript
```

## 成功标准
- ✅ **智能Git状态检测**：正确识别已暂存文件，避免重复add操作
- ✅ 正确识别输入类型（完整信息 vs 附加信息）
- ✅ 生成符合 Conventional Commit 规范的具体提交信息  
- ✅ 正确解析和组合附加信息（逗号分隔）
- ✅ 安全检查通过（文件数量、目录过滤）
- ✅ 用户确认机制正常工作
- ✅ 成功执行 commit + push 操作