# Claude Code 智能体快速入门指南

> 本指南帮助你在5分钟内掌握核心功能。详细使用手册请参考 [user-manual.md](./user-manual.md)

## ⚡ 一分钟极速上手

### 第一条命令
```bash
# 这一条命令就能实现从需求到代码的完整流程
/requirements-pilot "实现用户注册功能，支持邮箱验证"

# 或者使用 BMAD AI团队完整开发流水线
/bmad-pilot "实现用户注册功能，支持邮箱验证"

# 或者使用新的 Kiro 智能开发助手（推荐用于复杂项目）
/kiro 我需要实现用户注册功能，支持邮箱验证

# 推荐优先使用 Requirements-Pilot（大多数情况）
/requirements-pilot "实现用户注册功能，支持邮箱验证"
```

系统会自动：
1. 分析需求并生成技术规格（90 分以上才继续）
2. 征求你的确认
3. 实现代码并进行质量审查
4. 智能决定是否需要测试

### 基本原则
- **信赖质量门控**：90 分标准是经过验证的
- **从简单开始**：不确定用什么命令时，先用 `/ask` 咨询
- **一步步来**：复杂功能先用 `/story-breakdown` 分解

## 🔥 三大核心工作流（按推荐程度排序）

### 1. ⚡ `/requirements-pilot` - 快速开发工作流（推荐优先使用）
**适用场景**：大多数功能开发、快速实现、原型开发
**核心优势**：一键自动化、快速迭代、质量门控、简单直接
```bash
/requirements-pilot "功能描述"        # 让系统智能决定测试策略
/requirements-pilot "功能描述" --test  # 强制包含测试
/requirements-pilot "UI更新" --no-test # 纯UI不需要测试
```

### 2. 🎯 `/kiro` - 结构化开发工作流（推荐用于复杂项目）
**适用场景**：多功能项目、长期开发、需要状态管理
**核心优势**：项目状态感知、智能中断恢复、分阶段实施
```bash
/kiro 我想开发一个购物车功能          # 智能路由到合适专家
/kiro:spec 用户认证系统              # 创建完整规范
/kiro:design 支付模块                # 技术设计
/kiro:task 订单管理                  # 任务规划
/kiro:execute shopping-cart 1.1      # 执行特定任务
/kiro:vibe 如何优化数据库查询性能？    # 快速咨询
/kiro-status                        # 查看项目状态
```

### 3. 🏢 `/bmad-pilot` - AI团队协作工作流（企业级专用）
**适用场景**：企业级项目、需要多角色协作、最高质量要求
**核心优势**：完整团队模拟、交互式协作、全面质量保证
```bash
/bmad-pilot "功能描述"                # 完整AI团队协作开发
/bmad-pilot "功能描述" --test         # 包含测试的团队开发
/bmad-pilot "功能描述" --direct-dev   # 跳过Sprint规划直接开发
/bmad-pilot "功能描述" --skip-tests   # 跳过测试阶段
```

### 5. `/ask` - 技术咨询
**使用场景**：不确定怎么做的时候
```bash
/ask "React vs Vue 选择建议"
/ask "微服务架构最佳实践"
```

### 6. `/bugfix` - 错误修复  
**使用场景**：系统有问题需要修复
```bash
/bugfix "用户登录后页面空白"
/bugfix "API响应时间过长"
```

### 7. `/story-breakdown` - 功能分解
**使用场景**：功能太复杂，需要拆分
```bash
/story-breakdown "完整的电商系统"
/story-breakdown "用户权限管理系统"
```

### 8. `/review` - 代码审查
**使用场景**：检查代码质量
```bash
/review "登录模块"
/review "整个用户管理系统"
```

## 🎯 工作流选择指南

### 模式1：快速开发（推荐优先）
```bash
# 适用场景：大多数功能开发、快速原型、Bug修复
/requirements-pilot "你想实现的功能"
```

### 模式2：结构化开发
```bash
# 适用场景：多功能项目、长期开发、学习新技术
/kiro "你想实现的功能"
```

### 模式3：企业级协作
```bash
# 适用场景：关键系统、复杂项目、最高质量要求
/bmad-pilot "你想实现的复杂功能"
```

### 模式4：分步控制  
```bash
# 复杂功能的step-by-step方式
/story-breakdown "复杂功能"     # 第一步：分解功能
/ask "技术选型问题"             # 第二步：咨询架构
/kiro:spec "具体功能"          # 第三步：创建规范
/kiro:design "具体功能"        # 第四步：技术设计
/kiro:task "具体功能"          # 第五步：任务规划
/kiro:execute "功能名" "任务"   # 第六步：逐步实现
```

## 🛠️ 专业工具命令

### 开发专用命令
```bash
/debug "任务描述"      # UltraThink 调试分析
/optimize "性能目标"   # 性能优化专家
/refactor "代码范围"   # 安全渐进式重构与SOLID原则评估
/test "组件或功能"     # 智能测试策略
/release-check "系统"  # 生产就绪验证
```

### macOS 专用：`/screenshot` 
智能截图分析（仅支持 macOS）
```bash
/screenshot --window  # 选择窗口
/screenshot --full    # 全屏截图  
/screenshot --crop    # 选择范围
```

### 高级分析命令
```bash
/ultrathink "复杂问题"  # MECE 原则结构化深度分析
/multi-role architect,security "分析目标"  # 多专家并行分析
/role-debate security vs performance "JWT vs Session认证"  # 专业角色深度辩论
/search-gemini "搜索查询"  # Gemini网络搜索获取最新信息
```

### BMAD 专业智能体
```bash
# 产品和业务分析
/bmad-po "需求描述"        # 产品负责人：需求分析、用户故事
/bmad-analyst "分析主题"   # 业务分析师：市场研究、竞争分析

# 技术架构和开发
/bmad-architect "系统设计需求"  # 系统架构师：技术架构、系统设计
/bmad-sm "冲刺规划需求"         # 敏捷教练：任务分解、冲刺规划
/bmad-dev "开发任务描述"        # 开发工程师：代码实现、技术文档
/bmad-qa "测试需求描述"         # 质量保证：测试策略、质量验证

# 主编排器
/bmad-orchestrator "复杂项目协调"  # 工作流协调、多智能体任务管理
```

## ⚠️ 快速故障排除

### 问题：质量门控失败
**现象**：提示"评分XX/100，未达到 90 分标准"
**解决**：
```bash
/story-breakdown "你的功能"  # 先分解为更具体的任务
```

### 问题：不知道用哪个命令
**解决方案**：
- 大多数情况 → `/requirements-pilot`（推荐优先）
- 多功能项目、长期开发 → `/kiro`
- 复杂功能需团队协作 → `/bmad-pilot`
- 修复bug → `/bugfix`  
- 技术咨询 → `/ask`
- **重大决策** → `/ultrathink`（架构选型、技术战略）
- 不确定 → 先用 `/ask` 问

### 问题：测试策略不对
**解决方案**：
```bash
# UI变更用 --no-test
/requirements-pilot "按钮颜色改为蓝色" --no-test

# 业务逻辑用 --test  
/requirements-pilot "支付流程" --test

# 不确定让系统判断（默认）
/requirements-pilot "用户注册优化"
```

## 📚 进阶学习

完整功能和详细案例请参考：
- **[user-manual.md](./user-manual.md)** - 详细使用手册
- **[README.md](./README.md)** - 完整系统说明
- **[README-en.md](./README-en.md)** - English documentation

---

## 🎯 核心记忆点

1. **大多数情况**：优先用 `/requirements-pilot` 快速开发
2. **多功能项目**：用 `/kiro` 结构化开发
3. **企业级项目**：用 `/bmad-pilot` 团队协作开发
4. **修bug**：直接用 `/bugfix`  
5. **重大决策**：用 `/ultrathink` 深度分析
6. **不确定**：先用 `/ask` 咨询
7. **太复杂**：先用 `/story-breakdown` 分解
8. **信赖质量门控**：90 分标准基于客观评估
9. **状态管理**：用 `/kiro-status` 查看项目进度
