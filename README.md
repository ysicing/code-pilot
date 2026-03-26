# Claude Code 配置

> Claude Code 全局配置目录

## 目录结构

```
~/.claude/
├── CLAUDE.md          # 全局配置和开发原则
├── assets/            # 音效资源
└── scripts/           # 辅助脚本
    ├── check-ai-commit.sh
    ├── check-continue.sh
    ├── preserve-file-permissions.sh
    ├── show-notification.sh
    └── zh-space-format.sh
```

## 快速开始

所有开发任务（前端、后端、脚本）统一从 `/code-pilot` 进入：

```
/code-pilot
```

**工作流：**
- 先通过 `superpowers:brainstorming` 明确需求
- 前端任务 → Visual Companion 线框图 → `ui-ux-pro-max` 设计系统 → 实施
- 非前端任务 → 直接进入 `superpowers:writing-plans` → 实施

## 配置说明

- **CLAUDE.md** - 全局行为配置，定义开发原则（KISS、YAGNI 等）、工作风格和代码规范
- **scripts/** - hooks 使用的辅助脚本
- **assets/** - 通知音效

## 项目级配置

在各项目根目录放置 `CLAUDE.md` 可覆盖全局配置，项目级配置优先级更高。
