# CLAUDE.md

## Language Configuration

**IMPORTANT**: Always respond and communicate in Chinese (中文) for all interactions, explanations, and communications with the user. This applies to:
- All responses and explanations
- Error messages and status updates
- Progress reports and task summaries
- Code comments when requested
- Documentation when created

The agent configurations and command prompts should remain in their original language to ensure proper functionality.

---

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Claude Code Multi-Agent Workflow System that provides a **lightweight meta-framework** for implementing automated expert development workflows. It transforms manual command chains into automated multi-agent processes with practical quality gates and specialized expertise.

**Core Philosophy**: Quality gate automation + Professional specialization + Lightweight process

## Architecture

### Core Components

The system provides:

1. **Commands** - 10 specialized commands (1 Primary + 9 Manual) for targeted development workflows
2. **Agents** - 9 expert agent configurations for multi-agent orchestration (4 Requirements Workflow + 5 Specialized)

### Key Workflow Patterns

**Requirements-Driven Workflow** (Primary):
```
requirements-generate → requirements-code → requirements-review → (✅ Ready?) → smart-testing-decision
```

## Commands Overview

### Primary Command: `/requirements-pilot`
The main automated workflow command with intelligent adaptation:

**Usage**: 
```bash
/requirements-pilot <FEATURE_DESCRIPTION> [--test|--no-test]
```

**Core Features**:
- Interactive requirements confirmation with 100-point quality assessment
- User approval gate at 90+ quality points (mandatory stop point)
- 4-phase automated implementation: Requirements → Specs → Code → Testing
- Smart testing decisions with UI-aware strategies
- File structure management (.claude/specs/{feature_name}/)

### Manual Commands (9 total)

- `/ask <TECHNICAL_QUESTION>` - Senior Systems Architect with 4-expert consultation methodology
- `/story-breakdown <FEATURE_DESCRIPTION>` - Break complex features into implementable user stories
- `/bugfix <ERROR_DESCRIPTION>` - Bug resolution workflow with systematic analysis
- `/code <FEATURE_DESCRIPTION>` - Direct feature implementation
- `/debug <TASK_DESCRIPTION>` - UltraThink Debug Orchestrator with 4-phase systematic analysis
- `/optimize <PERFORMANCE_TARGET>` - Performance optimization
- `/review <CODE_SCOPE>` - Multi-dimensional review (Quality, Security, Performance, Architecture)
- `/test <COMPONENT_OR_FEATURE>` - Testing strategy and implementation
- `/release-check <COMPONENT_OR_SYSTEM>` - Production readiness verification with go/no-go decision

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

### Quality Standards
- **Requirements Clarity**: 90+ points before implementation starts
- **Code Quality**: 90+ points before testing phase
- **Production Readiness**: Clear go/no-go decision for releases

## Workflow Guidelines

### Multi-Agent Coordination
- Each agent operates in isolated contexts to prevent quality degradation
- Automatic quality gates determine workflow progression  
- 90+ quality points threshold for most quality gates
- Iterative improvement loops when quality thresholds not met

### Smart Testing Strategy
- **UI-Only Changes**: Lint checks only for pure UI changes (colors, layouts, text)
- **Minor Changes (1-5 lines)**: Proportional testing with lint check only
- **Business Logic**: Comprehensive testing with risk-based coverage
- **Complex Features**: Full test pyramid approach

**Testing Decision Logic**:
- **Default**: Ask "Code complete. Run tests? (y/n)" after review passes
- **--test**: Automatically run tests after successful review
- **--no-test**: Skip testing entirely
- **Component Recognition**: Different strategies for frontend UI vs backend logic

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
Multi-dimensional code review with 90+ quality points threshold.

### 🐛 Problem Resolution → `/debug` or `/bugfix`
- `/debug`: UltraThink systematic debugging with user confirmation gates
- `/bugfix`: Bug resolution workflow with systematic analysis

### ⚡ Performance Optimization → `/optimize`
Performance optimization for specific targets and bottlenecks.

### 🚀 Release Preparation → `/release-check`
Production readiness verification with clear go/no-go decisions.

## File Structure Conventions

### Specifications Directory (for `/requirements-pilot` workflow)
- `.claude/specs/{feature_name}/` - Created automatically when using `/requirements-pilot`
- `requirements-confirm.md` - Requirements confirmation process and final requirements
- `requirements-spec.md` - Technical implementation specifications

**Note**: This directory structure is only created when using the `/requirements-pilot` automated workflow.

## Core Principles

The system adheres to:
- **KISS** (Keep It Simple, Stupid)
- **YAGNI** (You Ain't Gonna Need It)  
- **SOLID** principles
- **Quality Gate Automation**: Objective standards over subjective judgment
- **Professional Specialization**: Each tool focuses on one domain
- **Lightweight Process**: Essential workflow steps without bureaucracy

Focus on pragmatic, working solutions with automated quality assurance.

## Development Guidelines

### Content and Communication
- **File Priority**: Always prefer editing existing files over creating new files
- **Documentation**: Never proactively create documentation files unless explicitly requested
- **Verification**: Always verify information sources independently
- **Style**: Clear, concise communication with professional tone
- **Punctuation**: Use English punctuation in code, match document language for documentation
- **Emoji Usage**: Use sparingly for section navigation only (avoid in code and communication)

### Task Completion Criteria
A task is considered complete when the primary objectives are achieved. When full completion is not possible:

**Partial Execution Strategy**:
- Execute all feasible components first
- Clearly document remaining issues and blockers
- Provide specific next steps for resolution

**Alternative Solutions (when task cannot be executed)**:
- Offer at least 3 alternative approaches to achieve the same goal
- Explain trade-offs and recommendations for each alternative
- Suggest modified scope or requirements if needed

**Completion Prohibitions**:
NEVER consider a task complete if any of the following exist:
- Critical functionality is broken or non-functional
- Explicitly listed specific remaining work items in responses that affect core functionality

### Code Quality Standards
Following the "Keep It Simple" principle:
- **Avoid Over-Abstraction**: Keep implementations practical and direct
- **Single Responsibility**: Follow single responsibility principle
- **Code Reuse**: Eliminate duplicate code by extracting common functionality
- **Consistent Naming**: Apply uniform naming conventions
- **Error Handling**: Implement consistent error handling patterns
- **No Hard-Coding**: Use configuration or constants instead of hard-coded values

**Balance Principle**: Apply automation and abstraction only when it reduces complexity.

### Continuous Improvement
- Learn from code patterns and apply best practices consistently
- Incorporate user feedback into implementation approach
- Update practices based on project-specific requirements
