# Claude Code 智能开发工作流系统

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue)](https://claude.ai/code)

> 精简高效的Claude Code工作流系统，让AI助手更懂你的开发需求

## 🎯 是什么？

一个为Claude Code优化的智能辅助系统，通过**15+核心命令**和**5个专业角色**，将复杂的开发任务转化为可信任的自动化工作流。

### 核心特性

- **🚀 四大工作流** - 覆盖从快速原型到企业级开发的全场景
- **🛠️ 精简命令集** - 15+个核心命令解决90%开发需求  
- **👥 专业角色** - 5个AI专家角色自动协作
- **🎛️ 智能路由** - 自动判断问题类型并调用合适工具
- **📊 质量门控** - 实用的自动化质量保证机制

## ⚡ 快速开始

### 安装

```bash
# 克隆到用户配置目录（推荐）
git clone https://github.com/ysicing/code-pilot.git ~/.claude

# 或克隆到项目目录
git clone https://github.com/ysicing/code-pilot.git .claude

# 使用示例配置
cd .claude
cp CLAUDE.md.example CLAUDE.md
```

### 一分钟上手

```bash
# 快速开发 - 适合日常功能开发
/requirements-pilot "实现用户注册登录功能"

# 规范驱动 - 适合复杂系统设计
/kiro "设计多租户SaaS系统架构"

# 企业级 - 适合团队协作项目
/bmad-pilot "构建微服务电商平台"

# 专业开发 - 适合精细化控制
/zcf-workflow "开发在线教育平台"
```

## 📋 四大核心工作流

| 工作流 | 适用场景 | 特点 |
|--------|----------|------|
| **Requirements-Pilot** | 日常开发、快速原型 | 端到端自动化、快速交付 |
| **Kiro** | 复杂功能、需要规范 | 结构化设计、完整文档 |
| **BMAD-Pilot** | 企业级项目 | AI团队协作、全流程覆盖 |
| **ZCF-Workflow** | 专业开发 | 六阶段流程、精细控制 |

## 🛠️ 核心命令

> 按我的使用频率排序

### 分析工具
- `/ask` - 架构咨询
- `/xplan` - 实施规划
- `/ultrathink` - 深度分析
- `/story-breakdown` - 功能分解

### 开发工具
- `/code` - 功能实现
- `/optimize` - 性能优化
- `/refactor` - 代码重构
- `/bugfix` - 缺陷修复
- `/debug` - 深度调试

### 质量保证
- `/review` - 代码审查
- `/test` - 测试策略

## 👥 专业角色

系统内置5个专业AI角色，自动根据问题类型协作：

- **architect** - 系统架构师
- **security** - 安全专家
- **performance** - 性能专家
- **frontend** - 前端专家
- **reviewer** - 代码审查专家

## 📚 文档

- **[GUIDE.md](./GUIDE.md)** - 完整使用指南和详细示例
- **[BMAD-README.md](./BMAD-README.md)** - BMAD企业级方法论详解
- **[CLAUDE.md.example](./CLAUDE.md.example)** - 配置文件示例

## 🎯 设计理念

- **KISS原则** - 保持简单，避免过度工程化
- **实用主义** - 解决实际问题优先于追求完美
- **智能化** - 让AI自动处理繁琐决策
- **质量平衡** - 实用的质量标准，不追求极致

## 📄 许可证

MIT License - 详见 [LICENSE](./LICENSE) 文件

## 🙏 致谢

本项目基于 [myclaude](https://github.com/cexll/myclaude) 进行优化增强，感谢原作者的开创性工作。

---

**更多详情请查看 [完整使用指南](./GUIDE.md)**
