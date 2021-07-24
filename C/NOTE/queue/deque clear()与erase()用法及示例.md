# deque clear()与erase()用法及示例
[雙端隊列](https://vimsky.com/cache/index.php?source=https%3A//www.geeksforgeeks.org/deque-cpp-stl/)或雙頭隊列是序列容器，兩端都有擴展和收縮功能。它們類似於向量，但是在元素的結尾和開始處插入和刪除時效率更高。與向量不同，可能無法保證連續的存儲分配。

**deque::clear()**

clear()函數用於刪除雙端隊列容器的所有元素，從而使其大小為0。  
**用法:**

```
dequename.clear()
Parameters :
No parameters are passed.
Result :
All the elements of the deque are
removed ( or destroyed )
```
例子：
  
```cpp
Input :mydeque = {1, 2, 3, 4, 5}
         mydeque.clear();
Output:mydeque = {}

Input :mydeque = {}
         mydeque.clear();
Output:mydeque = {}
```
**錯誤和異常**

1.它沒有異常拋出保證。  
2.傳遞參數時顯示錯誤。

```cpp
// CPP program to illustrate 
// Implementation of clear() function 
#include <deque> 
#include <iostream> 
using namespace std; 
  
int main() 
{ 
    deque<int> mydeque{ 1, 2, 3, 4, 5 }; 
  
    mydeque.clear(); 
    // Deque becomes empty 
  
    // Printing the deque 
    for (auto it = mydeque.begin(); it != mydeque.end(); ++it) 
        cout << ' ' << *it; 
    return 0; 
}
```

輸出：

>No Output

**deque::erase()**

erase()函數用於從指定位置或範圍中刪除容器中的元素。

**用法:**

```
1. _**dequename.erase(position)**_
2. _**dequename.erase(startingposition, endingposition)**_
**Parameters :**
Position of the element to be removed in the form of iterator.
or the range specified using start and end iterator.
**Result :**
Elements are removed from the specified
position of the container.
```

例子：

```cpp
Input  : mydeque{1, 2, 3, 4, 5}, iterator= 2
         mydeque.erase(iterator);
Output : 1, 2, 4, 5

Input  : mydeque{1, 2, 3, 4, 5, 6, 7, 8}, iterator1= 3, iterator2= 6
         mydeque.erase(iterator1, iterator2);
Output : 1, 2, 3, 8
```

**錯誤和異常**

1.如果位置有效，則沒有異常拋出保證。  
2.否則顯示未定義的行為。

**從特定位置移除元件**

```cpp
// CPP program to illustrate
// Implementation of erase() function
#include <deque>
#include <iostream>
using namespace std;

int main()
{
	deque<int> mydeque{ 1, 2, 3, 4, 5 };
	deque<int>::iterator it;

	it = mydeque.begin();
	mydeque.erase(it);

	// Printing the deque
	for (auto it = mydeque.begin(); it != mydeque.end(); ++it)
		cout << ' ' << *it;
	return 0;
}

```

輸出：

  

>2 3 4 5

**刪除範圍內的元素**

```cpp
// CPP program to illustrate 
// Implementation of erase() function 
#include <deque> 
#include <iostream> 
using namespace std; 
  
int main() 
{ 
    deque<int> mydeque{ 1, 2, 3, 4, 5 }; 
    deque<int>::iterator it1, it2; 
  
    it1 = mydeque.begin(); 
    it2 = mydeque.end(); 
    it2--; 
    it2--; 
  
    mydeque.erase(it1, it2); 
  
    // Printing the deque 
    for (auto it = mydeque.begin(); it != mydeque.end(); ++it) 
        cout << ' ' << *it; 
    return 0; 
}
```

輸出：

>4 5

**應用**  
給定一個整數列表，從雙端隊列中刪除所有偶數元素並打印雙端隊列。

```
Input  :1, 2, 3, 4, 5, 6, 7, 8, 9
Output :1 3 5 7 9
_Explanation - 2, 4, 6 and 8 which are even are erased from the deque_
```

**算法**  
1.循環運行，直到雙端隊列大小為止。  
2.檢查每個位置的元素是否可被2整除，如果是，則刪除該元素並遞減迭代器。  
3.打印最終雙端隊列。

```cpp
// CPP program to illustrate
// Application of erase() function
#include <deque>
#include <iostream>
using namespace std;

int main()
{
	deque<int> mydeque{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
	deque<int>::iterator i;
	i = mydeque.begin();
	while (i != mydeque.end()) {
		if (*i % 2 == 0)	
/* Not a good idea to erase inside loop, if you delete last element,
mydeque.end() cannot be found resulting in infinite loop */
			mydeque.erase(i);
		i++;	
	}

	// Printing the deque
	for (auto it = mydeque.begin(); it != mydeque.end(); ++it)
		cout << ' ' << *it;
	return 0;
}

```

輸出：

>1 3 5 7 9

**clear() VS erase()。什麽時候使用什麽？**

**clear()**從雙端隊列容器中刪除所有元素，從而使其大小為0。使用clear()函數刪除雙端隊列中的所有元素。  
**erase()**另一方麵，“函數”用於從容器中刪除特定元素或從容器中刪除一係列元素，從而通過刪除元素的數量來減小其大小。