# Changelog

## [2025-09-23]

### Added
- 新增 output-styles/codex.md Codex 输出风格配置文件
- 添加分步骤思考 MCP 服务配置（sequential-thinking）

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
