# deque和queue容器
标准模板库 [STL](http://c.biancheng.net/stl/) 提供了两种容器：deque 和 queue，以实现和队列类似的数据 结构。deque 是一个双端队列。它类似于矢量，但允许在前端和后端高效地访问值。队列抽象数据类型就像栈抽象数据类型：它实际上是一个容器适配器。
## deque容器

可以将 deque 容器想象成一个矢量，但它可以快速访问前端以及后端的元素（和矢量一样，deque 也可以使用 `[]` 运算符访问元素）。

  
![deque成员函数](http://c.biancheng.net/uploads/allimg/181204/2-1Q2041A055121.gif)  
图 1 deque 成员函数
使用双端队列 ADT 的程序必须包含 deque 头文件。由于本节更关心它与队列类似的特性，所以就来集中讨论一下 push_back、pop_front 和 front 成员函数，如图 1 所示。它们的示例和相应描述如表 2 所示。

| 成员函数 | 示例和描述 | 
| :---- | ---- | 
| push_back | iDeque.push back(7); <br>接受一个值作为参数插入到 deque 中。<br>参数被插入在最后一个元素之后（被推到 deque 后面） |
| pop_front |   iDeque.pop front(); <br>删除 deque 的第一个元素并丢弃它 |
| pop_front | cout << iDeque.front() << endl; <br> front 返回对 deque 第一个元素的引用 |

**下面的程序演示了双端队列容器的使用：**
```cpp
// This program demonstrates the STL deque container.
#include <iostream>
#include <deque>
u[sin](http://c.biancheng.net/ref/sin.html)g namespace std;

int main()
{
    deque<int> iDeque;
    cout << "I will now enqueue items. . . \n";
    for (int x = 2; x < 8; x += 2)
    {
        cout << "Pushing " << x << endl;
        iDeque.push_back(x);
    }
    cout << "I will now dequeue items...\n";
    while (!iDeque.empty())
    {
        cout << "Popping " << iDeque.front() << endl; iDeque.pop_front();
    }
    return 0;
}
```

程序输出结果：

>
I will now enqueue items. . .  
Pushing 2  
Pushing 4  
Pushing 6  
I will now dequeue items...  
Popping 2  
Popping 4  
Popping 6

## queue容器适配器

queue 容器适配器可以建立在矢量、链表或者双端队列的基础上。默认情况下，它使用一个双端队列作为其基础。  
  
queue 支持的插入和删除操作与栈 ADT 所支持的类似：push、pop 和 front。但是，它们的表现有所不同。queue 版本的 push 始终在队列的后面插入一个元素。queue 版本的 pop 始终从结构的前面删除一个元素。front 函数返回队列前面的元素的值。  
  
下面的程序演示了一个队列。由于该队列的声明没有指定适配哪一种类型的容器，所以该队列将建立在一个双端队列上。
```cpp
//This program demonstrates the STL queue container adapter.
#include <iostream>
#include <queue>
using namespace std;

int main()
{
    queue<int> iQueue;
    cout << "I will now enqueue items...\n";
    for (int x = 2; x < 8; x += 2)
    {
        cout << "Pushing " << x << endl;
        iQueue.push(x);
    }
    cout << "I will now dequeue items...\n";
    while(!iQueue.empty())
    {
        cout << "Popping " << iQueue.front () << endl;
        iQueue.pop ();
    }
    return 0;
}
```
程序输出结果：
>
I will now enqueue items...  
Pushing 2  
Pushing 4  
Pushing 6  
I will now dequeue items...  
Popping 2  
Popping 4  
Popping 6


