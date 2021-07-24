# namespace 命名空间
namespace 是C++中的关键字，用来定义一个命名空间，语法格式为：
```cpp
namespace name{
    //variables, functions, classes
}
```
name是命名空间的名字，它里面可以包含变量、函数、类、typedef、#define 等，最后由{ }包围。



***

```cpp
namespace Li{  //小李的变量定义
    FILE fp = NULL;
}
namespace Han{  //小韩的变量定义
    FILE fp = NULL
}
```
```cpp
Li::fp = fopen("one.txt", "r");  //使用小李定义的变量 fp
Han::fp = fopen("two.txt", "rb+");  //使用小韩定义的变量 fp
```

```cpp
using Li::fp;
fp = fopen("one.txt", "r");  //使用小李定义的变量 fp
Han :: fp = fopen("two.txt", "rb+");  //使用小韩定义的变量 fp
```

```cpp
using namespace Li;
fp = fopen("one.txt", "r");  //使用小李定义的变量 fp
Han::fp = fopen("two.txt", "rb+");  //使用小韩定义的变量 fp
```

```cpp
#include <stdio.h>
//将类定义在命名空间中
namespace Diy{
    class Student{
    public:
        char *name;
        int age;
        float score;
  
    public:
        void say(){
            printf("%s的年龄是 %d，成绩是 %f\n", name, age, score);
        }
    };
}
int main(){
    Diy::Student stu1;
    stu1.name = "小明";
    stu1.age = 15;
    stu1.score = 92.5f;
    stu1.say();
    return 0;
}
```