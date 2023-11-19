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
sudo docker run --rm -d --name mycontainer -e DEL_WAV=1 -e DAY=2 -p 8001:8001 corn-test
```

運行後可以透過以下指令進入指定運行中的 container 資料夾。並觀察檔案是否有成功寫入與建立。
```sh
sudo docker exec -it mycontainer  bash
```

或是進入以下連結觀察log檔案。
- http://localhost:8001/remove.log
- http://localhost:8001/cron.log


### Check the container running

```sh
sudo docker container ls
```

```
CONTAINER ID   IMAGE       COMMAND                  CREATED             STATUS             PORTS                    NAMES
d13a035fed0d   corn-test   "/bin/sh -c 'echo $D…"   About an hour ago   Up About an hour   0.0.0.0:8001->8001/tcp   mycontainer
```

### Stop the container running 

```
sudo docker container stop d13a035fed0d
```

> d13a035fed0d為container ID，需更換。

### Delete the image
取得 image ID，要刪除ID為1da633537c7b。
```sh
sudo docker image ls
```

```
REPOSITORY   TAG       IMAGE ID       CREATED             SIZE
corn-test    latest    1da633537c7b   About an hour ago   495MB
```

```sh
sudo docker image rm 1da633537c7b
```

## Reference
- [使用 Dockerfile 設定 Container 時區](https://cynthiachuang.github.io/Change-Timezone-in-Dockerfile/)