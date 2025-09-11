---
description: 智能管理项目 CHANGELOG.md 文件，自动添加版本条目并遵循 Keep a Changelog 规范
argument-hint: [<version>]
allowed-tools: [Read, Write, Edit, Bash]
---

# 管理项目变更日志

此命令用于向项目的 CHANGELOG.md 文件添加新条目，自动管理版本章节和变更分类。

## 用法

```bash
/changelog             # 自动使用今日日期作为版本
/changelog <version>   # 使用指定版本号
```

### 参数说明
- `<version>` (可选): 版本号，如 `1.2.0`、`v2.0.0-beta.1`
  - 未指定时自动使用格式：`YYYY-MM-DD` (如 2025-09-01), 调用 `get-current-datetime` 子智能体获取当前时间
  - 支持语义化版本：主版本.次版本.修订版本
  - 支持预发布版本：`alpha`、`beta`、`rc` 等
  - **重要**：如果版本已存在，将添加新的变更条目到该版本；如果不存在，创建新版本章节

### 重要约束
- **数据源要求**：必须基于Git记录，绝不依赖会话上下文
- **版本范围限制**：当未指定版本号时（使用日期格式），变更日志只记录**当天的实际代码操作**
  - 不包含：昨天及之前git提交记录、之前的版本变更
  - 原则：今天的日志只反映今天的工作

## 描述

此命令将执行以下操作：

1. **Git 数据收集**：首先从 Git 获取所有必要的变更信息
   - 执行 git log、git diff、git status 命令
   - 基于实际的代码提交和变更生成日志
2. **文件检查**：检查 CHANGELOG.md 文件是否存在
   - 如不存在，创建带有标准标头的新文件
3. **版本管理**：
   - 查找指定版本的现有章节
   - **如果版本已存在**：合并更新，将新的变更条目添加到相应类型下
   - **如果版本不存在**：创建新版本章节并添加所有变更
   
4. **智能合并**：
   - 收集当前会话或最新的变更
   - 检测并避免重复条目
   - 保持现有条目不变，仅追加新条目
   
5. **格式化**：根据 Keep a Changelog 约定格式化条目

6. **自动分类**：根据变更内容自动归类到相应类型
   - 分析提交信息和实际代码变更来确定类型
   - Added: 新文件、新功能、新命令
   - Changed: 现有功能修改、重构
   - Fixed: bug修复、错误纠正
   - Documentation: 仅文档更新

CHANGELOG 严格遵循 [Keep a Changelog](https://keepachangelog.com/) 格式规范。

## 变更类型

根据 Keep a Changelog 规范，支持以下变更类型：

- **Added**: 新增功能
- **Changed**: 现有功能的变更
- **Deprecated**: 即将移除的功能
- **Removed**: 已移除的功能
- **Fixed**: 错误修复
- **Security**: 安全相关的修复

## 使用示例

### 基础用法
```bash
# 使用今日日期创建或更新版本
/changelog
# 首次执行: 创建 ## [2025-09-01] 并添加所有变更
# 再次执行: 合并新变更到 ## [2025-09-01]

# 指定版本号
/changelog 1.2.0
# 首次: 创建 ## [1.2.0] - 2025-09-01
# 更新: 合并新变更到现有 [1.2.0] 版本
```

### 合并更新示例
```bash
# 假设 [2025-09-02] 已存在以下内容：
## [2025-09-02]
### Added
- 新增 changelog 命令

# 执行 /changelog 后，如有新变更：
## [2025-09-02]
### Added
- 新增 changelog 命令
- 添加版本合并更新功能  # <- 新增的条目

### Fixed
- 修复版本重复创建问题  # <- 新增的类型和条目
```

### 生成的 CHANGELOG.md 格式示例
```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2025-09-01
### Added
- 新的用户认证功能
- API 速率限制功能

### Changed
- 更新了数据库连接池配置
- 优化了查询性能

### Fixed
- 修复了内存泄漏问题
- 解决了并发访问冲突

## [1.1.0] - 2025-08-15
### Added
- 初始版本发布
```

## 实现流程

该命令的执行流程：

### 1. 参数解析与数据收集
```bash
# 版本参数处理
if [ -n "$ARGUMENTS" ]; then
  VERSION="$ARGUMENTS"
else
  VERSION=$(date +%Y-%m-%d)
fi

# 从 Git 获取变更数据（关键步骤）
# 根据具体需求确定时间范围
# 例如：获取最近的提交或自上个版本以来的提交
RECENT_COMMITS=$(git log --oneline -10)  # 最近10个提交
CODE_CHANGES=$(git diff HEAD~1..HEAD --name-status)
UNSTAGED=$(git status --porcelain)
```

### 2. 文件处理
1. 检查 CHANGELOG.md 是否存在
2. 不存在则创建标准模板：
   ```markdown
   # Changelog
   
   All notable changes to this project will be documented in this file.
   
   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
   and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
   
   ## [Unreleased]
   ```

### 3. 版本章节管理与合并
1. 搜索指定版本的章节
2. **版本存在时的合并更新**：
   - 保留该版本下所有现有条目
   - 分析当前会话或最新的 git 变更
   - 识别尚未记录的新变更
   - 将新条目合并到对应的类型章节（Added/Changed/Fixed等）
   - 智能去重，避免重复记录相同变更
3. **版本不存在时的创建**：
   - 在 `[Unreleased]` 后创建新版本章节
   - 添加所有相关变更条目

### 4. 变更条目合并策略
1. **新变更识别**（基于 Git 数据）：
   - 分析现有 CHANGELOG.md 确定上次记录的位置
   - 执行 `git log --format="%H %s"` 获取相关提交
   - 对于日期版本：查找该日期相关的提交
   - 对于版本号：查找自上个版本标签以来的提交
   - 执行 `git diff` 分析具体文件变更
   - 执行 `git status --porcelain` 检查未提交变更
   - 从 Git 数据中提取有意义的变更描述
   - **绝不使用**会话记忆或上下文推测

2. **智能合并**：
   - 读取现有版本的所有条目
   - 对比新变更与现有条目
   - 仅添加真正的新条目

3. **分类整理**：
   - 自动归类到正确的变更类型
   - 在已有类型章节追加新条目
   - 创建缺失的类型章节

4. **合并结果**：
   - 保持原有条目顺序和内容
   - 新条目追加在各类型的末尾
   - 无新变更时给出明确提示

### 5. 格式规范
- 版本格式：`## [版本号] - YYYY-MM-DD`
- 类型格式：`### 类型名称`
- 条目格式：`- 变更描述`

## 智能功能

### 自动变更检测与合并
- **数据源**：必须从 Git 获取，而非会话上下文
  - `git log` 获取相关提交记录（根据版本策略确定范围）
  - `git diff` 分析代码变更内容
  - `git status` 检查工作区状态
- 当使用日期版本时，智能分析相关的 Git 提交
- 当指定版本号时，可包含相关的历史提交
- 根据变更内容智能归类到相应的变更类型
- 自动生成准确的变更描述

### 版本合并更新机制
- **检测阶段**：
  - 解析 CHANGELOG.md 查找目标版本
  - 读取该版本下所有现有条目
  
- **合并策略**：
  - **版本已存在**：
    * 保留所有现有条目不变
    * 收集自上次更新以来的新变更
    * 智能去重后追加新条目
    * 维护或创建必要的类型章节
  - **版本不存在**：
    * 创建完整的新版本章节
    * 添加所有相关变更
    
- **结果验证**：
  - 确保格式符合 Keep a Changelog 规范
  - 检查条目不重复
  - 保持时间顺序

### 版本号智能处理
- 支持多种版本格式（语义化、日期、自定义）
- 自动补全日期信息
- 版本排序和去重

### 格式验证
- 检查 Markdown 语法正确性
- 确保链接和引用有效
- 保持一致的缩进和格式

## 错误处理

### 常见错误场景

1. **文件权限不足**
   ```
   ❌ 错误：无法写入 CHANGELOG.md
   💡 解决：检查文件权限或使用 sudo
   ```

2. **版本号格式错误**
   ```
   ❌ 错误：版本号格式无效
   💡 提示：使用语义化版本（如 1.2.0）或日期格式（YYYY-MM-DD）
   ```

3. **文件编码问题**
   ```
   ❌ 错误：文件编码不兼容
   💡 解决：确保文件使用 UTF-8 编码
   ```

## 最佳实践

### 版本管理建议
- 使用语义化版本号管理正式发布
- 使用日期版本管理日常更新（仅记录当天实际工作）
- 保持 `[Unreleased]` 章节用于开发中的变更
- 日期版本专注于当天的实际代码变更，不混入历史记录

### 变更描述规范
- 使用简洁明了的描述
- 从用户角度描述变更影响
- 包含相关的 issue 或 PR 编号

### 维护建议
- 定期清理和归档旧版本
- 为重大版本添加迁移指南
- 保持链接和引用的有效性

## 注意事项
- **格式一致性**：严格遵循 Keep a Changelog 规范
- **版本处理**：
  - 版本已存在时，添加新变更而非跳过
  - 自动检测并避免重复条目
  - 无新变更时给出明确提示
- **语言一致**：保持变更描述语言的一致性

## 相关链接

- [Keep a Changelog](https://keepachangelog.com/) - 官方规范文档
- [Semantic Versioning](https://semver.org/) - 语义化版本规范
- [Conventional Commits](https://www.conventionalcommits.org/) - 提交信息规范
