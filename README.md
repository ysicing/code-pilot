# Claude Code Multi-Agent Workflow System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue)](https://claude.ai/code)

> Transform your development workflow from manual command chains to automated expert teams with **lightweight quality gates** and **professional specialization**.

## 🎯 Core Philosophy

**Quality Gate Automation + Professional Specialization + Lightweight Process**

This repository provides a **lightweight meta-framework for Claude Code** that implements:

- **🎛️ Quality Gate Automation**: Objective 90% standards replace subjective judgment
- **🧠 Professional Specialization**: Each tool focuses on one domain (avoid "万能AI")  
- **⚡ Lightweight Process**: Essential workflow steps without bureaucracy
- **📊 Context Isolation**: Each agent maintains focused expertise without pollution
- **🎯 Smart Testing**: Proportional testing with UI-aware strategies to prevent over-testing

## 🚀 From Manual Chaos to Automated Quality

**Before**: Manual command chains requiring constant oversight
```bash
/ask → /code → /test → /bugfix → /optimize
# 1-2 hours of manual orchestration, subjective quality judgment
```

**After**: One-command automated expert workflows with objective quality gates
```bash
/requirements-pilot "Implement JWT user authentication system"
# 30 minutes of automated execution, 90% quality gates, smart testing decisions
```

## 📋 Two Primary Usage Patterns

### 1. 🏭 Requirements-Driven Workflow (Automated Expert Teams)

**Architecture**: Requirements-focused workflow with quality gates and smart testing
```
requirements-generate → requirements-code → requirements-review → (✅ Ready?) → smart-testing-decision
         ↑                                              ↓ (⚠️ Needs Improvement)
         ←←←←←← Automatic optimization loop ←←←←←←
```

**Usage**:
```bash
# Complete development workflow in one command
/requirements-pilot "Build user management system with RBAC"

# Advanced workflow with intelligent testing
First use requirements-generate, then requirements-code, then requirements-review, 
then if Ready ask user: "Code complete. Run tests? (y/n/lint)"
```

### 2. 🎛️ Stage-Based Development (Manual Orchestration)

**Architecture**: Stage-specific tools for targeted expertise

#### **📋 Stage 1: Requirements Analysis**
```bash
/story-breakdown     # Transform complex features into implementable user stories
                     # - 1-3 day completion estimates
                     # - Clear acceptance criteria  
                     # - Implementation priority order
                     # - Dependency mapping
```

#### **🏛️ Stage 2: Architecture Design**  
```bash
/ask                # Senior Systems Architect consultation
                    # - Multi-expert consultation (4 specialists)
                    # - UltraThink methodology for comprehensive analysis
                    # - Strategic technology guidance with trade-off analysis
                    # - Pure architectural guidance, no code changes
```

#### **⚡ Stage 3: Implementation**
```bash
/requirements-pilot # Complete automated pipeline (recommended)
                    # - 100-point quality assessment with user approval gate
                    # - Smart testing decisions (--test/--no-test)
                    # - File structure management (.claude/specs/)

/code               # Direct feature implementation
                    # - For simple features or specific components
```

#### **🔍 Stage 4: Quality Assurance**
```bash
/review             # Multi-dimensional code review
                    # - 4 specialist reviewers (Quality, Security, Performance, Architecture)
                    # - 3-level scoring: ✅ Ready / ⚠️ Needs Improvement / ❌ Major Issues
                    # - Pragmatic focus on functionality over perfection
```

#### **🧪 Stage 5: Testing**
```bash
/test               # Smart testing strategies
                    # - UI changes: Lint-only approach
                    # - Minor changes (1-5 lines): Proportional testing
                    # - Business logic: Comprehensive testing
```

#### **🐛 Stage 6: Problem Resolution**
```bash
/debug              # UltraThink Debug Orchestrator
                    # - 4-phase systematic debugging
                    # - Hypothesis refinement (5-7 → 1-2 solutions)
                    # - User confirmation gate before fixes
                    # - Evidence-based diagnostic strategy
```

#### **🚀 Stage 7: Release Preparation**
```bash
/release-check      # Production readiness verification
                    # - Risk-based go/no-go decisions
                    # - Practical checklist approach
                    # - Clear mitigation plans for issues
```

## 🔧 **Flexible Usage Patterns**

### Pattern 1: Complete Automation (New Features)
```bash
# Single command handles entire workflow
/requirements-pilot "JWT authentication with refresh tokens" --test
# → Requirements(90+) → User approval → Code → Review(90+) → Testing
```

### Pattern 2: Step-by-Step Control (Complex Features)  
```bash
/story-breakdown "E-commerce checkout flow"  # Break into stories
/ask "Microservices vs monolith for checkout"  # Architecture guidance
/requirements-pilot "Payment processing story 1"  # Implement story by story
/review "Validate payment security"  # Quality gates
/release-check "Payment system"  # Production readiness
```

### Pattern 3: Problem-Driven (Bug Fixes)
```bash
/debug "Production API timeout issues"  # Systematic diagnosis
/code "Implement connection pooling fix"  # Direct fix implementation  
/release-check "Updated API service"  # Verify production readiness
```

### Pattern 4: Quality-First (Critical Systems)
```bash
/story-breakdown "Financial transaction system"
/ask "Security architecture for financial data"
/requirements-pilot "Core transaction logic" --test
/review "Security and performance validation"  
/release-check "Financial system components"
```

## 🚀 Quick Start

### Step 1: User-Level Setup (Recommended)

**Option A: User-Level Global Configuration (Recommended)**
```bash
# Navigate to your home directory
cd ~

# Backup existing .claude directory if it exists
if [ -d ".claude" ]; then
  mv .claude .claude-old
  echo "Existing .claude backed up to .claude-old"
fi

# Clone this repository as your new .claude configuration
git clone https://github.com/ysicing/code-pilot.git .claude
cd .claude

# If you had an existing configuration, copy non-agent/command files
if [ -d "../.claude-old" ]; then
  # Copy everything except agents and commands directories
  find ../.claude-old -maxdepth 1 -type f -exec cp {} . \;
  
  # Copy any custom subdirectories (excluding agents and commands)
  for dir in ../.claude-old/*/; do
    dirname=$(basename "$dir")
    if [ "$dirname" != "agents" ] && [ "$dirname" != "commands" ]; then
      cp -r "$dir" ./
    fi
  done
  
  echo "Previous configuration merged (excluding agents and commands)"
fi
```

**Option B: Project-Specific Setup**
```bash
# Navigate to your project directory
cd /path/to/your/project

# Backup existing .claude directory if it exists
if [ -d ".claude" ]; then
  mv .claude .claude-old
fi

# Clone this repository as your project's .claude configuration
git clone https://github.com/ysicing/code-pilot.git .claude

# If you had existing project-specific configuration
if [ -d ".claude-old" ]; then
  # Copy non-agent/command files from old configuration
  find .claude-old -maxdepth 1 -type f -exec cp {} .claude/ \;
  
  # Copy custom subdirectories (excluding agents and commands)
  for dir in .claude-old/*/; do
    dirname=$(basename "$dir")
    if [ "$dirname" != "agents" ] && [ "$dirname" != "commands" ]; then
      cp -r "$dir" .claude/
    fi
  done
fi
```

### Step 2: Verify Claude Code Installation
```bash
# Make sure you have Claude Code installed
npm install -g @anthropic-ai/claude-code
# or check if already installed
claude --version
```

### Step 3: Your First Automated Workflow

**Option A: Complete Automation (Recommended for New Features)**
```bash
# Navigate to your project directory
cd /path/to/your/project

# One command handles everything - requirements, implementation, review, testing
/requirements-pilot "Create REST API for user authentication with JWT tokens"

# Advanced usage with testing control
/requirements-pilot "Build e-commerce cart system" --test
/requirements-pilot "Add UI theme switcher" --no-test  # UI-only changes
```

**Option B: Step-by-Step Control (For Complex Features)**
```bash
# Requirements analysis first
/story-breakdown "User management system with RBAC permissions"

# Architecture consultation
/ask "Best practices for role-based access control in microservices"

# Implementation with quality gates
/requirements-pilot "User registration story" --test

# Production readiness
/release-check "User management components"
```

### Step 4: Understanding the File Structure

After setup, your project will have:
```bash
your-project/
├── .claude/
│   ├── commands/          # 10 specialized slash commands
│   │   ├── ask.md
│   │   ├── bugfix.md
│   │   ├── code.md
│   │   ├── debug.md
│   │   ├── optimize.md
│   │   ├── release-check.md
│   │   ├── requirements-pilot.md
│   │   ├── review.md
│   │   ├── story-breakdown.md
│   │   └── test.md
│   ├── agents/           # 9 expert agent configurations
│   │   ├── bugfix.md
│   │   ├── bugfix-verify.md
│   │   ├── code.md
│   │   ├── debug.md
│   │   ├── optimize.md
│   │   ├── requirements-code.md
│   │   ├── requirements-generate.md
│   │   ├── requirements-review.md
│   │   └── requirements-testing.md
│   ├── CLAUDE.md         # System instructions for Claude Code
│   └── specs/            # Generated specifications (auto-created)
├── your-source-code/
└── other-project-files
```

### Step 5: Customization (Optional)

1. **Edit CLAUDE.md** to match your project specifics:
   ```bash
   # Open and customize the main configuration
   code .claude/CLAUDE.md
   ```

2. **Customize Commands** for your workflow:
   ```bash
   # Edit specific commands as needed
   code .claude/commands/requirements-pilot.md
   ```

3. **Adjust Agent Configurations** for your domain:
   ```bash
   # Modify agent behaviors
   code .claude/agents/requirements-generate.md
   ```

## 🎯 Common Usage Patterns

### For Web Applications
```bash
# Frontend feature development
/requirements-pilot "Create responsive user dashboard with dark mode" --no-test

# Backend API development  
/requirements-pilot "Build REST API for user management" --test

# Full-stack feature
/story-breakdown "E-commerce shopping cart with checkout"
/requirements-pilot "Shopping cart frontend" --no-test
/requirements-pilot "Cart API backend" --test
/requirements-pilot "Payment integration" --test
```

### For Data Science Projects
```bash
# Data analysis workflow
/ask "Best practices for data pipeline architecture"
/code "Implement data preprocessing pipeline"
/review "Data quality and performance validation"

# Model development
/requirements-pilot "Build ML model for user recommendation" --test
```

### For DevOps and Infrastructure
```bash
# Infrastructure as code
/requirements-pilot "Docker containerization setup" --test
/requirements-pilot "Kubernetes deployment configuration" --test

# CI/CD pipeline
/story-breakdown "Complete CI/CD pipeline with testing"
/requirements-pilot "GitHub Actions workflow" --test
```

## ⚠️ Troubleshooting

### Common Issues and Solutions

**Issue: Commands not working**
```bash
# Check if .claude directory exists in project root
ls -la .claude/

# Verify CLAUDE.md is properly configured
cat .claude/CLAUDE.md | head -20
```

**Issue: Quality gates failing**
```bash
# Commands might be failing quality checks
# Review the requirements specification:
cat .claude/specs/your-feature/requirements-spec.md

# Try breaking down the feature further:
/story-breakdown "Your complex feature description"
```

**Issue: Testing strategy not appropriate**
```bash
# For UI-only changes, use --no-test
/requirements-pilot "Update button colors" --no-test

# For business logic, always use --test
/requirements-pilot "User authentication logic" --test

# For uncertain cases, let the system decide
/requirements-pilot "Mixed UI and logic changes"
```

**Issue: Agent specialization not working**
```bash
# Check agent configurations
ls -la .claude/agents/
# Each agent should be specialized - avoid mixing concerns

# Use the right command for the task:
/ask "Architecture questions"  # Not /code
/code "Direct implementation"  # Not /ask
```

### Best Practices

1. **Start Simple**: Use `/requirements-pilot` for most new features
2. **Quality First**: Let quality gates (90% thresholds) guide progression
3. **Appropriate Testing**: Use `--test` for logic, `--no-test` for UI-only
4. **Break Down Complex Features**: Use `/story-breakdown` for large initiatives
5. **Architecture Before Implementation**: Use `/ask` for strategic decisions

## 🔧 Advanced Configuration

### Custom Project Setup

For teams or specific domains, customize the system:

1. **Project-Specific CLAUDE.md**:
   ```bash
   # Add your project's specific requirements
   echo "## Project-Specific Instructions" >> .claude/CLAUDE.md
   echo "- Use TypeScript for all new code" >> .claude/CLAUDE.md
   echo "- Follow our API naming conventions" >> .claude/CLAUDE.md
   ```

2. **Custom Commands**:
   ```bash
   # Create domain-specific commands
   cp .claude/commands/code.md .claude/commands/api-code.md
   # Edit api-code.md for API-specific development
   ```

3. **Team Workflows**:
   ```bash
   # Create team-specific workflows
   mkdir .claude/workflows/
   # Add team process documentation
   ```

## 📈 Performance Tips

1. **Use Complete Automation**: `/requirements-pilot` is more efficient than manual chains
2. **Appropriate Scope**: Keep features focused (1-3 day implementations)
3. **Quality Gates**: Trust the 90% thresholds - they prevent rework
4. **Smart Testing**: Let the system decide testing strategy based on change type

## 💡 **Key Innovations**

### 1. **Quality Gate Automation**
Replace subjective judgment with objective 90% scoring:
```python
# Traditional: "I think the code is ready"
if developer_subjective_opinion:
    proceed()

# This System: Objective quality measurement
if requirements_score >= 90 and code_quality >= 90:
    proceed()
else:
    optimize_and_retry()
```

### 2. **Professional Specialization**
Avoid "万能AI" by using domain experts:
```bash
❌ One AI does everything: requirements + coding + testing + deployment
✅ Expert team: Requirements expert + Code expert + Quality expert + Testing expert
```

### 3. **Smart Testing Prevention of Over-Testing**
Proportional testing based on change impact:
```bash
# UI color change (1 line) → Lint check only
# Business logic change (50 lines) → Full test suite
# New feature → Comprehensive testing with edge cases
```

## 📚 Workflow Examples

### Enterprise User Authentication System

**Step-by-Step Approach**:
```bash
# Requirements analysis
/story-breakdown "Enterprise SSO with LDAP integration"

# Architecture consultation  
/ask "LDAP integration patterns for high-availability systems"

# Implementation with quality gates
/requirements-pilot "Core authentication service" --test

# Production readiness verification
/release-check "Authentication system components"
```

**Results**:
- ✅ Implementable user stories with 1-3 day estimates
- ✅ Architecture guidance with risk/trade-off analysis
- ✅ Production-ready implementation with 90%+ quality score
- ✅ Smart testing strategy based on change complexity
- ✅ Clear go/no-go release decision

### API Gateway Development

**Complete Automation**:
```bash
/requirements-pilot "Microservices API gateway with rate limiting and circuit breakers" --test
```

**Results**:
- ✅ Requirements confirmed with 90+ quality score
- ✅ User approval gate before implementation
- ✅ Technical specifications optimized for code generation
- ✅ Multi-dimensional code review (Quality/Security/Performance)
- ✅ Smart testing based on component complexity

## 📋 Complete Command Reference

### 📋 Requirements & Planning
- `/story-breakdown` - Break features into implementable user stories
- `/requirements-pilot` - Complete automated requirements-driven pipeline

### 🏛️ Architecture & Consultation  
- `/ask` - Senior Systems Architect with 4-expert consultation methodology

### ⚡ Implementation & Development
- `/code` - Direct feature implementation with constraints

### 🔍 Quality Assurance
- `/review` - Multi-dimensional code review (Quality/Security/Performance/Architecture)
- `/test` - Smart testing strategies with proportional coverage

### 🐛 Problem Resolution
- `/debug` - UltraThink Debug Orchestrator with 4-phase systematic analysis
- `/bugfix` - Systematic bug fixing workflows

### 🚀 Operations & Deployment
- `/optimize` - Performance optimization coordination
- `/release-check` - Production readiness verification with go/no-go decisions

## 🏗️ Architecture Overview

### Core Components

#### **Commands Directory** (`/commands/`)
- **Requirements**: `/story-breakdown` - Feature breakdown into implementable stories
- **Consultation**: `/ask` - Senior Systems Architect with 4-expert consultation methodology
- **Implementation**: `/code` - Feature development with constraints  
- **Quality Assurance**: 
  - `/test` - Comprehensive testing strategy
  - `/debug` - UltraThink Debug Orchestrator with 4-phase systematic analysis
  - `/review` - Multi-dimensional review (Quality, Security, Performance, Architecture)
- **Bug Resolution**: `/bugfix` - Systematic bug fixing workflows
- **Optimization**: `/optimize` - Performance optimization coordination
- **Release**: `/release-check` - Production readiness verification with go/no-go decisions
- **Pipeline**: `/requirements-pilot` - Complete pipeline with quality gates and approval workflow

#### **Agents Directory** (`/agents/`)
- **requirements-generate**: Code-generation-optimized technical specifications with direct implementation mapping
- **requirements-code**: Direct implementation agent with minimal architectural overhead
- **requirements-review**: Pragmatic review focusing on functionality over architectural perfection (3-level scoring)
- **requirements-testing**: Smart testing with proportional coverage and UI-aware strategies
- **bugfix**: Bug resolution specialist for analyzing and fixing software defects
- **bugfix-verify**: Fix validation specialist for objective assessment
- **code**: Development coordinator for direct implementation
- **debug**: UltraThink systematic problem analysis with multi-agent coordination
- **optimize**: Performance optimization coordination

### Multi-Agent Coordination System

**4 Core Specialists**:
1. **Requirements Generator** - Implementation-ready technical specifications
2. **Code Implementer** - Direct code generation with pragmatic focus
3. **Quality Reviewer** - 90% threshold validation with 3-level scoring
4. **Smart Testing Agent** - Proportional testing with UI-awareness and over-testing prevention

**Key Features**:
- **Quality Gate Automation**: Objective 90% standards for progression decisions
- **Professional Specialization**: Each agent works in separate contexts for expertise focus
- **Smart Testing**: UI-aware strategies prevent over-testing while maintaining quality
- **Lightweight Process**: Essential steps without bureaucracy
- **Practical Focus**: Working solutions over architectural perfection

## 🤝 Contributing

This is a Claude Code configuration framework focused on **lightweight quality gates**. Contributions welcome:

1. **New Stage Commands**: Additional development phase coverage
2. **Quality Gate Enhancements**: Better objective measurement criteria  
3. **Smart Testing Rules**: More sophisticated testing decision algorithms
4. **Workflow Patterns**: New automation sequences for specific domains

## 📄 License

MIT License - Use this framework to enhance your Claude Code workflows with automated quality gates and professional specialization.

## 🙏 Acknowledgments

This project is a secondary iteration based on [myclaude](https://github.com/cexll/myclaude) with significant enhancements and innovations. We extend our heartfelt gratitude to:

- **@cexll** for creating the foundational myclaude project that inspired this work
- **Claude (Anthropic)** for providing exceptional AI assistance and support throughout the development process
- The Claude Code community for their valuable feedback and contributions

Special thanks to the continuous collaboration with Claude, which made the sophisticated multi-agent workflow system and quality gate automation possible.
