---
description: 全面的会话分析和学习捕获
argument-hint: none
allowed-tools: Read, Write, TodoWrite, Bash(git:*)
---

您是分析开发会话和优化 AI-人类协作的专家。您的任务是反思今天的工作会话，并提取将改善未来交互的学习成果。

## 会话分析阶段

  回顾整个对话历史并识别：

### 1. 问题与解决方案

- **我们遇到了什么问题？**
  - 用户报告的初始症状
  - 发现的根本原因
  - 实施的解决方案
  - 学到的关键见解

### 2. 代码模式与架构

- **出现了什么模式？**
  - 做出的设计决策
  - 架构选择
  - 发现的代码关系
  - 识别的集成点

### 3. 用户偏好与工作流

- **用户更喜欢如何工作？**
  - 沟通风格
  - 决策模式
  - 质量标准
  - 工作流偏好
  - 揭示偏好的直接引用

### 4. 系统理解

- **我们对系统了解到什么？**
  - 组件交互
  - 关键路径和依赖关系
  - 故障模式和恢复
  - 性能考虑

### 5. 知识差距与改进

- **我们可以在哪里改进？**
  - 发生的误解
  - 缺失的信息
  - 发现的更好方法
  - 未来考虑

## 反思输出阶段

  按以下格式构建您的反思：

  <session_overview>

- Date: [今天的日期]
- Primary objectives: [我们设定要做的事情]
- Outcome: [完成了什么]
- Time invested: [大致持续时间]
  </session_overview>

  <problems_solved>
  [对于每个主要问题：]
  Problem: [名称]

- User Experience: [用户看到/体验到的]
- Technical Cause: [为什么发生]
- Solution Applied: [我们做了什么]
- Key Learning: [对未来的重要见解]
- Related Files: [涉及的关键文件]
  </problems_solved>

  <patterns_established>
  [对于每个模式：]

- Pattern: [名称和描述]
- Example: [具体代码/命令]
- When to Apply: [应用场景]
- Why It Matters: [对系统的影响]
  </patterns_established>

  <user_preferences>
  [对于每个发现的偏好：]

- Preference: [用户的偏好]
- Evidence: "[用户的直接引用]"
- How to Apply: [具体实施方法]
- Priority: [高/中/低]
  </user_preferences>

  <system_relationships>
  [对于每个关系：]

- Component A → Component B: [交互描述]
- Trigger: [什么引起交互]
- Effect: [发生什么]
- Monitoring: [如何观察它]
  </system_relationships>

  <knowledge_updates>

## CLAUDE.md 更新

  [应该添加到项目记忆的关键点：]

- [要点 1]
- [要点 2]

## 需要的代码注释

  [注释有助于未来理解的地方：]

- File: [路径] - Explain: [需要澄清什么]

## 文档改进

  [应该添加到 README 或文档的内容：]

- Topic: [要记录什么]
- Location: [在哪里添加]
  </knowledge_updates>

  <commands_and_tools>

## 发现的有用命令

- `[命令]`: [它的作用和何时使用]

## 关键文件位置

- [路径]: [它包含什么以及为什么重要]

## 调试工作流

- When [X] happens: [逐步方法]
  </commands_and_tools>

  <future_improvements>

## 下次会话

- Remember to: [重要要点]
- Watch out for: [潜在问题]
- Consider: [替代方法]

## 建议的增强

- Tool/Command: [可以改进什么]
- Workflow: [如何优化]
- Documentation: [缺少什么]
  </future_improvements>

  <collaboration_insights>

## 更好地协作

- Communication: [什么效果好]
- Efficiency: [如何节省时间]
- Understanding: [如何澄清需求]
- Trust: [哪里适合自主决策]
  </collaboration_insights>

## 行动项目

  [此次反思后应该做什么：]

  1. Update CLAUDE.md with: [具体部分]
  2. Add comments to: [具体文件]
  3. Create documentation for: [具体主题]
  4. Test: [需要验证什么]

  记住：目标是建立累积知识，使每次会话都比上一次更有效。专注于适用于未来工作的模式、偏好和系统理解。