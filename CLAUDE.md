# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Claude Code Multi-Agent Workflow System that provides a **lightweight meta-framework** for implementing automated expert development workflows. It transforms manual command chains into automated multi-agent processes with practical quality gates and specialized expertise.

**Core Philosophy**: Quality gate automation + Professional specialization + Lightweight process

## Architecture

### Core Components

The repository contains two main directories:

1. **`/commands/`** - 10 specialized slash commands for targeted development workflows
2. **`/agents/`** - 9 expert agent configurations for multi-agent orchestration

### Key Workflow Patterns

**Requirements-Driven Workflow** (Primary):
```
requirements-generate → requirements-code → requirements-review → (✅ Ready?) → smart-testing-decision
```

**Manual Command Workflow** (Secondary):
- `/ask` - Architecture consultation (no code changes)
- `/story-breakdown` - Requirements breakdown into implementable stories
- `/bugfix` - Bug resolution with systematic analysis
- `/code` - Feature implementation
- `/debug` - Systematic problem analysis
- `/optimize` - Performance optimization  
- `/review` - Code quality assessment
- `/test` - Testing strategy
- `/release-check` - Production readiness verification
- `/requirements-pilot` - Main automated workflow

## Primary Commands

### `/requirements-pilot`
The main automated workflow command with intelligent adaptation:

**Usage**: 
```bash
/requirements-pilot <FEATURE_DESCRIPTION> [--test|--no-test]
```

**Core Features**:
- Interactive requirements confirmation with 100-point quality assessment
- User approval gate at 90+ quality score (mandatory stop point)
- 4-phase automated implementation: Requirements → Specs → Code → Testing
- Smart testing decisions with UI-aware strategies
- File structure management (.claude/specs/{feature_name}/)

### Core Manual Commands (10 total)

- `/ask <TECHNICAL_QUESTION>` - Senior Systems Architect with 4-expert consultation methodology
- `/story-breakdown <FEATURE_DESCRIPTION>` - Break complex features into implementable user stories
- `/bugfix <ERROR_DESCRIPTION>` - Bug resolution workflow with systematic analysis
- `/code <FEATURE_DESCRIPTION>` - Direct feature implementation
- `/debug <TASK_DESCRIPTION>` - UltraThink Debug Orchestrator with 4-phase systematic analysis
- `/optimize <PERFORMANCE_TARGET>` - Performance optimization
- `/review <CODE_SCOPE>` - Multi-dimensional review (Quality, Security, Performance, Architecture)
- `/test <COMPONENT_OR_FEATURE>` - Testing strategy and implementation
- `/release-check <COMPONENT_OR_SYSTEM>` - Production readiness verification with go/no-go decision
- `/requirements-pilot <FEATURE_DESCRIPTION>` - Main automated workflow with intelligent testing

## Agent Architecture

### Requirements Workflow Agents
- **requirements-generate**: Code-generation-optimized technical specifications with direct implementation mapping
- **requirements-code**: Direct implementation with minimal architectural overhead  
- **requirements-review**: Pragmatic review focusing on functionality over architectural perfection (3-level scoring)
- **requirements-testing**: Smart testing with proportional coverage and UI-aware strategies to prevent over-testing

### Specialized Agents
- **bugfix**: Bug resolution specialist for systematic defect analysis and fixing
- **bugfix-verify**: Independent fix validation and objective assessment
- **code**: Development coordinator directing coding specialists
- **debug**: UltraThink debug orchestrator for systematic problem analysis with multi-agent coordination
- **optimize**: Performance optimization coordinator

## Quality Gate System

### Lightweight Quality Standards
- **Requirements Clarity**: 90+ points before implementation starts
- **Code Quality**: 90+ points before testing phase
- **Production Readiness**: Clear go/no-go decision for releases

### Smart Testing Logic
- **UI-Only Changes**: Lint checks only
- **Minor Changes (1-5 lines)**: Proportional testing
- **Business Logic**: Comprehensive testing
- **Complex Features**: Full test pyramid approach

## Workflow Guidelines

### Multi-Agent Coordination
- Each agent operates in isolated contexts to prevent quality degradation
- Automatic quality gates determine workflow progression  
- 90% threshold for most quality gates
- Iterative improvement loops when quality thresholds not met

### Intelligent Review and Testing Logic

**Smart Testing Decision Logic**:
- **Default**: Ask "Code complete. Run tests? (y/n)" after review passes
- **--test**: Automatically run tests after successful review
- **--no-test**: Skip testing entirely
- **Smart Detection**: Proportional testing based on change complexity and type

**Testing Optimization Features**:
- **UI-Aware Strategy**: Lint-only approach for pure UI changes (colors, layouts, text)
- **Change-Proportional Testing**: 1-5 lines = lint check only, no over-testing
- **Component Type Recognition**: Different strategies for frontend UI vs backend logic
- **Risk-Based Coverage**: Focus testing on business-critical functionality only

### Implementation-First Approach
- Direct technical specifications optimized for code generation
- Minimal architectural abstractions
- Single document strategy for specifications
- Concrete implementation details over theoretical design

## Stage-Based Tool Usage

### 📋 Requirements Analysis → `/story-breakdown`
Break complex features into implementable user stories with clear acceptance criteria.

### 🏛️ Architecture Design → `/ask`  
Multi-expert consultation for technical decisions before implementation.

### ⚡ Implementation → `/requirements-pilot` (recommended) or `/code`
Automated pipeline or direct implementation based on complexity.

### 🧪 Testing → `/test` 
Smart testing strategies with proportional coverage.

### 🔍 Quality Assurance → `/review`
Multi-dimensional code review with 90+ quality threshold.

### 🐛 Problem Resolution → `/debug`
UltraThink systematic debugging with user confirmation gates.

### 🚀 Release Preparation → `/release-check`
Production readiness verification with clear go/no-go decisions.

## File Structure Conventions

### Specifications Directory
- `{project_root}/.claude/specs/{feature_name}/` - Created automatically for each feature
- `requirements-confirm.md` - Requirements confirmation process and final requirements
- `requirements-spec.md` - Technical implementation specifications

## Core Principles

The system adheres to:
- **KISS** (Keep It Simple, Stupid)
- **YAGNI** (You Ain't Gonna Need It)  
- **SOLID** principles
- **Quality Gate Automation**: Objective standards over subjective judgment
- **Professional Specialization**: Each tool focuses on one domain
- **Lightweight Process**: Essential workflow steps without bureaucracy

Focus on pragmatic, working solutions with automated quality assurance.