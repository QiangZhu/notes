# git common commands

## 基本操作

    - help
    
      ···
      git help
      ···
 
	- 列出所有的分支
        ···
		git branch 
        ···
	- 创建名为<branch>的分支，但是不会切换过去
        ···
		git branch <branch>
        ···
	- 删除指定分支，这是一个“安全”操作，git会阻止你删除包含未合并更改的分支。
		···
        git branch -d <branch>  
        ···
	- 强制删除分支
		···
        git branch -D <branch>
        ···
	- 重新命名当前分支
		···
        git branch -m <branch>
        ···
	- 切换分支
		···
        git checkout <existing-branch> //切换到一个已有分支上
		git checkout -b <new-branch> // -b 标记 可以方便让你先创建一个新的new-branch,再直接切换过去
		git checkout -b <new-branch> <existing-branch> //在已有的分支上创建分支，原来的分支使新分支的基
        ···
	- 分支合并
        ···
		git merge <branch>  //将指定分支并入当前分支
		git merge --no-ff <branch>  //将指定分支并入当前分支，但 总是 生成一个合并提交（即使是快速向前合并）。这可以用来记录仓库中发生的所有合并。
        ···
    - 提交本地代码到远程数据仓库
        ···
        git push origin master:master
		···
## 分支开发的基本流程

   - 标准的分支开发流程

	 - 开始新功能
		git checkout -b new-feature master

	 - 编辑文件
		git add <file>
		git commit -m "开始新功能"

	 - 编辑文件
		git add <file>
		git commit -m "完成功能"

	 - 合并new-feature分支
		git checkout master
		git merge new-feature
		git branch -d new-feature
		
#### 三路合并开发流程
	- 开始新功能
		git checkout -b new-feature master

	- 编辑文件
		git add <file>
		git commit -m "开始新功能"

	- 编辑文件
		git add <file>
		git commit -m "完成功能"

	- 在master分支上开发
		git checkout master

	-编辑文件
		git add <file>
		git commit -m "在master上添加了一些极其稳定的功能"

	- 合并new-feature分支
		git merge new-feature
		git branch -d new-feature
 
## Reference
   - [掘金-卡巴拉的数-git分支管理](https://juejin.im/post/5a3b14fc6fb9a04514643375)
   - [Git 的基本操作、开发流程、实用技巧总结] https://www.tuicool.com/articles/IBbMNvN