# GitHub回退历史版本

前提是本地已经有了git的origin master库或者克隆需要回退的代码到本地。

### 1.  查询历史对应不同版本的ID ，用于回退使用

  `git log --pretty=oneline`


假设查到历史版本的id是 ： 662095637a8e9320e83761341e594b143524049e

### 2. 恢复到历史版本

1.  `git reset --hard 662095637a8e9320e83761341e594b143524049e`

### 3. 把修改推到远程服务器

1.  `git push -f -u origin master`

### 4. 重新更新

1.  `git pull`