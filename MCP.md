# 常用MCP推荐

- deepwiki
- context7
- playwright(有人推荐[mcp-chrome](https://github.com/hangwin/mcp-chrome))

## 用过

- [serena](https://github.com/oraios/serena)
- [claude-context](https://github.com/zilliztech/claude-context)

## 其他有趣玩法

### Codex 为主，调用 Claude Code

如果你的主 AI 编程工具是 Codex，可以在 **~/.codex/config.toml** 配置文件中配置一个 Claude Code MCP 服务

```toml
[mcp_servers.claude]
command = "claude"
args = ["mcp", "serve"]
```

配好后打开Codex，输入 **/mcp** 就能看到Claude的工具了。

使用技巧：

```
使用claude帮我制定迭代计划保存到plan.md
```

### Claude Code 为主，调用 Codex


如果你的主 AI 编程工具是 Claude Code，则可以添加 Codex MCP 服务：

```bash
claude mcp add -s user codex-gpt-5 -- codex mcp
```

添加之后，打开 Claude Code 的 **/mcp** 命令可以看到 codex 工具

使用技巧：

```
使用codex基于plan.md完成todo的任务
```
