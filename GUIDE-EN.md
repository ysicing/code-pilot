# Claude Code Agent Quick Start Guide

> Master core features in 5 minutes. For detailed manual, see [USER-MANUAL.md](./USER-MANUAL.md)

## ⚡ 1-Minute Quick Start

### Your First Command
```bash
# Complete requirements-to-code workflow in one command (recommended priority)
/requirements-pilot "Implement user registration with email verification"

# Or use BMAD AI Team complete development pipeline
/bmad-pilot "Implement user registration with email verification"

# Or use Kiro Smart Development Assistant (recommended for complex projects)
/kiro I need to implement user registration with email verification
```

The system automatically:
1. Analyzes requirements and generates tech specs (90+ points to continue)
2. Seeks your confirmation
3. Implements code and conducts quality review
4. Intelligently decides whether to run tests

### Core Principles
- **Trust Quality Gates**: 90-point standard is proven
- **Start Simple**: When unsure which command to use, try `/ask` first
- **Step by Step**: Break complex features with `/story-breakdown`

## 🔥 Three Core Workflows (By Recommendation Priority)

### 1. ⚡ `/requirements-pilot` - Rapid Development Workflow (Recommended Priority)
**Use Cases**: Most feature development, rapid implementation, prototyping
**Core Advantages**: One-click automation, rapid iteration, quality gates, simple and direct
```bash
/requirements-pilot "feature description"        # Let system decide testing strategy
/requirements-pilot "feature description" --test  # Force include testing
/requirements-pilot "UI update" --no-test       # Pure UI doesn't need tests
```

### 2. 🎯 `/kiro` - Structured Development Workflow (Recommended for Complex Projects)
**Use Cases**: Multi-feature projects, long-term development, need state management
**Core Advantages**: Project state awareness, intelligent interruption recovery, phased implementation
```bash
/kiro I want to develop a shopping cart feature    # Smart routing to appropriate expert
/kiro:spec user-auth-system                       # Create complete specification
/kiro:design payment-module                       # Technical design
/kiro:task order-management                       # Task planning
/kiro:execute shopping-cart 1.1                   # Execute specific task
/kiro:vibe How to optimize database query performance? # Quick consultation
/kiro-status                                      # View project status
```

### 3. 🏢 `/bmad-pilot` - AI Team Collaboration Workflow (Enterprise-grade)
**Use Cases**: Enterprise projects, need multi-role collaboration, highest quality requirements
**Core Advantages**: Complete team simulation, interactive collaboration, comprehensive quality assurance
```bash
/bmad-pilot "feature description"                # Complete AI team collaborative development
/bmad-pilot "feature description" --test         # Team development with testing
/bmad-pilot "feature description" --direct-dev   # Skip Sprint planning, go direct to dev
/bmad-pilot "feature description" --skip-tests   # Skip testing phase
```

## 🎯 Workflow Selection Guide

### Mode 1: Rapid Development (Recommended Priority)
```bash
# Use Cases: Most feature development, quick prototypes, bug fixes
/requirements-pilot "the feature you want to implement"
```

### Mode 2: Structured Development
```bash
# Use Cases: Multi-feature projects, long-term development, learning new tech
/kiro "the feature you want to implement"
```

### Mode 3: Enterprise Collaboration
```bash
# Use Cases: Critical systems, complex projects, highest quality requirements
/bmad-pilot "the complex feature you want to implement"
```

### Mode 4: Step-by-Step Control  
```bash
# Complex features with step-by-step approach
/story-breakdown "complex feature"     # Step 1: Break down feature
/ask "tech selection question"         # Step 2: Architecture consultation
/kiro:spec "specific feature"          # Step 3: Create specification
/kiro:design "specific feature"        # Step 4: Technical design
/kiro:task "specific feature"          # Step 5: Task planning
/kiro:execute "feature-name" "task"    # Step 6: Step-by-step implementation
```

## 🛠️ Common Professional Tool Commands

### Core Development Commands
- `/ask` - Technical consultation, 4-expert methodology
- `/story-breakdown` - Complex feature breakdown
- `/bugfix` - Systematic error fixing, intelligent frontend repair detection
- `/code` - Direct feature implementation
- `/refactor` - Safe progressive refactoring with SOLID principle evaluation
- `/review` - Multi-dimensional code review
- `/test` - Smart testing strategies
- `/optimize` - Performance optimization expert
- `/release-check` - Production readiness verification
- `/debug` - UltraThink debug analysis

### Advanced Analysis Commands
- `/ultrathink` - **For Major Decisions**: MECE principle structured deep analysis
- `/multi-role` - Multi-expert parallel analysis
- `/role-debate` - Professional role deep debate and technical selection
- `/search-gemini` - Gemini web search for latest information

### macOS Exclusive Commands
- `/screenshot` - Smart screenshot analysis (supports --window, --full, --crop)

## ⚠️ Quick Troubleshooting

### Issue: Quality Gate Failure
**Symptom**: "Score XX/100, below 90-point standard"
**Solution**:
```bash
/story-breakdown "your feature"  # Break into more specific tasks first
```

### Issue: Don't Know Which Command to Use
**Solutions**:
- Most cases → `/requirements-pilot` (recommended priority)
- Multi-feature projects, long-term development → `/kiro`
- Complex features need team collaboration → `/bmad-pilot`
- Fix bugs → `/bugfix`  
- Technical consultation → `/ask`
- **Major decisions** → `/ultrathink` (architecture selection, technical strategy)
- Uncertain → Use `/ask` first

### Issue: Wrong Testing Strategy
**Solutions**:
```bash
# UI changes use --no-test
/requirements-pilot "Change button color to blue" --no-test

# Business logic use --test  
/requirements-pilot "Payment process" --test

# Uncertain let system decide (default)
/requirements-pilot "User registration optimization"
```

## 📚 Advanced Learning

For complete features and detailed examples, refer to:
- **[USER-MANUAL.md](./USER-MANUAL.md)** - Detailed user manual
- **[README.md](./README.md)** - Complete system documentation
- **[README-en.md](./README-en.md)** - English documentation
- **[BMAD-PILOT-GUIDE.md](./BMAD-PILOT-GUIDE.md)** - BMAD AI Team methodology guide
- **[KIRO-GUIDE.md](./KIRO-GUIDE.md)** - Kiro development assistant complete guide

---

## 🎯 Core Memory Points

1. **Most cases**: Use `/requirements-pilot` for rapid development first
2. **Multi-feature projects**: Use `/kiro` for structured development
3. **Enterprise projects**: Use `/bmad-pilot` for team collaboration
4. **Fix bugs**: Use `/bugfix` directly  
5. **Major decisions**: Use `/ultrathink` for deep analysis
6. **Uncertain**: Use `/ask` for consultation first
7. **Too complex**: Use `/story-breakdown` to break down first
8. **Trust quality gates**: 90-point standard based on objective assessment
9. **State management**: Use `/kiro-status` to view project progress