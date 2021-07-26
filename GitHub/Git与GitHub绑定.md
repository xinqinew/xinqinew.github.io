# Git与GitHub绑定

终端输入`ssh-keygen -t rsa`命令，表示我们指定 RSA 算法生成密钥，然后敲三次回车键，期间不需要输入密码，之后就就会生成两个文件，分别为id_rsa和id_rsa.pub，即密钥id_rsa和公钥id_rsa.pub. 对于这两个文件，其都为隐藏文件，默认生成在以下目录：

-   Linux 系统：~/.ssh
-   Mac 系统：~/.ssh
-   Windows 系统：C:\Documents and Settings\username\.ssh

  
 密钥和公钥生成后，把公钥`id_rsa.pub`的内容添加到 GitHub，这样我们本地的密钥`id_rsa`和 GitHub 上的公钥`id_rsa.pub`才可以进行匹配，授权成功后，就可以向 GitHub 提交代码啦！

![](https://upload-images.jianshu.io/upload_images/1248990-3d29b99268e5e273.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200)
 

![](https://upload-images.jianshu.io/upload_images/1248990-2dca5947f7cabe0d.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200)


![](https://upload-images.jianshu.io/upload_images/1248990-e8f942e2ac2e4471.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200)


![](https://upload-images.jianshu.io/upload_images/1248990-79c5e94500a35094.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200)


在 Git Bash 中输入`ssh -T git@github.com`进行测试：  

![](https://upload-images.jianshu.io/upload_images/1248990-484c0a4c9f4822be.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1138)

  
  
