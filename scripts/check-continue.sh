#!/bin/bash

# 任务完成检查脚本
# 检查是否满足完成条件，决定是否显示完成消息

# 检查 TODO 列表是否为空
TODO_COUNT=$(claude-code todo list 2>/dev/null | wc -l)

if [ "$TODO_COUNT" -eq 0 ]; then
    echo "活儿总算干完了,正好偷得浮生半日闲,饮杯茶去."
else
    echo "还有 $TODO_COUNT 个任务待完成"
fi

exit 0
