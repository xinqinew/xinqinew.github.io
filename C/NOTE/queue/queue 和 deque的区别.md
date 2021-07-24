# queue 和 deque的区别
从使用的角度来讲主要差别就是：

deque支持push_front、pop_front、push_back、pop_back。

queue支持push_back、pop_front。

----------------------------------------------------------------------------

deque是双端队列
```cpp
#include<deque>
 
template<typename T,typename Allocator=std::allocator<T>>class deque;
```
支持push_front、pop_front、push_back、pop_back等几种操作的。queue是容器适配器，他的声明是
```cpp
#include<queue>
 
template<typename T,typename Container=std::deque<T>>class queue;
```

类型Container是用来存储元素的，相当于是这个queue的实现。这个queue模板看起来像是包装了这个Container类型，只提供一些特殊的接口，使他看起来想一个queue。

模板参数Container需要满足顺序容器的条件，而且必须支持front、back、push_back、pop_front操作，标准容器中有deque和list满足。也就是说标准容器中deque和list可以封装成queue。
 
![](https://img-blog.csdn.net/20180829201223861?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NjY1MTA0/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![](https://img-blog.csdn.net/20180829201135774?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4NjY1MTA0/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

---

![](https://img-blog.csdnimg.cn/20190406203950233.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI1ODAwMzEx,size_16,color_FFFFFF,t_70)

![](https://img-blog.csdnimg.cn/20190406205040470.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI1ODAwMzEx,size_16,color_FFFFFF,t_70)

![](https://img-blog.csdnimg.cn/20190406205429576.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI1ODAwMzEx,size_16,color_FFFFFF,t_70)

![](https://img-blog.csdnimg.cn/20190406205445522.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI1ODAwMzEx,size_16,color_FFFFFF,t_70)



 



