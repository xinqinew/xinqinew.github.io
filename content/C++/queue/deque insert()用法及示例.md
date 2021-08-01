# deque insert()用法及示例

deque::insert(函数是C++中的内置函数，用于在双端队列中插入元素。  
insert()函数可以通过三种方式使用：

通过在一个位置插入新元素val来扩展双端队列。
通过在双端队列中插入n个新值val来扩展双端队列。
通过在(first，last)范围内插入新元素来扩展双端队列。

用法:
```cpp
deque_name.insert (iterator position, const value_type& val);

deque_name.insert (iterator position, size_type n, const value_type& val);

deque_name.insert (iterator position, InputIterator first, InputIterator last);
```

**参数**  
position–指定要插入元素的位置。  
val–指定要分配给新插入元素的值。  
n–指定要插入的元素数。每个元素都初始化为val的副本。  
first, last–指定迭代器，该迭代器指定要插入的元素范围。范围包括first和last之间的所有元素，包括first指向的元素，但last指向的元素。

**返回值**  
该函数返回一个迭代器，该迭代器指向新插入的元素中的第一个。
  
示例1:
```cpp
// CPP program to illustrate the 
// deque::insert() function 
// insert elements by iterator 
#include <bits/stdc++.h> 
using namespace std; 
int main() 
{ 
    deque<int> dq = { 1, 2, 3, 4, 5 }; 
    deque<int>::iterator it = dq.begin(); 
    ++it; 
    it = dq.insert(it, 10); // 1 10 2 3 4 5 
    std::cout << "Deque contains:"; 
    for (it = dq.begin(); it != dq.end(); ++it) 
        cout << ' ' << *it; 
    cout << '\n'; 
    return 0;
}
```
  

输出：
>
Deque contains: 1 10 2 3 4 5

示例2:
```cpp
// CPP program to illustrate the 
// deque::insert() function 
// program for second syntax 
#include <bits/stdc++.h> 
using namespace std; 
int main() 
{ 
    deque<int> dq = { 1, 2, 3, 4, 5 }; 
    deque<int>::iterator it = dq.begin(); 
    // 0 0 1 2 3 4 5 
    dq.insert(it, 2, 0); 
    std::cout << "Deque contains:"; 
    for (it = dq.begin(); it != dq.end(); ++it) 
        cout << ' ' << *it; 
    cout << '\n'; 
    return 0; 
}
 ``` 

输出：
>
Deque contains: 0 0 1 2 3 4 5

示例3:
```cpp
// CPP program to illustrate the 
// deque::insert() function 
// program for third syntax 
#include <bits/stdc++.h> 
using namespace std; 
int main() 
{ 
    deque<int> dq = { 1, 2, 3, 4, 5 }; 
    deque<int>::iterator it = dq.begin(); 
    ++it; 
    vector<int> v(2, 10); 
    // 1 10 10 2 3 4 5 
    dq.insert(it, v.begin(), v.end()); 
    std::cout << "Deque contains:"; 
    for (it = dq.begin(); it != dq.end(); ++it) 
        cout << ' ' << *it; 
    cout << '\n'; 
    return 0; 
}
```
 
输出：
>
Deque contains: 1 10 10 2 3 4 5