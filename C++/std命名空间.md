# std命名空间
* 使用命名空间 std：
```cpp
#include <cstdio>
int main(){
    std::printf("http://c.biancheng.net\n");
    return 0;
}
```

***

* 不使用命名空间 std：
```cpp
#include <cstdio>
int main(){
    printf("http://c.biancheng.net\n");
    return 0;
}
```

***

* 演示了如何使用 C++ 库进行输入输出：
```cpp
#include <iostream>
#include <string>

int main(){
    //声明命名空间std
    using namespace std;
   
    //定义字符串变量
    string str;
    //定义 int 变量
    int age;
    //从控制台获取用户输入
    cin>>str>>age;
    //将数据输出到控制台
    cout<<str<<"已经成立"<<age<<"年了！"<<endl;

    return 0;
}
```
运行结果：  
C语言中文网↙  
6↙  
C语言中文网已经成立6年了！

***
在 main() 函数中声明命名空间 std，它的作用范围就位于 main() 函数内部，如果在其他函数中又用到了 std，就需要重新声明.
```cpp
#include <iostream>

void func(){
    //必须重新声明
    using namespace std;
    cout<<"http://c.biancheng.net"<<endl;
}

int main(){
    //声明命名空间std
    using namespace std;
   
    cout<<"C语言中文网"<<endl;
    func();

    return 0;
}
```

***
如果希望在所有函数中都使用命名空间 std，可以将它声明在全局范围中
```cpp

#include <iostream>
//声明命名空间std
using namespace std;
void func(){
    cout<<"http://c.biancheng.net"<<endl;
}
int main(){
    cout<<"C语言中文网"<<endl;
    func();
    return 0;
}
```
