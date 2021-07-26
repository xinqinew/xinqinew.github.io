# cin和cout输入输出
**简单的输入输出代码示例：**
```cpp

#include<iostream>
using namespace std;
int main(){
    int x;
    float y;
    cout<<"Please input an int number:"<<endl;
    cin>>x;
    cout<<"The int number is x= "<<x<<endl;
    cout<<"Please input a float number:"<<endl;
    cin>>y;
    cout<<"The float number is y= "<<y<<endl;   
    return 0;
}
```

运行结果如下（↙表示按下回车键）：  
> Please input an int number:  
> 8↙  
> The int number is x= 8  
> Please input a float number:  
> 7.4↙  
> The float number is y= 7.4  

***

**cin 连续输入示例**

```cpp

#include<iostream>
using namespace std;
int main(){
    int x;
    float y;
    cout<<"Please input an int number and a float number:"<<endl;
    cin>>x>>y;
    cout<<"The int number is x= "<<x<<endl;
    cout<<"The float number is y= "<<y<<endl;   
    return 0;
}

```

运行结果：  
> Please input an int number and a float number:  
> 8 7.4↙  
> The int number is x= 8  
> The float number is y= 7.4     