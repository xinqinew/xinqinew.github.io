# NSPredicate类

用于制定过滤器的条件

+predicateWithFormat创建谓词

-evaluateWithObject通知谓词根据指定的对象计算自身的值

-filteredArrayUsingPredicate循环过滤数组内容，根据谓词计算每个对象的值，并将值为Yes的对象累积到将被返回的新数组中

copy指针复制，浅拷贝，返回的是不能修改的对象

mutableCopy对象复制，深拷贝，返回的是可修改的对象

-filterUsingPredicate针对可变数组进行过滤及返回

predicateWithSubstitutionVariables构造新的专用谓词，创建一个键/值对字典，其中，键是变量名，值是插入谓词的内容

&& AND 和

|| OR 或

! NOT 非

BETWEEN { }之间

BEGINSWITH检查某个字符串是否以另一个字符串开头

ENDSWITH检查某个字符串是否以另一个字符串结尾

CONTAINS检查某个字符串是否在另一个字符串内部

[c]不区分大小写

[d]不区分发音符号

[cd]不区分以上两项

LIKE 匹配运算符