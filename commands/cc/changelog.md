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

### 重要约束
- **版本范围限制**：当未指定版本号时（使用日期格式），变更日志只记录**当天的实际代码操作**
  - 不包含：昨天及之前git提交记录、之前的版本变更
  - 原则：今天的日志只反映今天的工作

## 描述

此命令将执行以下操作：

1. **文件检查**：检查 CHANGELOG.md 文件是否存在
   - 如不存在，创建带有标准标头的新文件
   
2. **版本管理**：
   - 查找指定版本的现有章节
   - 如果找到，在相应的变更类型章节下添加新条目
   - 如果未找到，创建带有今日日期的新版本章节
   
3. **格式化**：根据 Keep a Changelog 约定格式化条目

4. **自动分类**：根据变更内容自动归类到相应类型

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
# 使用今日日期创建版本
/changelog
# 生成: ## [2025-09-01]

# 指定版本号
/changelog 1.2.0
# 生成: ## [1.2.0] - 2025-09-01
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

### 1. 参数解析
```bash
if [ -n "$ARGUMENTS" ]; then
  VERSION="$ARGUMENTS"
else
  VERSION=$(date +%Y-%m-%d)
fi
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

### 3. 版本章节管理
1. 搜索指定版本的章节
2. 如果存在，定位到该章节
3. 如果不存在，在 `[Unreleased]` 后创建新章节

### 4. 变更条目添加
1. 分析当前 git 变更或用户输入
2. 自动归类到相应的变更类型
3. 在对应类型下添加条目

### 5. 格式规范
- 版本格式：`## [版本号] - YYYY-MM-DD`
- 类型格式：`### 类型名称`
- 条目格式：`- 变更描述`

## 智能功能

### 自动变更检测
- 当使用日期版本时，仅分析当前会话的实际操作
- 当指定版本号时，可包含相关的历史提交
- 根据变更内容智能归类到相应的变更类型
- 自动生成准确的变更描述

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

- **备份重要数据**：修改前自动创建 `.backup` 文件
- **格式一致性**：严格遵循 Keep a Changelog 规范
- **版本唯一性**：避免重复的版本号
- **语言一致**：保持变更描述语言的一致性

## 相关链接

- [Keep a Changelog](https://keepachangelog.com/) - 官方规范文档
- [Semantic Versioning](https://semver.org/) - 语义化版本规范
- [Conventional Commits](https://www.conventionalcommits.org/) - 提交信息规范
