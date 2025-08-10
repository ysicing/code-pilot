# Claude Code AI 代理快速入门指南

> 本指南帮助你在5分钟内掌握核心功能。详细使用手册请参考 [user-manual.md](./user-manual.md)

## ⚡ 一分钟极速上手

### 第一条命令
```bash
# 这一条命令就能实现从需求到代码的完整流程
/requirements-pilot "实现用户注册功能，支持邮箱验证"
```

系统会自动：
1. 分析需求并生成技术规格（90分以上才继续）
2. 征求你的确认
3. 实现代码并进行质量审查
4. 智能决定是否需要测试

### 基本原则
- **相信质量门控**：90分标准是经过验证的
- **从简单开始**：不确定用什么命令时，先用 `/ask` 咨询
- **一步步来**：复杂功能先用 `/story-breakdown` 分解

## 🔥 最常用的5个命令

### 1. `/requirements-pilot` - 万能命令
**使用场景**：实现任何新功能
```bash
/requirements-pilot "功能描述"        # 让系统智能决定测试策略
/requirements-pilot "功能描述" --test  # 强制包含测试
/requirements-pilot "UI更新" --no-test # 纯UI不需要测试
```

### 2. `/ask` - 技术咨询
**使用场景**：不确定怎么做的时候
```bash
/ask "React vs Vue 选择建议"
/ask "微服务架构最佳实践"
```

### 3. `/bugfix` - 错误修复  
**使用场景**：系统有问题需要修复
```bash
/bugfix "用户登录后页面空白"
/bugfix "API响应时间过长"
```

### 4. `/story-breakdown` - 功能分解
**使用场景**：功能太复杂，需要拆分
```bash
/story-breakdown "完整的电商系统"
/story-breakdown "用户权限管理系统"
```

### 5. `/review` - 代码审查
**使用场景**：检查代码质量
```bash
/review "登录模块"
/review "整个用户管理系统"
```

## 🎯 使用模式选择

### 模式1：新手模式（推荐）
```bash
# 一条命令解决问题
/requirements-pilot "你想实现的功能"
```

### 模式2：分步控制  
```bash
# 复杂功能的step-by-step方式
/story-breakdown "复杂功能"     # 第一步：分解功能
/ask "技术选型问题"             # 第二步：咨询架构
/requirements-pilot "具体功能"   # 第三步：逐个实现
```

## 🛠️ 特殊功能命令

### macOS 专用：`/screenshot` 
智能截图分析（仅支持 macOS）
```bash
/screenshot --window  # 选择窗口
/screenshot --full    # 全屏截图  
/screenshot --crop    # 选择范围
```

### 网络搜索：`/search-gemini`
获取最新技术信息
```bash
/search-gemini "React 18 新特性"
/search-gemini "Docker 最佳实践 2024"
```

### 角色辩论：`/role-debate`
技术选型深度讨论
```bash
/role-debate security vs performance "JWT vs Session认证"
/role-debate architect vs performance "微服务 vs 单体架构"
```

## ⚠️ 快速故障排除

### 问题：质量门控失败
**现象**：提示"评分XX/100，未达到90分标准"
**解决**：
```bash
/story-breakdown "你的功能"  # 先分解为更具体的任务
```

### 问题：不知道用哪个命令
**解决方案**：
- 实现新功能 → `/requirements-pilot`
- 修复bug → `/bugfix`  
- 技术咨询 → `/ask`
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

1. **新功能**：直接用 `/requirements-pilot`
2. **修bug**：直接用 `/bugfix`  
3. **不确定**：先用 `/ask` 咨询
4. **太复杂**：先用 `/story-breakdown` 分解
5. **相信90分质量门控**：系统比你更懂何时可以继续