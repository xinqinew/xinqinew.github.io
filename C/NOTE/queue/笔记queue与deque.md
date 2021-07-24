# 笔记queue与deque

<img src="https://pic4.zhimg.com/80/v2-742e9e59e564c846b67ae9ced0e4bbbf_1440w.jpg" width="500">  



**queue操作：**  
```cpp
queue<int>q;	//创建一个int型空队列q  
q.empty();	//判断队列是否为空，为空返回true  
q.push(s);	//将变量s从队尾入队  
q.pop();	//将队头元素弹出  	
q.front();	//只返回队头元素  
q.back();	//只返回队尾元素  	
q.size();	//返回队列中元素个数   	
```

```tip
queue两端访问,队尾插入,队首删除。 
```
**deque操作：**  
```cpp
deque<int> dq;	//创建一个数双端队列dq  
dq.empty();	//判断队列是否为空，为空返回true  
dq.push_front(s);//将s从队头入队  
dq.push_back(s);//将s从队尾入队，和普通队列方式一样  
dq.front();	//只返回队头元素  
dq.back();	//只返回队尾元素  
dq.pop_front();	//将队头元素弹出  
dq.pop_back();	//将队尾元素弹出  
dq.size();	//返回队列中元素个数  
dq.clear();	//将队列清空    
dq.insert();//插入新元素,最多有四个参数
//迭代器  
dq.begin();	//回傳指向第一個元素(頭端)的迭代器  
dq.cbegin();	//回傳指向第一個元素(頭端)的迭代器(const)  
dq.end();	//回傳指向最後一個元素(尾端)的迭代器  
dq.cend();	//回傳指向最後一個元素(尾端)的迭代器(const)  
dq.rbegin();	//回傳指向最後一個元素(尾端)的反向迭代器  
dq.crbegin();	//回傳指向最後一個元素(尾端)的反向迭代器(const)  
dq.rend();	//回傳指向第一個元素(頭端)的反向迭代器  
dq.crend();	//回傳指向第一個元素(頭端)的反向迭代器(const)
```

```tip
deque两端访问,两端插入,两端删除。 
```

```note
auto it = d.begin();其全名為std::deque<int>::iterator it = d.begin();
```