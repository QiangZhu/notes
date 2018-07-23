# git common commands

## basic operation

### help
    
    ```
    git help
    
    ```
    
### add
    
    ```
    git add -A .
    ```
    
### commit
    
    ```
    git commit -m "comments"
    ```
 
### list branch
    
    ```
    git branch 
    ```
        
###  create <branch>
        
    ```
		git branch <branch>
    ```
        
### delete <branch> saftly
		
    ```
    git branch -d <branch>  
    ```
        
### force to delete <branch>
		
    ```
    git branch -D <branch>
    ```
        
### rename <branch>
		
    ```
    git branch -m <branch>
    ```
        
### checkout <branch>
		
    ```
    git checkout <existing-branch> //切换到一个已有分支上
    git checkout -b <new-branch> // -b 标记 可以方便让你先创建一个新的new-branch,再直接切换过去
    git checkout -b <new-branch> <existing-branch> //在已有的分支上创建分支，原来的分支使新分支的基
    ```
        
### merge <branch>
        
    ```
    git merge <branch>  //将指定分支并入当前分支
	git merge --no-ff <branch>  //将指定分支并入当前分支，但 总是 生成一个合并提交（即使是快速向前合并）。这可以用来记录仓库中发生的所有合并。
    ```
        
### push 
        
    ```
    git push origin master:master
    ```
        
## git branch development diagram

### git development diagram

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
		
### 三路合并开发流程
   
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

	   - 编辑文件
		git add <file>
		git commit -m "在master上添加了一些极其稳定的功能"

	   - 合并new-feature分支
		git merge new-feature
		git branch -d new-feature
 
## Reference
   - [掘金-卡巴拉的数-git分支管理](https://juejin.im/post/5a3b14fc6fb9a04514643375)
   - [Git 的基本操作、开发流程、实用技巧总结](https://www.tuicool.com/articles/IBbMNvN) 