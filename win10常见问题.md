# win10常见问题
[禁止win10五笔输入法的shift切换功能](https://github.com/flowercodec/Win10WubiShiftPatch)

方法一：win10系统添加开机启动项
使用组合键win+R打开运行窗口，输入“shell:startup”打开启动项文件夹。
可以把软件快捷方式复制到“启动项文件夹|”中。

方法二：注册表添加启动项
1、打开运行，输入“regedit”，打开注册表。
2、在注册表中找到如下位置HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run，右键“Run”新建一个字符串类型的键值。
3、右键新建的键值，选择“修改”，将数值名称改为 你要启动的程序名称如：ctfmon.exe，数值数据改为 程序所在位置的路径 如：C:\windows\system32\ctfmon.exe (直接不能修改名字的，可以先点击重命名，改好名字，再点击修改，修改数值数据)

[如何彻底关闭win10系统windows defender实时保护功能？](https://www.lmdouble.com/1703164156.html)