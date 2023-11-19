#!/bin/bash 

# 要保留幾天內的檔案
day=$(cat /code/day)
# 是否要刪除檔案 1:要 0:不要
del_val=$(cat /code/DEL_WAV)



# 獲得當下的時間（Unix timestamp）
current_time=$(date +%s)
current_date=$(date)
echo "@current_time: $current_date" >> "/code/static/remove.log"
echo "day: $day del_val: $del_val" >> "/code/static/remove.log"


# 撰寫例行性事件
# ...

