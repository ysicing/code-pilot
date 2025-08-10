# Claude Code 多智能体工作流系统 - 新手使用手册

## 🎯 快速开始

### 什么是这个系统？

这是一个**Claude Code 增强配置框架**，将原本需要手动协调的开发任务转换为自动化的专家团队工作流。

**简单说**：不再需要你一步步指导AI完成复杂任务，而是直接说"我要实现XX功能"，系统自动调用专业智能体完成整个开发流程。

### 核心价值

- **🎛️ 质量门控自动化**：90%客观标准替代主观判断
- **🧠 专业化分工**：每个智能体专精一个领域
- **⚡ 一键式工作流**：从需求到代码到测试全自动
- **📊 智能测试决策**：根据变更复杂度自动选择测试策略

## 🚀 五分钟上手

### 第一步：安装配置

```bash
# 用户级配置（推荐）
cd ~
git clone https://github.com/ysicing/code-pilot.git .claude

# 或者项目级配置
cd your-project
git clone https://github.com/ysicing/code-pilot.git .claude

# 可选使用我提供的配置
cd .claude
cp CLAUDE.md.example CLAUDE.md
```

### 第二步：第一个自动化工作流

```bash
# 进入你的项目目录
cd your-project

# 一条命令完成：需求分析 → 代码实现 → 质量审查 → 测试
/requirements-pilot "实现用户注册API，支持邮箱验证"
```

**系统会自动：**
1. 生成详细技术规格（90分以上才继续）
2. 征求你的确认和修改意见
3. 实现代码并进行质量审查（90分以上才完成）
4. 智能决定是否需要测试

### 第三步：理解系统反馈

系统会给出类似这样的输出：
```
✅ 需求规格评分：92/100 - 已达到实现标准
⏸️  等待用户确认：是否开始实现？(y/n)
✅ 代码实现完成，质量评分：94/100
🤔 变更影响分析：建议运行测试 (运行测试？y/n)
```

## 📋 两种主要使用模式

### 模式1：完全自动化（适合新功能）

**什么时候用**：实现新功能、新特性
**特点**：一条命令解决所有问题

```bash
# 基础用法
/requirements-pilot "实现JWT用户认证"

# 强制测试
/requirements-pilot "支付处理功能" --test

# 跳过测试（仅UI改动）
/requirements-pilot "更新按钮样式" --no-test
```

### 模式2：分步控制（适合复杂项目）

**什么时候用**：大型功能、需要设计讨论的项目
**特点**：每个阶段可以精确控制

```bash
# 步骤1：功能分解
/story-breakdown "电商购物车系统"

# 步骤2：架构咨询
/ask "购物车数据存储的最佳实践"

# 步骤3：技术选型讨论
/role-debate security vs performance "Redis vs 数据库存储购物车"

# 步骤4：逐个实现
/requirements-pilot "购物车添加商品功能" --test

# 步骤5：质量检查
/review "验证购物车逻辑的正确性"

# 步骤6：发布准备
/release-check "购物车模块"
```

## 🛠️ 15个核心命令详解

### 📋 需求和规划类
```bash
/story-breakdown "复杂功能描述"
# 将大功能分解为1-3天完成的小任务
# 输出：用户故事、验收标准、优先级、依赖关系

/requirements-pilot "功能描述" [--test|--no-test]
# 完整自动化工作流：需求→代码→审查→测试
# 90分质量门控，用户确认机制
```

### 🏛️ 架构咨询类
```bash
/ask "技术问题"
# 4专家咨询团：架构师+安全专家+性能专家+质量专家
# 适合：技术选型、架构设计、最佳实践咨询

/role-debate "角色1 vs 角色2" "辩论主题"
# 技术选型深度辩论：展示不同观点，帮助决策
# 示例：/role-debate security vs performance "JWT vs Session认证"
```

### ⚡ 实现开发类
```bash
/code "具体功能描述"
# 直接代码实现，适合明确需求的功能开发
# 有一定约束，确保代码质量

/screenshot [--window|--full|--crop]
# macOS专用：智能截图分析
# UI评估、错误诊断、设计审查
```

### 🔍 质量保证类
```bash
/review "代码范围"
# 多维度代码审查：质量+安全+性能+架构
# 3级评分：✅就绪 / ⚠️需改进 / ❌重大问题

/test "组件或功能"
# 智能测试策略：
# - UI变更：仅Lint检查
# - 小变更：比例化测试
# - 业务逻辑：全面测试
```

### 🐛 问题解决类
```bash
/debug "问题描述"
# UltraThink调试协调器：4阶段系统化分析
# 假设收敛：从多个假设精炼到1-2个解决方案

/bugfix "错误描述"
# 系统化bug修复：分析→实现→验证
# 内置验证机制确保修复有效性
```

### 🚀 优化部署类
```bash
/optimize "性能目标"
# 性能优化协调：分析瓶颈→制定方案→实施优化
# 涵盖前端、后端、数据库、架构优化

/release-check "组件或系统"
# 生产就绪验证：风险评估→go/no-go决策
# 实用清单方法，确保发布质量
```

### 🧠 高级分析类
```bash
/ultrathink "复杂问题"
# MECE原则深度分析：结构化思考框架
# 适合复杂技术决策、架构选择

/multi-role "角色1,角色2" "分析目标"
# 多专家并行分析：不同专业角度的综合评估
# 示例：/multi-role security,performance --agent "API安全性评估"

/search-gemini "搜索查询"
# Gemini网络搜索：获取最新技术信息
# 用于技术调研、问题排查、最佳实践查询
```

## 🎯 常见使用场景

### 场景1：新功能开发
```bash
# 简单功能（推荐）
/requirements-pilot "用户头像上传功能"

# 复杂功能
/story-breakdown "用户权限管理系统"
/ask "RBAC权限设计最佳实践"
/requirements-pilot "用户角色管理" --test
/requirements-pilot "权限分配界面" --no-test
```

### 场景2：Bug修复
```bash
# 简单bug
/bugfix "登录页面在Safari浏览器下样式错乱"

# 复杂问题
/debug "生产环境API偶发超时，日志显示数据库连接池耗尽"
/code "实现数据库连接池监控和自动恢复"
/test "连接池异常场景测试"
```

### 场景3：性能优化
```bash
# 全面性能分析
/multi-role performance,architect "系统整体性能瓶颈分析"

# 具体优化实施
/optimize "将API响应时间从500ms优化到100ms以内"
/test "性能优化后的压力测试"
```

### 场景4：技术选型
```bash
# 架构咨询
/ask "微服务vs单体架构在当前项目的适用性"

# 深度辩论
/role-debate architect vs performance "微服务 vs 单体架构"

# 综合分析
/ultrathink "技术栈选择：考虑团队能力、项目需求、维护成本"
```

### 场景5：代码审查和重构
```bash
# 质量审查
/review "用户认证模块的安全性和代码质量"

# 重构实施
/code "重构用户认证模块，提高代码可读性"
/test "认证模块重构后的功能验证"
```

## ⚠️ 常见问题和解决方案

### 问题1：质量门控失败
**现象**：系统提示"需求规格评分78/100，未达到实现标准"

**解决方案**：
```bash
# 让系统自动优化需求
/story-breakdown "你的功能描述"  # 先分解为更具体的任务
/requirements-pilot "分解后的具体任务"  # 针对具体任务重新生成规格
```

### 问题2：不知道用哪个命令
**原则**：
- 不确定时：先用 `/ask` 咨询
- 实现新功能：用 `/requirements-pilot`
- 修复bug：用 `/bugfix`
- 技术选型有争议：用 `/role-debate`
- 复杂问题分析：用 `/ultrathink`

### 问题3：测试策略不合适
```bash
# UI只改样式，不需要测试
/requirements-pilot "更新按钮颜色为蓝色" --no-test

# 核心业务逻辑必须测试
/requirements-pilot "支付流程逻辑" --test

# 不确定时让系统判断（默认）
/requirements-pilot "用户注册表单优化"
```

### 问题4：输出太复杂
```bash
# 使用分步模式，每次只处理一个问题
/story-breakdown "复杂功能"  # 先分解
/ask "具体技术问题"  # 再咨询
/code "单一明确的功能"  # 最后实现
```

## 📈 进阶使用技巧

### 技巧1：链式命令使用
```bash
# 第一步：分析现状
/ask "当前系统的主要性能瓶颈"

# 第二步：制定方案（基于第一步结果）
/role-debate performance vs security "缓存策略vs数据一致性"

# 第三步：实现优化（基于辩论结论）
/requirements-pilot "实现Redis缓存层" --test

# 第四步：验证效果
/optimize "验证缓存实现的性能提升效果"
```

### 技巧2：多角色协作
```bash
# 安全+性能双重评估
/multi-role security,performance "API接口安全性和性能评估"

# 架构+前端+QA三方评估
/multi-role architect,frontend,qa --agent "用户界面重构方案评估"
```

### 技巧3：渐进式实现
```bash
# 第一阶段：基础功能
/requirements-pilot "用户登录基础功能" --test

# 第二阶段：安全增强
/requirements-pilot "添加多因素认证" --test

# 第三阶段：体验优化
/requirements-pilot "登录界面体验优化" --no-test
```

## 🎓 最佳实践

### 1. 功能描述要具体
```bash
❌ /requirements-pilot "改进用户体验"
✅ /requirements-pilot "实现用户头像上传，支持裁剪和压缩"

❌ /bugfix "系统有问题"  
✅ /bugfix "用户点击提交按钮后页面空白，控制台显示404错误"
```

### 2. 相信质量门控
```bash
# 当系统说评分不够时，不要强行继续
# 而是优化需求描述或分解任务
✅ 如果需求规格<90分，先用 /story-breakdown 分解
✅ 如果代码质量<90分，相信系统的改进建议
```

### 3. 合理使用测试选项
```bash
✅ 业务逻辑：--test
✅ UI样式调整：--no-test  
✅ 不确定时：不加参数，让系统智能判断
```

### 4. 善用专业角色辩论
```bash
# 当面临技术选择时
/role-debate security vs performance "技术选择主题"
# 比直接 /ask 更能看到不同观点的权衡
```

## 💡 成功案例参考

### 案例1：电商网站开发
```bash
# 1. 项目规划
/story-breakdown "电商网站：用户注册、商品展示、购物车、订单支付"

# 2. 架构设计
/ask "电商网站微服务架构设计最佳实践"

# 3. 分模块实现
/requirements-pilot "用户注册模块，支持邮箱验证" --test
/requirements-pilot "商品展示页面，支持分类筛选" --no-test  
/requirements-pilot "购物车功能，支持数量调整和删除" --test
/requirements-pilot "订单支付集成，对接支付网关" --test

# 4. 性能优化
/optimize "商品列表页加载速度优化到2秒以内"

# 5. 发布准备
/release-check "电商网站核心功能模块"
```

### 案例2：API服务重构
```bash
# 1. 现状分析
/ask "当前API架构的主要问题和改进方向"

# 2. 技术选型辩论
/role-debate architect vs performance "GraphQL vs REST API重构选择"

# 3. 重构实施
/requirements-pilot "重构用户API为RESTful设计" --test
/requirements-pilot "添加API版本控制和向后兼容" --test

# 4. 安全加固
/multi-role security,architect "API安全性全面评估和改进建议"

# 5. 性能验证
/test "API重构后的性能和功能测试"
```

## 🔧 自定义和扩展

### 项目特定配置
```bash
# 在项目的 .claude/CLAUDE.md 中添加项目特定指令
echo "## 项目特定要求" >> .claude/CLAUDE.md
echo "- 所有API必须包含OpenAPI文档" >> .claude/CLAUDE.md
echo "- 前端组件必须支持TypeScript" >> .claude/CLAUDE.md
```

### 创建自定义命令
```bash
# 复制现有命令并修改
cp .claude/commands/code.md .claude/commands/api-code.md
# 编辑 api-code.md 来定制API开发流程
```

---

## 🎯 总结

这个系统的核心价值是**将复杂的软件开发工作流自动化**：

1. **新手**：直接用 `/requirements-pilot` 就能完成大部分工作
2. **进阶用户**：组合使用多个命令，精确控制每个阶段
3. **专家用户**：自定义工作流，适应特定团队需求

**记住**：相信质量门控，90分标准是经过验证的。当系统说需要改进时，通常意味着确实有改进空间。
