# [ifndef详解](https://blog.csdn.net/weixin_42692164/article/details/113368331?utm_source=app&app_version=4.11.0)
## ifndef是"if not defined"的简写
#ifndef起到的效果是防止一个源文件多次包含同一个头文件,
而不是防止两个源文件包含同一个头文件。

### 一、防止头文件的重复包含和编译
```cpp
#ifndef <标识>
#define <标识>

......

......

#endif


```
标识的明明规则一般是头文件名全大写，前面加下划线，并把文件名中的"."也变成下划线，如：stdio.h
```cpp
#ifndef _STDIO_H
#define _STDIO_H

......

......

#endif
```
### 二、便于程序的调试和移植
```c
#ifndef 标识符

程序段 1

#else

程序段 2

#endif

```
它的作用是当“标识符”没有由#define定义过，则编译“程序段1”，否则编译“程序段2”。
```cpp
#ifndef 标识符

#define 标识符

程序段 1

#else

程序段 2

#endif


```
它的作用是当“标识符”没有由#define定义过，则编译“程序段1”，否则编译“程序段2”。


```cpp
#if 表达式

程序段 1

#else

程序段 2

#endif


```
它的作用是当“表达式”值为真时，编译“程序段1”，否则编译“程序段2”。

注：以上三种形式中#else不是强制的，可省略；当然，当#else后需要嵌套#if时，可以使用预处理命令#elif，它相当于#else#if。
