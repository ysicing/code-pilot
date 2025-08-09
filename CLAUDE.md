# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

本文件为 Claude Code (claude.ai/code) 在此代码库中工作时提供指导。

## Repository Overview | 代码库概览

This is a Claude Code Multi-Agent Workflow System that provides a **lightweight meta-framework** for implementing automated expert development workflows. It transforms manual command chains into automated multi-agent processes with practical quality gates and specialized expertise.

这是一个 Claude Code 多智能体工作流系统，提供了一个**轻量级元框架**来实现自动化专家开发工作流。它将手动命令链转换为具有实用质量门控和专业化技能的自动化多智能体流程。

**Core Philosophy | 核心理念**: Quality gate automation + Professional specialization + Lightweight process

**核心理念**: 质量门控自动化 + 专业化分工 + 轻量级流程

## Architecture | 架构

### Core Components | 核心组件

The repository contains two main directories:

代码库包含两个主要目录：

1. **`/commands/`** - 10 specialized slash commands for targeted development workflows
   
   **`/commands/`** - 10个专业化斜杠命令，用于针对性的开发工作流

2. **`/agents/`** - 9 expert agent configurations for multi-agent orchestration
   
   **`/agents/`** - 9个子智能体配置，用于多智能体编排

### Key Workflow Patterns | 关键工作流模式

**Requirements-Driven Workflow (Primary) | 需求驱动工作流（主要）**:
```
requirements-generate → requirements-code → requirements-review → (✅ Ready?) → smart-testing-decision
```

**Manual Command Workflow (Secondary) | 手动命令工作流（辅助）**:
Available through individual slash commands - see detailed command reference below.

可通过各个斜杠命令使用 - 详见下方详细命令参考。

## Primary Commands | 主要命令

### `/requirements-pilot`
The main automated workflow command with intelligent adaptation:

带有智能适应的主要自动化工作流命令：

**Usage | 用法**: 
```bash
/requirements-pilot <FEATURE_DESCRIPTION> [--test|--no-test]
```

**Core Features | 核心功能**:
- Interactive requirements confirmation with 100-point quality assessment
  互动式需求确认，包含100分质量评估
- User approval gate at 90+ quality score (mandatory stop point)
  90+质量评分的用户批准门控（强制停止点）
- 4-phase automated implementation: Requirements → Specs → Code → Testing
  4阶段自动化实现：需求 → 规格 → 代码 → 测试
- Smart testing decisions with UI-aware strategies
  具有UI感知策略的智能测试决策
- File structure management (.claude/specs/{feature_name}/)
  文件结构管理 (.claude/specs/{feature_name}/)

### Core Manual Commands (10 total) | 核心手动命令（10个）

- `/ask <TECHNICAL_QUESTION>` - Senior Systems Architect with 4-expert consultation methodology
  `/ask <技术问题>` - 高级系统架构师，采用4专家咨询方法
- `/story-breakdown <FEATURE_DESCRIPTION>` - Break complex features into implementable user stories
  `/story-breakdown <功能描述>` - 将复杂功能分解为可实现的用户故事
- `/bugfix <ERROR_DESCRIPTION>` - Bug resolution workflow with systematic analysis
  `/bugfix <错误描述>` - 具有系统性分析的错误解决工作流
- `/code <FEATURE_DESCRIPTION>` - Direct feature implementation
  `/code <功能描述>` - 直接功能实现
- `/debug <TASK_DESCRIPTION>` - UltraThink Debug Orchestrator with 4-phase systematic analysis
  `/debug <任务描述>` - UltraThink调试编排器，采用4阶段系统性分析
- `/optimize <PERFORMANCE_TARGET>` - Performance optimization
  `/optimize <性能目标>` - 性能优化
- `/review <CODE_SCOPE>` - Multi-dimensional review (Quality, Security, Performance, Architecture)
  `/review <代码范围>` - 多维度审查（质量、安全、性能、架构）
- `/test <COMPONENT_OR_FEATURE>` - Testing strategy and implementation
  `/test <组件或功能>` - 测试策略和实现
- `/release-check <COMPONENT_OR_SYSTEM>` - Production readiness verification with go/no-go decision
  `/release-check <组件或系统>` - 生产就绪性验证，包含通过/不通过决策
- `/requirements-pilot <FEATURE_DESCRIPTION>` - Main automated workflow with intelligent testing
  `/requirements-pilot <功能描述>` - 带有智能测试的主要自动化工作流

## Agent Architecture | 智能体架构

### Requirements Workflow Agents | 需求工作流智能体
- **requirements-generate**: Code-generation-optimized technical specifications with direct implementation mapping
  **requirements-generate**: 代码生成优化的技术规格，具有直接实现映射
- **requirements-code**: Direct implementation with minimal architectural overhead  
  **requirements-code**: 架构开销最小的直接实现
- **requirements-review**: Pragmatic review focusing on functionality over architectural perfection (3-level scoring)
  **requirements-review**: 务实的审查，侧重功能性而非架构完美（3级评分）
- **requirements-testing**: Smart testing with proportional coverage and UI-aware strategies to prevent over-testing
  **requirements-testing**: 智能测试，具有比例覆盖和UI感知策略以防止过度测试

### Specialized Agents | 专业化智能体
- **bugfix**: Bug resolution specialist for systematic defect analysis and fixing
  **bugfix**: 用于系统性缺陷分析和修复的错误解决专家
- **bugfix-verify**: Independent fix validation and objective assessment
  **bugfix-verify**: 独立的修复验证和客观评估
- **code**: Development coordinator directing coding specialists
  **code**: 指导编码专家的开发协调员
- **debug**: UltraThink debug orchestrator for systematic problem analysis with multi-agent coordination
  **debug**: 用于系统性问题分析和多智能体协调的UltraThink调试编排器
- **optimize**: Performance optimization coordinator
  **optimize**: 性能优化协调员

## Quality Gate System | 质量门控系统

### Quality Scoring Framework | 质量评分框架

**Unified Scoring System | 统一评分体系**：
- **100-Point Scale | 100分制**：用于需求确认和详细评估
  - 90-100分：优秀，可进入下一阶段
  - 70-89分：需要改进
  - <70分：需要重大修改

- **3-Level Assessment | 3级评估**：用于代码审查和最终决策
  - ✅ **通过评审（90-100分）**：生产就绪
  - ⚠️ **需要改进（70-89分）**：有条件通过
  - ❌ **严重问题（<70分）**：不通过

### Lightweight Quality Standards | 轻量级质量标准
- **Requirements Clarity | 需求清晰度**: 90+ points before implementation starts | 实现开始前须达90+分
- **Code Quality | 代码质量**: 90+ points before testing phase | 测试阶段前须达90+分
- **Production Readiness | 生产就绪性**: Clear go/no-go decision for releases | 发布时明确的通过/不通过决策

### Smart Testing Logic | 智能测试逻辑
- **UI-Only Changes | 仅UI更改**: Lint checks only | 仅进行代码规范检查
- **Minor Changes (1-5 lines) | 小幅更改（1-5行）**: Proportional testing | 比例测试
- **Business Logic | 业务逻辑**: Comprehensive testing | 全面测试
- **Complex Features | 复杂功能**: Full test pyramid approach | 完整的测试金字塔方法

## Workflow Guidelines | 工作流指导原则

### Multi-Agent Coordination | 多智能体协调
- Each agent operates in isolated contexts to prevent quality degradation
  每个智能体在隔离的上下文中操作，以防止质量下降
- Automatic quality gates determine workflow progression  
  自动质量门控决定工作流进展
- 90% threshold for most quality gates
  大多数质量门控采用90%阈值
- Iterative improvement loops when quality thresholds not met
  未达到质量阈值时进行迭代改进循环

### Intelligent Review and Testing Logic | 智能审查和测试逻辑

**Smart Testing Decision Logic | 智能测试决策逻辑**:
- **Default | 默认**: Ask "Code complete. Run tests? (y/n)" after review passes
  审查通过后询问「代码完成。运行测试？(y/n)」
- **--test**: Automatically run tests after successful review
  **--test**: 审查成功后自动运行测试
- **--no-test**: Skip testing entirely
  **--no-test**: 完全跳过测试
- **Smart Detection | 智能检测**: Proportional testing based on change complexity and type
  基于更改复杂性和类型的比例测试

**Testing Optimization Features | 测试优化功能**:
- **UI-Aware Strategy | UI感知策略**: Lint-only approach for pure UI changes (colors, layouts, text)
  对纯UI更改（颜色、布局、文本）仅采用代码规范检查方法
- **Change-Proportional Testing | 更改比例测试**: 1-5 lines = lint check only, no over-testing
  1-5行 = 仅代码规范检查，无过度测试
- **Component Type Recognition | 组件类型识别**: Different strategies for frontend UI vs backend logic
  前端UI与后端逻辑采用不同策略
- **Risk-Based Coverage | 风险导向覆盖**: Focus testing on business-critical functionality only
  仅专注于业务关键功能的测试

### Implementation-First Approach | 实现优先方法
- Direct technical specifications optimized for code generation
  针对代码生成优化的直接技术规格
- Minimal architectural abstractions
  最小化架构抽象
- Single document strategy for specifications
  规格文档的单一文档策略
- Concrete implementation details over theoretical design
  具体实现细节优于理论设计

## Stage-Based Tool Usage | 阶段化工具使用

### 📋 Requirements Analysis | 需求分析 → `/story-breakdown`
Break complex features into implementable user stories with clear acceptance criteria.

将复杂功能分解为具有明确验收标准的可实现用户故事。

### 🏛️ Architecture Design | 架构设计 → `/ask`  
Multi-expert consultation for technical decisions before implementation.

实现前技术决策的多专家咨询。

### ⚡ Implementation | 实现 → `/requirements-pilot` (recommended) or `/code`
Automated pipeline or direct implementation based on complexity.

基于复杂性的自动化流水线或直接实现。

### 🧪 Testing | 测试 → `/test` 
Smart testing strategies with proportional coverage.

具有比例覆盖的智能测试策略。

### 🔍 Quality Assurance | 质量保证 → `/review`
Multi-dimensional code review with 90+ quality threshold.

具有90+质量阈值的多维代码审查。

### 🐛 Problem Resolution | 问题解决 → `/debug`
UltraThink systematic debugging with user confirmation gates.

具有用户确认门控的UltraThink系统性调试。

### 🚀 Release Preparation | 发布准备 → `/release-check`
Production readiness verification with clear go/no-go decisions.

具有明确通过/不通过决策的生产就绪性验证。

## File Structure Conventions | 文件结构约定

### Specifications Directory | 规格文档目录
- `{project_root}/.claude/specs/{feature_name}/` - Created automatically for each feature
  `{项目根目录}/.claude/specs/{功能名称}/` - 为每个功能自动创建
- `requirements-confirm.md` - Requirements confirmation process and final requirements
  `requirements-confirm.md` - 需求确认流程和最终需求
- `requirements-spec.md` - Technical implementation specifications
  `requirements-spec.md` - 技术实现规格

## Core Principles | 核心原则

The system adheres to:

系统遵循以下原则：

- **KISS** (Keep It Simple, Stupid)
  **KISS** (保持简洁明了)
- **YAGNI** (You Ain't Gonna Need It)  
  **YAGNI** (你不会需要它)
- **SOLID** principles
  **SOLID** 原则
- **Quality Gate Automation | 质量门控自动化**: Objective standards over subjective judgment
  客观标准优于主观判断
- **Professional Specialization | 专业化分工**: Each tool focuses on one domain
  每个工具专注于一个领域
- **Lightweight Process | 轻量级流程**: Essential workflow steps without bureaucracy
  必要的工作流步骤，无官僚主义

Focus on pragmatic, working solutions with automated quality assurance.

专注于具有自动化质量保证的实用、可行解决方案。