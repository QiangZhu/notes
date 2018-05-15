# git 

#
git help


#
git push origin master:master

##  git branch usage

  git branch   //列出所有的分支
  git branch <branch> //创建名为<branch>的分支，但是不会切换过去
  git branch -d <branch>  //删除指定分支，这是一个“安全”操作，git会阻止你删除包含未合并更改的分支。
  git branch -D <branch>  //强制删除分支
  git branch -m <branch> //重新命名当前分支

# .gitignore
# Eclipse
.classpath
.project
.settings/

# Intellij
.idea/
*.iml
*.iws

# Mac
.DS_Store

# Maven
log/
target/

## Reference
1. [掘金-卡巴拉的数-git分支管理](https://juejin.im/post/5a3b14fc6fb9a04514643375)