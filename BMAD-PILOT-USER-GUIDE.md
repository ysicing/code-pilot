# BMAD Pilot 使用指南

本指南介绍如何使用 BMAD Pilot 工作流，编排一组协作 AI 角色（PO/Architect/SM/Dev/QA）在仓库上下文中完成：01 产品需求文档、02 系统设计规范、03 冲刺计划，并自动进入开发与测试，整个过程包含多次用户确认门与质量评分。

参考阅读：BMAD-README.md（BMAD 方法概览）、BMAD-INTEGRATION-GUIDE.md（进阶集成）。

---

## 命令总览

- 命令：`/bmad-pilot <PROJECT_DESCRIPTION> [OPTIONS]`
- 作用：在仓库上下文中，按阶段编排 `bmad-po → bmad-architect → bmad-sm → bmad-dev → bmad-qa`。
- Orchestrator：由工作流统一编排（使用 bmad-orchestrator 进行仓库扫描）。

### Options
- `--skip-tests`：跳过 QA 阶段
- `--direct-dev`：跳过 SM 冲刺计划，架构后直接进入开发
- `--skip-scan`：跳过初始仓库扫描（不推荐）

### 输出目录
- 所有产出归档在：`./.claude/specs/{feature_name}/`
  - `00-repo-scan.md` — 仓库扫描摘要（自动生成）
  - `01-product-requirements.md` — 产品需求文档（确认后保存）
  - `02-system-architecture.md` — 系统设计规范（确认后保存）
  - `03-sprint-plan.md` — 冲刺计划（确认后保存；`--direct-dev` 时跳过）

`{feature_name}` 由 `<PROJECT_DESCRIPTION>` 生成（kebab-case：小写，空格/标点转 `-`，连续合并，首尾去除）。

---

## 快速开始

1) 执行 Pilot：
```
/bmad-pilot 为现有项目新增看板模块，支持多用户权限与移动端适配
```
2) 与 PO 交互澄清，直至 PRD ≥ 90 分 → 确认保存。
3) 与 Architect 讨论技术决策，直至架构 ≥ 90 分 → 确认保存。
4) 审阅并确认 SM 的冲刺计划（或使用 `--direct-dev` 跳过该阶段）。
5) Dev 基于文档实现；QA 基于文档与实现测试（除非 `--skip-tests`）。
6) 查看产出目录：`./.claude/specs/{feature_name}/`。

---

## 工作流阶段

- Phase 0：仓库扫描（自动，除非 `--skip-scan`）
  - Agent：`bmad-orchestrator`
  - 结果：扫描摘要返回并写入 `00-repo-scan.md`
  - 内容：项目类型、技术栈、代码组织、惯例、集成点、约束与注意事项

- Phase 1：产品需求（交互）
  - Agent：`bmad-po`
  - 循环：澄清问题 → 更新 PRD → 评分（目标 ≥ 90）
  - 确认门：PRD ≥ 90 分后，需要用户明确确认再继续
  - 保存：`01-product-requirements.md`

- Phase 2：系统架构（交互）
  - Agent：`bmad-architect`
  - 循环：技术选型与设计澄清 → 更新架构 → 评分（目标 ≥ 90）
  - 确认门：架构 ≥ 90 分后，需要用户明确确认再继续
  - 保存：`02-system-architecture.md`

- Phase 3：冲刺计划（交互，除非 `--direct-dev`）
  - Agent：`bmad-sm`
  - 循环：计划要点与问题澄清 → 更新计划 → 确认保存
  - 保存：`03-sprint-plan.md`

- Phase 4：开发实现（自动）
  - Agent：`bmad-dev`
  - 输入：PRD、架构、冲刺计划、`00-repo-scan.md`

- Phase 5：质量保障（自动，除非 `--skip-tests`）
  - Agent：`bmad-qa`
  - 输入：PRD、架构、冲刺计划、实现、`00-repo-scan.md`

---

## 交互与质量门

- 质控阈值：PRD 与架构质量评分需达到 ≥ 90 分。
- 强制确认门：每个关键阶段完成后，Orchestrator 会停下等待你的“继续/确认”。
- 迭代澄清：PO/Architect/SM 会提出 2-5 个精准问题，Orchestrator 转述并汇总你的回答以供下一轮完善。

---

## 仓库上下文

- 首次扫描：由工作流触发的 orchestrator 扫描（`bmad-orchestrator`）自动分析当前仓库（`--skip-scan` 可跳过）。
- 缓存路径：`./.claude/specs/{feature_name}/00-repo-scan.md`（供所有后续 Agent 引用）。
- 作用：提供技术栈识别、约定、测试模式、集成点，避免上下文丢失并保持一致性。

---

## 角色职责

- `bmad-po`：需求澄清与 PRD 产出，评分与问题驱动迭代。
- `bmad-architect`：技术架构与关键决策，评分与问题驱动迭代。
- `bmad-sm`：冲刺计划、任务拆分、依赖/风险/节奏规划。
- `bmad-dev`：按文档实现、测试、日志/安全/性能与同构风格。
- `bmad-qa`：基于需求与实现的全维度测试（单测/集成/E2E/性能/安全）。

---

## 示例

- 基础运行：
```
/bmad-pilot 在线商城结算流程升级，支持优惠券与发票
```

- 跳过测试：
```
/bmad-pilot H5 活动页生成器 --skip-tests
```

- 直接从架构进入开发（跳过 SM）：
```
/bmad-pilot 小程序客服模块重构 --direct-dev
```

- 跳过扫描（不推荐）：
```
/bmad-pilot 部署流水线可视化 --skip-scan
```

---

## 目录结构

```
.claude/
  specs/
    {feature_name}/
      00-repo-scan.md
      01-product-requirements.md
      02-system-architecture.md
      03-sprint-plan.md
```

---

## Tips & 常见问题

- 分数上不去：优先补齐评分分项的缺口（业务指标、关键流程、性能/安全约束等）。
- 上下文不一致：检查并引用 `00-repo-scan.md` 的关键约定与模式，保证 PRD/架构/计划一致。
- 依赖/网络受限：Dev/QA 的实际执行受环境影响；请在项目内准备依赖与测试环境，或先提交伪实现/测试策略。
- 文档路径：确保在项目根目录执行，Pilot 会将文件写入 `./.claude/specs/{feature_name}/`。

---

## 最佳实践

- 小步快跑：每轮补充最关键信息，快速达成 ≥ 90 分文档。
- 统一术语：在 PRD 固定术语词表；架构与代码沿用同名。
- 用例先行：PRD 的验收标准应转化为 QA 的关键测试用例。
- 复用模式：尽量沿用扫描识别的现有代码/测试模式，减少偏差。

---

## 版本记录

- 2025-08-11：新增仓库扫描摘要缓存 `00-repo-scan.md`，统一路径与跨阶段引用；明确确认门与目录预创建说明。
