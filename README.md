# Claude Code Multi-Agent Workflow System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue)](https://claude.ai/code)

> Transform your development workflow from manual command chains to automated expert teams with 95% quality assurance.

## 🚀 From Manual Commands to Automated Workflows

**Before**: Manual command chains requiring constant oversight
```bash
/ask → /code → /test → /review → /optimize
# 1-2 hours of manual orchestration, context pollution, quality uncertainty
```

**After**: One-command automated expert workflows
```bash
/requirements-pilot "Implement JWT user authentication system"
# 30 minutes of automated execution, 90% quality gates, zero manual intervention
```

## 🎯 Core Value Proposition

This repository provides a **meta-framework for Claude Code** that implements:

- **🤖 Multi-Agent Orchestration**: Specialized AI teams working in parallel
- **⚡ Quality Gate Automation**: 95% threshold with automatic optimization loops  
- **🔄 Workflow Automation**: From requirements to production-ready code
- **📊 Context Isolation**: Each agent maintains focused expertise without pollution

## 📋 Two Primary Usage Patterns

### 1. 🏭 Requirements-Driven Workflow (Automated Expert Teams)

**Architecture**: Requirements-focused workflow with quality gates
```
requirements-generate → requirements-code → requirements-review → (≥90%?) → requirements-testing
         ↑                                              ↓ (<90%)
         ←←←←←← Automatic optimization loop ←←←←←←
```

**Usage**:
```bash
# Complete development workflow in one command
/requirements-pilot "Build user management system with RBAC"

# Advanced multi-stage workflow
First use requirements-generate, then requirements-code, then requirements-review, 
then if score ≥90% use requirements-testing
```

**Quality Scoring** (Total 100%):
- Functionality (40%)
- Integration (25%) 
- Code Quality (20%)
- Performance (15%)

### 2. 🎛️ Custom Commands (Manual Orchestration)

**Architecture**: Individual slash commands for targeted expertise
```bash
/ask     # Technical consultation and architecture guidance
/code    # Feature implementation with constraints
/debug   # Systematic problem analysis using UltraThink
/test    # Comprehensive testing strategy
/review  # Multi-dimensional code validation
/optimize # Performance optimization coordination
/bugfix  # Bug resolution workflows
/refactor # Code refactoring coordination
/docs    # Documentation generation
/think   # Advanced thinking and analysis
```

**Progression Example**:
```bash
# Step-by-step development with manual control
/ask "Help me understand microservices architecture requirements"
/code "Implement gateway with rate limiting"
/test "Create load testing suite"
/review "Validate security and performance"
/optimize "Enhance performance for production"
```

## 🚀 Quick Start

### 1. Setup Configuration

Clone or copy the configuration structure:
```bash
# Your project directory
├── commands/          # 11 specialized slash commands
├── agents/           # 9 expert agent configurations  
└── CLAUDE.md         # Project-specific guidelines
```

### 2. Basic Usage

**Complete Feature Development**:
```bash
/requirements-pilot "Implement OAuth2 authentication with refresh tokens"
```

**BMAD Pilot (product → architecture → sprint → dev → QA with approval gates)**:
```bash
/bmad-pilot "Add Kanban module with role-based permissions and mobile support"
# Options: --skip-tests | --direct-dev | --skip-scan
```

**Manual Development Flow**:
```bash
/ask "Design principles for scalable microservices"
/code "Implement OAuth2 with security best practices"
/test "Create comprehensive test suite"
/review "Validate implementation quality"
```

### 3. Expected Outputs

**Automated Workflow Results**:
- ✅ Requirements confirmation with 90+ quality score
- ✅ Implementation-ready technical specifications
- ✅ Production-ready code with best practices
- ✅ Comprehensive test suite (unit + integration + functional)
- ✅ 90%+ quality validation score

## 🏗️ Architecture Overview

### Core Components

#### **Commands Directory** (`/commands/`)
- **Consultation**: `/ask` - Architecture guidance (no code changes)
- **Implementation**: `/code` - Feature development with constraints
- **Quality Assurance**: `/test`, `/review`, `/debug`
- **Optimization**: `/optimize`, `/refactor`
- **Bug Resolution**: `/bugfix` - Systematic bug fixing workflows
- **Documentation**: `/docs` - Documentation generation
- **Analysis**: `/think` - Advanced thinking and analysis
- **Requirements**: `/requirements-pilot` - Complete requirements-driven workflow
- **BMAD Pilot**: `/bmad-pilot` - Multi-agent, quality-gated workflow (PO → Architect → SM → Dev → QA)

#### **Agents Directory** (`/agents/`)
- **requirements-generate**: Technical specification generation optimized for code generation
- **requirements-code**: Direct implementation agent with minimal architectural overhead
- **requirements-review**: Pragmatic code review focused on functionality and maintainability
- **requirements-testing**: Practical testing agent focused on functional validation
- **bugfix**: Bug resolution specialist for analyzing and fixing software defects
- **bugfix-verify**: Fix validation specialist for objective assessment
- **code**: Development coordinator for direct implementation
- **debug**: UltraThink systematic problem analysis
- **optimize**: Performance optimization coordination

### Multi-Agent Coordination System

**4 Core Specialists**:
1. **Requirements Generator** - Implementation-ready technical specifications
2. **Code Implementer** - Direct, pragmatic code implementation 
3. **Quality Reviewer** - Practical quality review with scoring
4. **Test Coordinator** - Functional validation and testing

**Key Features**:
- **Implementation-First Approach**: Direct technical specs for code generation
- **Quality Gates**: 90% threshold for automatic progression
- **Iterative Improvement**: Automatic optimization loops
- **Practical Focus**: Working solutions over architectural perfection

## 📚 Workflow Examples

### Enterprise User Authentication System

**Input**:
```bash
/requirements-pilot "Enterprise JWT authentication with RBAC, supporting 500 concurrent users, integrated with existing LDAP"
```

**Automated Process**:
1. **Requirements Confirmation** (Quality: 92/100) - Interactive clarification
   - Functional clarity, technical specificity, implementation completeness
   - **Decision**: ≥90%, proceed with implementation

2. **Round 1** (Quality: 83/100) - Basic implementation
   - Issues: Error handling incomplete, integration concerns
   - **Decision**: <90%, restart with improvements

3. **Round 2** (Quality: 93/100) - Production ready
   - **Decision**: ≥90%, proceed to functional testing

**Final Deliverables**:
- Requirements confirmation with quality assessment
- Implementation-ready technical specifications
- Pragmatic JWT implementation with RBAC
- LDAP integration with proper error handling
- Functional test suite focusing on critical paths

### API Gateway Development

**Input**:
```bash
/ask "Design considerations for high-performance API gateway"
# (Interactive consultation phase)

/code "Implement microservices API gateway with rate limiting and circuit breakers"
# (Implementation phase)

/test "Create comprehensive test suite for gateway"
# (Testing phase)
```

**Results**:
- Architectural consultation on performance patterns
- Detailed specifications with load balancing strategy
- Production-ready implementation with monitoring

## 🔧 Advanced Usage Patterns

### Custom Workflow Composition

```bash
# Debug → Fix → Validate workflow
First use debug to analyze [performance issue], 
then use code to implement fixes, 
then use review to ensure quality

# Complete development + optimization pipeline  
First use requirements-pilot for [feature development],
then use review for quality validation,
then if score ≥95% use test for comprehensive testing,
finally use optimize for production readiness
```

### Quality-Driven Development

```bash
# Iterative quality improvement
First use review to score [existing code],
then if score <95% use code to improve based on feedback,
repeat until quality threshold achieved
```

## 🎯 Benefits & Impact

| Dimension | Manual Commands | Sub-Agent Workflows |
|-----------|----------------|-------------------|
| **Complexity** | Manual trigger for each step | One-command full pipeline |
| **Quality** | Subjective assessment | 90% objective scoring |
| **Context** | Pollution, requires /clear | Isolated, no pollution |
| **Expertise** | AI role switching | Focused specialists |
| **Error Handling** | Manual discovery/fix | Automatic optimization |
| **Time Investment** | 1-2 hours manual work | 30 minutes automated |

## 🔮 Key Innovations

### 1. **Specialist Depth Over Generalist Breadth**
Each agent focuses on their domain expertise in independent contexts, avoiding the quality degradation of role-switching.

### 2. **Intelligent Quality Gates**  
90% objective scoring with automatic decision-making for workflow progression or optimization loops.

### 3. **Complete Automation**
One command triggers end-to-end development workflow with minimal human intervention.

### 4. **Continuous Improvement**
Quality feedback drives automatic specification refinement, creating intelligent improvement cycles.

## 🛠️ Configuration

### Setting Up Sub-Agents

1. **Create Agent Configurations**: Copy agent files to your Claude Code configuration
2. **Configure Commands**: Set up workflow trigger commands
3. **Customize Quality Gates**: Adjust scoring thresholds if needed

### Workflow Customization

```bash
# Custom workflow with specific quality requirements
First use requirements-pilot with [strict security requirements and performance constraints],
then use review to validate with [90% minimum threshold],
continue optimization until threshold met
```

## 📖 Command Reference

### Requirements Workflow
- `/requirements-pilot` - Complete requirements-driven development workflow
- Interactive requirements confirmation → technical specifications → implementation → testing

### Development Commands  
- `/ask` - Architecture consultation (no code changes)
- `/code` - Feature implementation with constraints
- `/debug` - Systematic problem analysis
- `/test` - Comprehensive testing strategy
- `/review` - Multi-dimensional code validation

### Optimization Commands
- `/optimize` - Performance optimization coordination
- `/refactor` - Code refactoring with quality gates

### Additional Commands
- `/bugfix` - Bug resolution workflows
- `/docs` - Documentation generation
- `/think` - Advanced thinking and analysis

## 🤝 Contributing

This is a Claude Code configuration framework. Contributions welcome:

1. **New Agent Configurations**: Specialized experts for specific domains
2. **Workflow Patterns**: New automation sequences  
3. **Quality Metrics**: Enhanced scoring dimensions
4. **Command Extensions**: Additional development phase coverage

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙋 Support

- **Documentation**: Check `/commands/` and `/agents/` for detailed specifications
- **Issues**: Use GitHub issues for bug reports and feature requests
- **Discussions**: Share workflow patterns and customizations

---

## 🎉 Getting Started

Ready to transform your development workflow? Start with:

```bash
/requirements-pilot "Your first feature description here"
```

Watch as your one-line request becomes a complete, tested, production-ready implementation with 90% quality assurance.

**Remember**: Professional software comes from professional processes. Requirements-driven workflows give you a tireless, always-expert virtual development team.

*Let specialized AI do specialized work - development becomes elegant and efficient.*
### BMAD Pilot: Product → Architecture → Sprint → Dev → QA

**Input**:
```bash
/bmad-pilot "Enterprise-grade user management with RBAC and audit logs"
```

**Phases**:
- PO: Interactive PRD with ≥90 score and approval
- Architect: Technical design with ≥90 score and approval
- SM: Sprint plan (or skip with --direct-dev)
- Dev: Implementation based on documents
- QA: Tests based on documents and implementation (skip with --skip-tests)

**Artifacts** (saved per feature):
```
.claude/specs/{feature_name}/
  00-repo-scan.md
  01-product-requirements.md
  02-system-architecture.md
  03-sprint-plan.md
```
