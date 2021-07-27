      

# NSNumber
用来包装基本数据类型

numberWithInt创建NSNumber

intValue提取NSNumber

NSValue可以包装任意值

valueWithBytes: objCType:创建新NSValue

getValue提取NSValue

@encode编译器指令可以接受数据类型的名称并为你生成合适的字符串

valueWithSize将struct型数据转换成NSValue

NSNull代表无

NSFileManager对文件系统进行操作

defaultManager创建NSFileManager对象

stringByExpandingTildeInpath替换当前用户的主目录

NSDirectoryEnumerator 是NSEnumerator的子类，调用nextObject时返回该目录中一个文件的另一个路径，这个方法也可以搜索子目录。

pathExtension输出文件的扩展名(去掉了扩展名前面的点)