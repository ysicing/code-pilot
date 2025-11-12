# Changelog

## [2.0.0] - 2025-11-12

### Added
- 新增 Codex 技能支持（skills/codex/）
  - 添加 Codex 集成配置文件（SKILL.md）
  - 添加 Codex Python 脚本（scripts/codex.py）
  - 支持通过 MCP 服务调用 Codex 进行代码分析和重构
- 添加 Claude Code 插件清单文件（claudecode.json）
  - 定义插件元数据（v2.0.0）
  - 配置插件名称、描述和版本信息

### Changed
- 重构文档结构，突出 Spec-Kit 规范驱动开发
  - 添加 Spec-Kit 完整工作流程图和命令详解
  - 优化快速开始指南，提供 6 步工作流示例
  - 扩展核心命令分类，新增 "Spec-Kit 工具集" 专门分类
- 优化命令结构和工具配置
  - 细化工具使用说明和配置示例
  - 改进文档组织结构，提升可读性

### Documentation
- 添加 Spec-Kit 优势说明（完整文档化、结构化设计、任务追溯等）
- 更新工作流对比表，从 4 大工作流扩展为 5 大工作流
- 新增 "最新更新" 章节，标注版本更新信息
- 在设计理念中新增 "规范驱动" 原则说明

## [2025-10-05]

### Fixed
- 修复 spec-kit 脚本中模板路径展开问题（将 `~` 改为 `$HOME`）
  - 修正 `setup-plan.sh` 中 plan-template.md 路径处理
  - 修正 `create-new-feature.sh` 中 spec-template.md 路径处理
  - 解决生成 plan.md 文件格式为二进制而非文本的问题
- 修复 spec-kit 所有命令文件中的模板路径引用问题
  - 更新 `specify.md` - 修正脚本和模板路径
  - 更新 `plan.md` - 修正脚本和模板路径
  - 更新 `clarify.md` - 修正预检脚本路径
  - 更新 `tasks.md` - 修正脚本和模板路径
  - 更新 `analyze.md` - 修正预检脚本路径
  - 更新 `implement.md` - 修正预检脚本路径
  - 更新 `constitution.md` - 修正所有模板和命令路径引用

### Added
- 添加 config.json 配置文件

## [2025-09-30]

### Changed
- 更新 `.gitignore` 文件，添加 `history.jsonl` 忽略规则
- 重组模板目录结构，将 spec-kit 相关模板移至 `templates/specify/` 目录
- 修正 spec-kit constitution 命令中的路径引用（从 `templates/specify/commands/` 更新为 `commands/spec-kit/`）

## [2025-09-23]

### Added
- 新增 output-styles/codex.md Codex 输出风格配置文件
- 添加分步骤思考 MCP 服务配置（sequential-thinking）
- 新增 spec-kit 命令套件，包含完整的规格驱动开发工具链：
  - specify: 从自然语言创建功能规格说明
  - clarify: 识别规格中的不明确区域并生成澄清问题
  - plan: 基于规格生成详细的实施计划
  - tasks: 生成可执行的任务列表
  - analyze: 执行跨文档的一致性和质量分析
  - implement: 执行任务列表中定义的所有任务
  - constitution: 创建和维护项目原则文档
- 新增 spec-kit 支持脚本，提供自动化工作流支持：
  - scripts/specify/check-prerequisites.sh: 环境预检查脚本
  - scripts/specify/common.sh: 共享工具函数库
  - scripts/specify/create-new-feature.sh: 新功能创建自动化脚本
  - scripts/specify/setup-plan.sh: 实施计划设置脚本

### Changed
- 更新 CLAUDE.md.example 工作风格说明，明确使用英文思考、中文表达的原则
- 增强 changelog 命令功能，支持暂存区变更记录和智能去重过滤

## [2025-09-18]

### Added
- 新增 bmad-review.md 代码审查专家代理
- 新增 bmad-review-codex 配置文件

### Changed
- 翻译 BMAD 系列代理文档为中文版本（bmad-dev、bmad-orchestrator、bmad-qa、bmad-pilot）
- 优化 bmad-dev 代理的冲刺计划实施流程，强化跨冲刺任务管理
- 增强 bmad-orchestrator 的审查周期管理功能
- 改进 bmad-qa 测试流程，增加审查报告分析步骤
- 更新 bmad-pilot 命令的工作流程说明

### Documentation
- 统一 BMAD 系列代理的中文技术文档规范
- 保留关键技术术语的英文原文（PRD、Sprint、API、CI/CD等）
- 优化代码注释的中文表达

## [2025-09-11]

### Documentation
- 增强 changelog 命令文档，强调数据源必须基于 Git 记录而非会话上下文
- 完善 Git 数据收集流程说明和变更识别机制
- 明确自动分类规则（Added/Changed/Fixed/Documentation）

## [2025-09-02]

### Added
- 新增 `/changelog` 命令（原 `/today-changelog`），用于智能管理项目 CHANGELOG.md 文件
- 支持自动版本管理和 Keep a Changelog 规范
- 添加平台兼容性说明文档
- 添加版本范围限制：日期版本仅记录当天实际操作
- 增强 changelog 命令文档，添加版本合并更新机制说明

### Changed
- 统一文档路径格式，从 `./.claude/` 更改为 `.claude/`
- 重构文档结构，整合功能说明
- 重组代理配置文件结构
- 更新全局指令指南

### Fixed
- 修复 README.md 中克隆路径格式问题
- 纠正安装说明中的路径格式

### Documentation
- 更新仓库链接和文档引用
- 规范化文档路径为相对格式
- 添加上下文管理命令文档
- 增强翻译规则说明

---

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
