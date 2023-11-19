## Corn job
在Linux中，cron是一個用於定期執行任務的工具。這些定期執行的任務可以是腳本、命令、或者其他可以在終端中執行的操作。cron工具的主要組件是cron和crontab。

- cron: 是一個在後台運行的守護程序，它負責執行預定的任務。這些任務被保存在cron表中。
- crontab: 是用於設置和管理cron表的命令。每個用戶都可以擁有自己的cron表，而且系統也有一個全域的cron表。

### Build the docker image
```sh
sudo docker build -t corn-test .
```

### Run the docker image

```sh
sudo docker run --rm -d --name mycontainer -e DEL_WAV=1 -e DAY=7 -p 8001:8001 corn-test
```

運行後可以透過以下指令進入指定運行中的 container 資料夾。並觀察檔案是否有成功寫入與建立。
```sh
sudo docker exec -it mycontainer  bash
```

或是進入以下連結觀察log檔案。
- http://localhost:8001/remove.log
- http://localhost:8001/cron.log


## Reference
- [使用 Dockerfile 設定 Container 時區](https://cynthiachuang.github.io/Change-Timezone-in-Dockerfile/)