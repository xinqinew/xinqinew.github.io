# queue与deque示例
queue 

## 示例1：queue

```cpp

#include "stdafx.h"
#include <iostream>
#include <queue>
using namespace std;
 
 
int _tmain(int argc, _TCHAR* argv[])
{
	queue<int> myQueue;
	cout << myQueue.empty() << endl;
	cout << myQueue.size()<< endl;
	myQueue.push(1);
	myQueue.push(2);
	myQueue.push(3);
	cout << myQueue.front()<<endl;
	cout << myQueue.back()<<endl;
	myQueue.pop();
	cout << myQueue.front()<<endl;
	cout << myQueue.back()<<endl;	
	return 0;
}

```
运行结果：

>
1  
0  
1  
3  
2  
3  


<font color=red>queue没找到迭代器</font>

deque:

deque是双向队列Double ended queue；can be accessed with random access iterator

deque是双端队列，是可以在两端扩展和收缩的连续容器。一般deque的实现是基于某种形式的动态数组，允许单个元素用随机获取

迭代器随机读取，数组容量自动管理。

因此它有和vector相似的函数，但在序列的开始也有高效的插入和删除。但不像vector，deque的元素并不是严格连续存储的。

vector和deque有相似的接口和相似的目的，但内部实现截然不同。



## 示例二：deque
```cpp

#include "stdafx.h"
#include <iostream>
#include <deque>
using namespace std;
 
 
int _tmain(int argc, _TCHAR* argv[])
{
	deque<int> myDeque;
	myDeque.push_front(1);
	myDeque.push_front(2);
	myDeque.push_back(3);
	myDeque.push_back(4);
	myDeque.push_back(5);
	myDeque.push_front(6);
	myDeque.pop_back();
	deque<int>::iterator myItor;
	for(myItor=myDeque.begin(); myItor!=myDeque.end(); myItor++)
		cout<<*myItor<<endl;
		
	return 0;

}
```
执行结果：

>
6  
2  
1  
3  
4 

## 示例3:deque 随机访问
```cpp
// g++ std-deque.cpp -o a.out -std=c++11
#include <iostream>
#include <deque>

using namespace std;

int main() {
    deque<int> d = {1, 2, 3, 4};  // [1, 2, 3, 4]

    d.push_back(5); // [1, 2, 3, 4, 5]
    d.pop_front(); // [2, 3, 4, 5]
    d.push_front(0); // [0, 2, 3, 4, 5]
    d.pop_back(); // [0, 2, 3, 4]

    // 印出 deque 內所有內容, c++11 才支援
    for (int &i : d) {
        cout << i << " ";
    }
    cout << "\n";

    cout << d[0] << " " << d[1] << " " << d[2] << "\n";

    return 0;
}
```