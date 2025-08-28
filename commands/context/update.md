---
allowed-tools: Bash, Read, Write, LS
---

# 更新上下文

此命令更新 `.claude/context/` 中的项目上下文文档以反映项目当前状态。在每个开发会话结束时运行此命令以保持上下文准确。

## 开始前检查清单

在继续之前，完成这些验证步骤。
不要用开始前检查的进度打扰用户（"我不会..."）。直接执行并继续。

### 1. 上下文验证
- 运行：`ls -la .claude/context/ 2>/dev/null`
- 如果目录不存在或为空：
  - 告知用户："❌ 没有上下文可更新。请先运行 /context:create。"
  - 优雅退出
- 计算现有文件：`ls -1 .claude/context/*.md 2>/dev/null | wc -l`
- 报告："📁 发现 {count} 个上下文文件需检查更新"

### 2. 变更检测

收集已变更内容的信息：

**Git 变更：**
- 运行：`git status --short` 查看未提交变更
- 运行：`git log --oneline -10` 查看最近提交
- 运行：`git diff --stat HEAD~5..HEAD 2>/dev/null` 查看最近变更的文件

**文件修改：**
- 检查上下文文件年龄：`find .claude/context -name "*.md" -type f -exec ls -lt {} + | head -5`
- 注意哪些上下文文件最旧且可能需要更新

**依赖项变更：**
- Node.js：`git diff HEAD~5..HEAD package.json 2>/dev/null`
- Python：`git diff HEAD~5..HEAD requirements.txt 2>/dev/null`
- 检查是否添加了新依赖项或版本变更

### 3. 获取当前日期时间
- 运行：`TZ=Asia/Shanghai date +"%Y-%m-%dT%H:%M:%S+08:00`
- 存储用于更新已修改文件中的 `last_updated` 字段

## 指示

### 1. 系统化变更分析

对每个上下文文件，确定是否需要更新：

**系统化检查每个文件：**
#### `progress.md` - **始终更新**
  - 检查：最近提交、当前分支、未提交变更
  - 更新：最新完成工作、当前阻塞、下一步
  - 运行：`git log --oneline -5` 获取最近提交消息
  - 如适用包含完成百分比

#### `project-structure.md` - **如有变更则更新**
  - 检查：`git diff --name-status HEAD~10..HEAD | grep -E '^A'` 查找新文件
  - 更新：新目录、移动文件、结构重组
  - 仅在发生重大结构变更时更新

#### `tech-context.md` - **如依赖项变更则更新**
  - 检查：包文件的新依赖项或版本变更
  - 更新：新库、升级版本、新开发工具
  - 包括安全更新或破坏性变更

#### `system-patterns.md` - **如架构变更则更新**
  - 检查：新设计模式、架构决策
  - 更新：采用新模式、完成重构
  - 仅对重大架构变更进行更新

#### `product-context.md` - **如需求变更则更新**
  - 检查：实现新功能、纳入用户反馈
  - 更新：新用户故事、变更需求
  - 包括产品方向的任何转向

#### `project-brief.md` - **很少更新**
  - 检查：仅在基本项目目标变更时
  - 更新：主要范围变更、新目标
  - 通常保持稳定

#### `project-overview.md` - **重要里程碑时更新**
  - 检查：完成主要功能、重大进展
  - 更新：功能状态、能力变更
  - 达到项目里程碑时更新

#### `project-vision.md` - **很少更新**
  - 检查：战略方向变更
  - 更新：仅对重大愿景转变
  - 通常保持稳定

#### `project-style-guide.md` - **如约定变更则更新**
  - 检查：新 linting 规则、风格决策
  - 更新：约定变更、采用新模式
  - 包含新模式示例

### 2. 智能更新策略

**对每个需要更新的文件：**

1. **读取现有文件** 理解当前内容
2. **识别具体节** 需要更新
3. **保留前言** 但更新 `last_updated` 字段：
   ```yaml
   ---
   created: [保留原始]
   last_updated: [使用 date 命令的真实日期时间]
   version: [如重大更新则递增，例如 1.0 → 1.1]
   author: Claude Code PM System
   ---
   ```
4. **进行针对性更新** - 不要重写整个文件
5. **如有重大变更则在底部添加更新注释**：
   ```markdown
   ## 更新历史
   - {date}: {变更摘要}
   ```

### 3. 更新验证

更新每个文件后：
- 验证文件仍有有效前言
- 检查文件大小合理（未损坏）
- 确保保持 markdown 格式
- 确认更新准确反映变更

### 4. 跳过优化

**跳过不需要更新的文件：**
- 如未检测到相关变更，跳过文件
- 在摘要中报告跳过的文件
- 如内容未变更，不要更新时间戳
- 这保留准确的"最后修改"信息

### 5. 错误处理

**常见问题：**
- **文件锁定：** "❌ 无法更新 {file} - 可能在编辑器中打开"
- **权限被拒绝：** "❌ 无法写入 {file} - 检查权限"
- **文件损坏：** "⚠️ {file} 似乎已损坏 - 跳过更新"
- **磁盘空间：** "❌ 更新磁盘空间不足"

如果更新失败：
- 报告哪些文件更新成功
- 注意哪些文件失败及原因
- 保留原始文件（不留下损坏状态）

### 6. 更新摘要

提供详细的更新摘要：

```
🔄 上下文更新完成

📊 更新统计：
  - 已扫描文件：{total_count}
  - 已更新文件：{updated_count}
  - 已跳过文件：{skipped_count}（无需变更）
  - 错误：{error_count}

📝 已更新文件：
  ✅ progress.md - 更新最近提交、当前状态
  ✅ tech-context.md - 添加 3 个新依赖项
  ✅ project-structure.md - 注意新 /utils 目录

⏭️ 已跳过文件（无变更）：
  - project-brief.md（最后更新：5 天前）
  - project-vision.md（最后更新：2 周前）
  - system-patterns.md（最后更新：3 天前）

⚠️ 问题：
  {任何警告或错误}

⏰ 最后更新：{timestamp}
🔄 下一步：定期运行此命令保持上下文最新
💡 提示：重大变更？考虑运行 /context:create 完全刷新
```

### 7. 增量更新跟踪

**跟踪已更新内容：**
- 注意每个文件的哪些部分被修改
- 保持变更聚焦和精准
- 不要重新生成未变更的内容
- 保留格式和结构

### 8. 性能优化

对于大型项目：
- 可能时并行处理文件
- 显示进度："正在更新上下文文件... {current}/{total}"
- 跳过极大文件并警告
- 使用 git diff 快速识别变更区域

## 上下文收集命令

使用这些命令检测变更：
- 上下文目录：`.claude/context/`
- 当前 git 状态：`git status --short`
- 最近提交：`git log --oneline -10`
- 变更文件：`git diff --name-only HEAD~5..HEAD 2>/dev/null`
- 分支信息：`git branch --show-current`
- 未提交变更：`git diff --stat`
- 新未跟踪文件：`git ls-files --others --exclude-standard | head -10`
- 依赖项变更：检查 package.json、requirements.txt 等

## 重要注意事项

- **仅更新有实际变更的文件** - 保留准确的时间戳
- **始终使用系统时钟的真实日期时间** 用于 `last_updated`
- **进行精准更新** - 不要重新生成整个文件
- **验证每次更新** - 确保文件保持有效
- **提供详细摘要** - 显示变更和未变更内容
- **优雅处理错误** - 不要损坏现有上下文

$ARGUMENTS
