---
title: pandas(大水文)
date: 2022-02-05 17:01:25
tags:
	- 水文
	- 科学计算库
categories: 科学计算库
---
大水文罢了。😁😁😁😁😅
```python
import pandas as pd
```

### Series 操作

#### Series 创建


```python
t=pd.Series([1,2,3,4,5])#Series是一维的数据，带标签的数组
t#第一列为索引 第二列是我们的数据
```




    0    1
    1    2
    2    3
    3    4
    4    5
    dtype: int64




```python
t2=pd.Series([1,2,3,4,5],index=['a','b','c','d','e'])
t2#index里面为索引
```




    a    1
    b    2
    c    3
    d    4
    e    5
    dtype: int64




```python
#通过字典来创建Series   
temp_dict={"name":"wangsheng",
            "age":100,
            "tel":10086}
t3=pd.Series(temp_dict)
t3
```




    name    wangsheng
    age           100
    tel         10086
    dtype: object



#### Series 切片和索引


```python
t3
```




    name    wangsheng
    age           100
    tel         10086
    dtype: object




```python
t3["age"]
```




    100




```python
t3['tel']
```




    10086




```python
print(t3[0])
t3[2]
```

    wangsheng





    10086




```python
t3[:2]#连续
```




    name    wangsheng
    age           100
    dtype: object




```python
t3[[1,2]]#不连续取值
```




    age      100
    tel    10086
    dtype: object




```python
t3[["age",'tel']]
```




    age      100
    tel    10086
    dtype: object




```python
t
```




    0    1
    1    2
    2    3
    3    4
    4    5
    dtype: int64




```python
t[t>3]#找出t大于3的数据
```




    3    4
    4    5
    dtype: int64




```python
t3.index#获取索引
```




    Index(['name', 'age', 'tel'], dtype='object')




```python
t3.values#获取数据
```




    array(['wangsheng', 100, 10086], dtype=object)



#### 读取外部数据


```python
df=pd.read_csv("./dogNames2.csv")
print(df.head())
row=df["Row_Labels"]
print(row.shape)
```

      Row_Labels  Count_AnimalName
    0          1                 1
    1          2                 2
    2      40804                 1
    3      90201                 1
    4      90203                 1
    (16220,)


### DataFrame


```python
import numpy as np
pd.DataFrame(np.arange(12).reshape((3,-1)))
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>



DataFrame对象既有行索引，又有列索引
行索引，表明不同行，横向索引，叫index，0轴，axis=0

列索引，表名不同列，纵向索引，叫columns，1轴，axis=1



```python
pd.DataFrame(np.arange(12).reshape((3,-1)),index=['a','b','c'],columns=['A','B','C','D'])
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>b</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>c</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>



1.DataFrame和Series有什么关系呢？
DataFrame每一行是一个Series

2.Series能够传入字典，那么DataFrame能够传入字典作为数据么？那么mongodb的数据是不是也可以这样传入呢？




```python
d1={"name":["xiaoming","xiaogang"],
    "age":[28,19],
    "tel":[10086,10010]}
pd.DataFrame(d1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>28</td>
      <td>10086</td>
    </tr>
    <tr>
      <th>1</th>
      <td>xiaogang</td>
      <td>19</td>
      <td>10010</td>
    </tr>
  </tbody>
</table>
</div>




```python
d2=[{"name":"xiaoming","age":32,"tel":10086},
    {"name":"xiaogang","tel":78},
    {"name":"ss","age":10}]
a=pd.DataFrame(d2)#DataFrame可以有缺失值
a
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>32.0</td>
      <td>10086.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>xiaogang</td>
      <td>NaN</td>
      <td>78.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ss</td>
      <td>10.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



#### DataFrame属性

|属性|含义|
|-|-|
|df.shape|行数，列数|
|df.dtypes|列数据类型|
|df.ndim|数据维度|
|df.index|行索引|
|df.columns|列索引|
|df.values|对象值，是二维ndarray数组|

DataFrame整体情况查询
|函数|作用|
|-|-|
|df.head(3)|显示头部几行，默认五行|
|df.tail(2)|显示尾部几行，默认5行|
|df.info()|相关信息概述：行数，列数，列索引，列非空值个数，列类型，行类型，内存占用|
|df.describe()|快速综合统计结果：计数，均值，标准差，最大值，四分位数，最小值|


```python
df=pd.read_csv("./dogNames2.csv")
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Row_Labels</th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>40804</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>90201</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>90203</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>16220.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>6.558631</td>
    </tr>
    <tr>
      <th>std</th>
      <td>31.862511</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>1195.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 16220 entries, 0 to 16219
    Data columns (total 2 columns):
     #   Column            Non-Null Count  Dtype 
    ---  ------            --------------  ----- 
     0   Row_Labels        16217 non-null  object
     1   Count_AnimalName  16220 non-null  int64 
    dtypes: int64(1), object(1)
    memory usage: 253.6+ KB



```python
#DataFrame排序方法
df=df.sort_values(by="Count_AnimalName")#默认从小到大排序
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Row_Labels</th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9383</th>
      <td>MERINO</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9384</th>
      <td>MERISE</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9386</th>
      <td>MERLEDEZ</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9389</th>
      <td>MERLYN</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
df=df.sort_values(by="Count_AnimalName",ascending=False)#从大到小排序
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Row_Labels</th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1156</th>
      <td>BELLA</td>
      <td>1195</td>
    </tr>
    <tr>
      <th>9140</th>
      <td>MAX</td>
      <td>1153</td>
    </tr>
    <tr>
      <th>2660</th>
      <td>CHARLIE</td>
      <td>856</td>
    </tr>
    <tr>
      <th>3251</th>
      <td>COCO</td>
      <td>852</td>
    </tr>
    <tr>
      <th>12368</th>
      <td>ROCKY</td>
      <td>823</td>
    </tr>
  </tbody>
</table>
</div>



#### DataFrame取行或取列


```python
df[:10]#取前二十行
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Row_Labels</th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1156</th>
      <td>BELLA</td>
      <td>1195</td>
    </tr>
    <tr>
      <th>9140</th>
      <td>MAX</td>
      <td>1153</td>
    </tr>
    <tr>
      <th>2660</th>
      <td>CHARLIE</td>
      <td>856</td>
    </tr>
    <tr>
      <th>3251</th>
      <td>COCO</td>
      <td>852</td>
    </tr>
    <tr>
      <th>12368</th>
      <td>ROCKY</td>
      <td>823</td>
    </tr>
    <tr>
      <th>8417</th>
      <td>LOLA</td>
      <td>795</td>
    </tr>
    <tr>
      <th>8552</th>
      <td>LUCKY</td>
      <td>723</td>
    </tr>
    <tr>
      <th>8560</th>
      <td>LUCY</td>
      <td>710</td>
    </tr>
    <tr>
      <th>2032</th>
      <td>BUDDY</td>
      <td>677</td>
    </tr>
    <tr>
      <th>3641</th>
      <td>DAISY</td>
      <td>649</td>
    </tr>
  </tbody>
</table>
</div>




```python
df["Count_AnimalName"][:10]#取前20行Count_AnimalNames列
```




    1156     1195
    9140     1153
    2660      856
    3251      852
    12368     823
    8417      795
    8552      723
    8560      710
    2032      677
    3641      649
    Name: Count_AnimalName, dtype: int64



pandas取行或取列注意点：
    -方括号写数字，表示对行进行操作
    - 方括号写字符串，表示对列进行操作

#### loc索引

df.loc 通过标签索引行数据
df.iloc 通过位置获取行数据



```python
t=pd.DataFrame(np.arange(12).reshape((3,-1)),index=["a",'b','c'],columns=['W','X',"Y",'Z'])
t
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>W</th>
      <th>X</th>
      <th>Y</th>
      <th>Z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>b</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>c</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
t.loc['a']#取a行
```




    W    0
    X    1
    Y    2
    Z    3
    Name: a, dtype: int32




```python
t.loc['a','Z']#取a行z列
```




    3




```python
t.loc[['a','c'],['W','Z']]#取间隔的多行多列
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>W</th>
      <th>Z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>c</th>
      <td>8</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
t.loc['a':'c','W':'Y']#可以看出，冒号在loc中是闭合的
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>W</th>
      <th>X</th>
      <th>Y</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>b</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <th>c</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
t.iloc[0]#按位置取第一行
```




    W    0
    X    1
    Y    2
    Z    3
    Name: a, dtype: int32




```python
t.iloc[:,2]#去第二列
```




    a     2
    b     6
    c    10
    Name: Y, dtype: int32




```python
t.iloc[[0,2],[1,2]]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>X</th>
      <th>Y</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>c</th>
      <td>9</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
t.iloc[0:2]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>W</th>
      <th>X</th>
      <th>Y</th>
      <th>Z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>b</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>




```python
t.loc["a","Y"]=100
t#赋值改变数据
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>W</th>
      <th>X</th>
      <th>Y</th>
      <th>Z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>100</td>
      <td>3</td>
    </tr>
    <tr>
      <th>b</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>c</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>



#### bool索引


```python
df[(df["Count_AnimalName"]>800)&(df["Count_AnimalName"]<1000)]#大于800小于100
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Row_Labels</th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2660</th>
      <td>CHARLIE</td>
      <td>856</td>
    </tr>
    <tr>
      <th>3251</th>
      <td>COCO</td>
      <td>852</td>
    </tr>
    <tr>
      <th>12368</th>
      <td>ROCKY</td>
      <td>823</td>
    </tr>
  </tbody>
</table>
</div>




```python
#假如我们想找到所有的使用次数超过700并且名字的字符串的长度大于4的狗的名字
df[(df["Row_Labels"].str.len()>4)&(df["Count_AnimalName"]>800)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Row_Labels</th>
      <th>Count_AnimalName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1156</th>
      <td>BELLA</td>
      <td>1195</td>
    </tr>
    <tr>
      <th>2660</th>
      <td>CHARLIE</td>
      <td>856</td>
    </tr>
    <tr>
      <th>12368</th>
      <td>ROCKY</td>
      <td>823</td>
    </tr>
  </tbody>
</table>
</div>



![](https://cdn.jsdelivr.net/gh/liwangshengya/picture/img/202202051658740.png)

#### 缺失数据处理


```python
a
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>32.0</td>
      <td>10086.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>xiaogang</td>
      <td>NaN</td>
      <td>78.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ss</td>
      <td>10.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.isnull(a)#判断是否为nan
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>1</th>
      <td>False</td>
      <td>True</td>
      <td>False</td>
    </tr>
    <tr>
      <th>2</th>
      <td>False</td>
      <td>False</td>
      <td>True</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.notnull(a)#判断是否不为nan
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>True</td>
      <td>True</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1</th>
      <td>True</td>
      <td>False</td>
      <td>True</td>
    </tr>
    <tr>
      <th>2</th>
      <td>True</td>
      <td>True</td>
      <td>False</td>
    </tr>
  </tbody>
</table>
</div>



处理方式1：删除NaN所在的行列dropna (axis=0, how='any', inplace=False)
处理方式2：填充数据，t.fillna(t.mean()),t.fiallna(t.median()),t.fillna(0)


处理为0的数据：t[t==0]=np.nan
当然并不是每次为0的数据都需要处理
计算平均值等情况，nan是不参与计算的，但是0会



```python
#处理方式1
a.dropna(axis=0)#默认情况下将有nan的行全删了
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>32.0</td>
      <td>10086.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
a.dropna(axis=0,how='all')#当一行全部为nan才会删除 为“any’只要有就删除
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>32.0</td>
      <td>10086.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>xiaogang</td>
      <td>NaN</td>
      <td>78.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ss</td>
      <td>10.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
### 方式2
a.fillna(a.mean())
```

    : FutureWarning: Dropping of nuisance columns in DataFrame reductions (with 'numeric_only=None') is deprecated; in a future version this will raise TypeError.  Select only valid columns before calling the reduction.
      a.fillna(a.mean())





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>32.0</td>
      <td>10086.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>xiaogang</td>
      <td>21.0</td>
      <td>78.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ss</td>
      <td>10.0</td>
      <td>5082.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
a['age']=a['age'].fillna(a["age"].mean())
a#将age列的nan替换为age列的平均值
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>age</th>
      <th>tel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>xiaoming</td>
      <td>32.0</td>
      <td>10086.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>xiaogang</td>
      <td>21.0</td>
      <td>78.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ss</td>
      <td>10.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



### pandas 数据合并与分组聚合


```python
df=pd.read_csv("./IMDB-Movie-Data.csv")
print(df.head(1))
df.info()
```

       Rank                    Title                    Genre  \
    0     1  Guardians of the Galaxy  Action,Adventure,Sci-Fi   
    
                                             Description    Director  \
    0  A group of intergalactic criminals are forced ...  James Gunn   
    
                                                  Actors  Year  Runtime (Minutes)  \
    0  Chris Pratt, Vin Diesel, Bradley Cooper, Zoe S...  2014                121   
    
       Rating   Votes  Revenue (Millions)  Metascore  
    0     8.1  757074              333.13       76.0  
    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 1000 entries, 0 to 999
    Data columns (total 12 columns):
     #   Column              Non-Null Count  Dtype  
    ---  ------              --------------  -----  
     0   Rank                1000 non-null   int64  
     1   Title               1000 non-null   object 
     2   Genre               1000 non-null   object 
     3   Description         1000 non-null   object 
     4   Director            1000 non-null   object 
     5   Actors              1000 non-null   object 
     6   Year                1000 non-null   int64  
     7   Runtime (Minutes)   1000 non-null   int64  
     8   Rating              1000 non-null   float64
     9   Votes               1000 non-null   int64  
     10  Revenue (Millions)  872 non-null    float64
     11  Metascore           936 non-null    float64
    dtypes: float64(3), int64(4), object(5)
    memory usage: 93.9+ KB


统计电影分类情况
思路：重新构造一个全为0的数组，列名为分类，如果某一条数据中分类出现过，就让0变为1



```python
#统计分类的列表
temp_list=df["Genre"].str.split(",").tolist()
print(temp_list[:5])
```

    [['Action', 'Adventure', 'Sci-Fi'], ['Adventure', 'Mystery', 'Sci-Fi'], ['Horror', 'Thriller'], ['Animation', 'Comedy', 'Family'], ['Action', 'Adventure', 'Fantasy']]



```python
genre_list=list(set([i for j in temp_list for i in j]))#set为集合可以去重
print(genre_list)#获得分类列表
```

    ['Horror', 'Animation', 'Action', 'Thriller', 'History', 'Adventure', 'Family', 'Mystery', 'War', 'Sport', 'Fantasy', 'Sci-Fi', 'Comedy', 'Crime', 'Biography', 'Music', 'Romance', 'Musical', 'Western', 'Drama']



```python
#构造全为0的数组
zero_df=pd.DataFrame(np.zeros((df.shape[0],len(genre_list))),columns=genre_list)
zero_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Horror</th>
      <th>Animation</th>
      <th>Action</th>
      <th>Thriller</th>
      <th>History</th>
      <th>Adventure</th>
      <th>Family</th>
      <th>Mystery</th>
      <th>War</th>
      <th>Sport</th>
      <th>Fantasy</th>
      <th>Sci-Fi</th>
      <th>Comedy</th>
      <th>Crime</th>
      <th>Biography</th>
      <th>Music</th>
      <th>Romance</th>
      <th>Musical</th>
      <th>Western</th>
      <th>Drama</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#给出每个电影分类出现的位置赋值为1
for i in range(df.shape[0]):
    zero_df.loc[i,temp_list[i]]=1
    #zero_df.loc[i,['Action', 'Adventure', 'Sci-Fi']]
zero_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Horror</th>
      <th>Animation</th>
      <th>Action</th>
      <th>Thriller</th>
      <th>History</th>
      <th>Adventure</th>
      <th>Family</th>
      <th>Mystery</th>
      <th>War</th>
      <th>Sport</th>
      <th>Fantasy</th>
      <th>Sci-Fi</th>
      <th>Comedy</th>
      <th>Crime</th>
      <th>Biography</th>
      <th>Music</th>
      <th>Romance</th>
      <th>Musical</th>
      <th>Western</th>
      <th>Drama</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#统计每个分类电影的和
genre_count=zero_df.sum(axis=0)
genre_count
```




    Horror       119.0
    Animation     49.0
    Action       303.0
    Thriller     195.0
    History       29.0
    Adventure    259.0
    Family        51.0
    Mystery      106.0
    War           13.0
    Sport         18.0
    Fantasy      101.0
    Sci-Fi       120.0
    Comedy       279.0
    Crime        150.0
    Biography     81.0
    Music         16.0
    Romance      141.0
    Musical        5.0
    Western        7.0
    Drama        513.0
    dtype: float64




```python
#排序
genre_count.sort_values()
```




    Musical        5.0
    Western        7.0
    War           13.0
    Music         16.0
    Sport         18.0
    History       29.0
    Animation     49.0
    Family        51.0
    Biography     81.0
    Fantasy      101.0
    Mystery      106.0
    Horror       119.0
    Sci-Fi       120.0
    Romance      141.0
    Crime        150.0
    Thriller     195.0
    Adventure    259.0
    Comedy       279.0
    Action       303.0
    Drama        513.0
    dtype: float64



#### 数组合并之join

默认情况下将行索引相同的数据合并到一起


```python
df1=pd.DataFrame(np.ones((2,4)),index=['A','B'],columns=['a','b','c','d'])
df1
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2=pd.DataFrame(np.zeros((3,3)),index=['A','B','C'],columns=['x','y','z'])
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>x</th>
      <th>y</th>
      <th>z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>C</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.join(df2)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>x</th>
      <th>y</th>
      <th>z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2=pd.DataFrame(np.zeros((3,3)),index=['A','B','C'],columns=['x','y','z'])
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>x</th>
      <th>y</th>
      <th>z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>C</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.join(df2)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>x</th>
      <th>y</th>
      <th>z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2.join(df1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>x</th>
      <th>y</th>
      <th>z</th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>C</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



#### 数据合并之merge

merge:按照指定的列把数据按照一定的方式合并到一起



```python
df3=pd.DataFrame(np.zeros((3,3)),columns=['f','a','x'])
df3
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>f</th>
      <th>a</th>
      <th>x</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.merge(df3,on='a')#为空集，应为默认的合并方式为inner 交集
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>f</th>
      <th>x</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>




```python
df3.loc[1,'a']=1
df1.merge(df3,on='a')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>f</th>
      <th>x</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df3=pd.DataFrame(np.arange(9).reshape((3,3)),columns=['f','a','x'])
print(df3)
df1.merge(df3,on='a')
```

       f  a  x
    0  0  1  2
    1  3  4  5
    2  6  7  8





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>f</th>
      <th>x</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
left = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
                                  'A': ['A0', 'A1', 'A2', 'A3'],
                                  'B': ['B0', 'B1', 'B2', 'B3']})
right = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
                                    'C': ['C0', 'C1', 'C2', 'C3'],
                                    'D': ['D0', 'D1', 'D2', 'D3']})
left
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>A</th>
      <th>B</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>A0</td>
      <td>B0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K1</td>
      <td>A1</td>
      <td>B1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K2</td>
      <td>A2</td>
      <td>B2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K3</td>
      <td>A3</td>
      <td>B3</td>
    </tr>
  </tbody>
</table>
</div>




```python
right
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>C0</td>
      <td>D0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K1</td>
      <td>C1</td>
      <td>D1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K2</td>
      <td>C2</td>
      <td>D2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K3</td>
      <td>C3</td>
      <td>D3</td>
    </tr>
  </tbody>
</table>
</div>




```python
left.merge(right,on='key')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>A0</td>
      <td>B0</td>
      <td>C0</td>
      <td>D0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K1</td>
      <td>A1</td>
      <td>B1</td>
      <td>C1</td>
      <td>D1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K2</td>
      <td>A2</td>
      <td>B2</td>
      <td>C2</td>
      <td>D2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K3</td>
      <td>A3</td>
      <td>B3</td>
      <td>C3</td>
      <td>D3</td>
    </tr>
  </tbody>
</table>
</div>




```python
left = pd.DataFrame({'key1': ['K0', 'K0', 'K1', 'K2'],
                             'key2': ['K0', 'K1', 'K0', 'K1'],
                             'A': ['A0', 'A1', 'A2', 'A3'],
                             'B': ['B0', 'B1', 'B2', 'B3']})
right = pd.DataFrame({'key1': ['K0', 'K1', 'K1', 'K2'],
                              'key2': ['K0', 'K0', 'K0', 'K0'],
                              'C': ['C0', 'C1', 'C2', 'C3'],
                              'D': ['D0', 'D1', 'D2', 'D3']})
left
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>A</th>
      <th>B</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>K0</td>
      <td>A0</td>
      <td>B0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K0</td>
      <td>K1</td>
      <td>A1</td>
      <td>B1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K1</td>
      <td>K0</td>
      <td>A2</td>
      <td>B2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K2</td>
      <td>K1</td>
      <td>A3</td>
      <td>B3</td>
    </tr>
  </tbody>
</table>
</div>




```python
right
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>K0</td>
      <td>C0</td>
      <td>D0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K1</td>
      <td>K0</td>
      <td>C1</td>
      <td>D1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K1</td>
      <td>K0</td>
      <td>C2</td>
      <td>D2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K2</td>
      <td>K0</td>
      <td>C3</td>
      <td>D3</td>
    </tr>
  </tbody>
</table>
</div>




```python
left.merge(right,on=['key1','key2'],how='outer')
#how = ['left', 'right', 'outer', 'inner']
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>K0</td>
      <td>A0</td>
      <td>B0</td>
      <td>C0</td>
      <td>D0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K0</td>
      <td>K1</td>
      <td>A1</td>
      <td>B1</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K1</td>
      <td>K0</td>
      <td>A2</td>
      <td>B2</td>
      <td>C1</td>
      <td>D1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K1</td>
      <td>K0</td>
      <td>A2</td>
      <td>B2</td>
      <td>C2</td>
      <td>D2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>K2</td>
      <td>K1</td>
      <td>A3</td>
      <td>B3</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>K2</td>
      <td>K0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C3</td>
      <td>D3</td>
    </tr>
  </tbody>
</table>
</div>




```python
left.merge(right,on=['key1','key2'],how='right')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>A</th>
      <th>B</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>K0</td>
      <td>A0</td>
      <td>B0</td>
      <td>C0</td>
      <td>D0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K1</td>
      <td>K0</td>
      <td>A2</td>
      <td>B2</td>
      <td>C1</td>
      <td>D1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>K1</td>
      <td>K0</td>
      <td>A2</td>
      <td>B2</td>
      <td>C2</td>
      <td>D2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>K2</td>
      <td>K0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C3</td>
      <td>D3</td>
    </tr>
  </tbody>
</table>
</div>




```python
# handle overlapping
boys = pd.DataFrame({'k': ['K0', 'K1', 'K2'], 'age': [1, 2, 3]})
girls = pd.DataFrame({'k': ['K0', 'K0', 'K3'], 'age': [4, 5, 6]})
res = pd.merge(boys, girls, on='k', suffixes=['_boy', '_girl'], how='inner')
res
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>k</th>
      <th>age_boy</th>
      <th>age_girl</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>K0</td>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>K0</td>
      <td>1</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>



#### 数据分组聚合

如果我想知道美国的星巴克数量和中国的哪个多，或者我想知道中国每个省份星巴克的数量的情况，


```python
df=pd.read_csv('.\starbucks_store_worldwide.csv')
df.head(1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Store Number</th>
      <th>Store Name</th>
      <th>Ownership Type</th>
      <th>Street Address</th>
      <th>City</th>
      <th>State/Province</th>
      <th>Country</th>
      <th>Postcode</th>
      <th>Phone Number</th>
      <th>Timezone</th>
      <th>Longitude</th>
      <th>Latitude</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Starbucks</td>
      <td>47370-257954</td>
      <td>Meritxell, 96</td>
      <td>Licensed</td>
      <td>Av. Meritxell, 96</td>
      <td>Andorra la Vella</td>
      <td>7</td>
      <td>AD</td>
      <td>AD500</td>
      <td>376818720</td>
      <td>GMT+1:00 Europe/Andorra</td>
      <td>1.53</td>
      <td>42.51</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.info()#phone number,postcode等有缺失
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 25600 entries, 0 to 25599
    Data columns (total 13 columns):
     #   Column          Non-Null Count  Dtype  
    ---  ------          --------------  -----  
     0   Brand           25600 non-null  object 
     1   Store Number    25600 non-null  object 
     2   Store Name      25600 non-null  object 
     3   Ownership Type  25600 non-null  object 
     4   Street Address  25598 non-null  object 
     5   City            25585 non-null  object 
     6   State/Province  25600 non-null  object 
     7   Country         25600 non-null  object 
     8   Postcode        24078 non-null  object 
     9   Phone Number    18739 non-null  object 
     10  Timezone        25600 non-null  object 
     11  Longitude       25599 non-null  float64
     12  Latitude        25599 non-null  float64
    dtypes: float64(2), object(11)
    memory usage: 2.5+ MB


在pandas中类似的分组的操作我们有很简单的方式来完成

df.groupby(by="columns_name")




```python
grouped=df.groupby(by="Country")
type(grouped)
#DataFrameGroupBy类型
    #可以进行遍历
#for i in grouped:
 #   print(i)#每个i是一个元组，第一个元素为国家，第二个是DataFrame
    #调用聚会方法
grouped.count()[:2]#默认对所有列进行统计
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Brand</th>
      <th>Store Number</th>
      <th>Store Name</th>
      <th>Ownership Type</th>
      <th>Street Address</th>
      <th>City</th>
      <th>State/Province</th>
      <th>Postcode</th>
      <th>Phone Number</th>
      <th>Timezone</th>
      <th>Longitude</th>
      <th>Latitude</th>
    </tr>
    <tr>
      <th>Country</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>AD</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>AE</th>
      <td>144</td>
      <td>144</td>
      <td>144</td>
      <td>144</td>
      <td>144</td>
      <td>144</td>
      <td>144</td>
      <td>24</td>
      <td>78</td>
      <td>144</td>
      <td>144</td>
      <td>144</td>
    </tr>
  </tbody>
</table>
</div>




```python
grouped["Country"].count()[:3]#只对Country列进行统计
```




    Country
    AD      1
    AE    144
    AR    108
    Name: Country, dtype: int64




```python
country_count=grouped["Brand"].count()
print(country_count["US"])
country_count["CN"]
```

    13608





    2734




```python
#统计中国每个省分国家店铺数量
china_data=df[df["Country"]=="CN"]
grouped=china_data.groupby(by="State/Province").count()["Brand"]
grouped[:4]
```




    State/Province
    11    236
    12     58
    13     24
    14      8
    Name: Brand, dtype: int64



![](https://cdn.jsdelivr.net/gh/liwangshengya/picture/img/202202051700056.png)


```python
# 数据按照多个条件进行分组
grouped = df["Brand"].groupby(by=[df["Country"],df["State/Province"]])
print(grouped)
```

    <pandas.core.groupby.generic.SeriesGroupBy object at 0x000001CA9031CF40>



```python
# 数据按照多个条件进行分组后，任然返回DataFrame
t1 = df[["Country"]].groupby(by=[df["Country"],df["State/Province"]]).count()
t2 = df.groupby(by=["Country","State/Province"])[["Country"]].count()
print(type(t1),type(t2))
t1.head()

```

    <class 'pandas.core.frame.DataFrame'> <class 'pandas.core.frame.DataFrame'>





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
    
    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>Country</th>
    </tr>
    <tr>
      <th>Country</th>
      <th>State/Province</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>AD</th>
      <th>7</th>
      <td>1</td>
    </tr>
    <tr>
      <th rowspan="4" valign="top">AE</th>
      <th>AJ</th>
      <td>2</td>
    </tr>
    <tr>
      <th>AZ</th>
      <td>48</td>
    </tr>
    <tr>
      <th>DU</th>
      <td>82</td>
    </tr>
    <tr>
      <th>FU</th>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



#### pandas时间序列


```python
pd.date_range(start='20220101',end='20220227',freq='D')#按一天
```




    DatetimeIndex(['2022-01-01', '2022-01-02', '2022-01-03', '2022-01-04',
                   '2022-01-05', '2022-01-06', '2022-01-07', '2022-01-08',
                   '2022-01-09', '2022-01-10', '2022-01-11', '2022-01-12',
                   '2022-01-13', '2022-01-14', '2022-01-15', '2022-01-16',
                   '2022-01-17', '2022-01-18', '2022-01-19', '2022-01-20',
                   '2022-01-21', '2022-01-22', '2022-01-23', '2022-01-24',
                   '2022-01-25', '2022-01-26', '2022-01-27', '2022-01-28',
                   '2022-01-29', '2022-01-30', '2022-01-31', '2022-02-01',
                   '2022-02-02', '2022-02-03', '2022-02-04', '2022-02-05',
                   '2022-02-06', '2022-02-07', '2022-02-08', '2022-02-09',
                   '2022-02-10', '2022-02-11', '2022-02-12', '2022-02-13',
                   '2022-02-14', '2022-02-15', '2022-02-16', '2022-02-17',
                   '2022-02-18', '2022-02-19', '2022-02-20', '2022-02-21',
                   '2022-02-22', '2022-02-23', '2022-02-24', '2022-02-25',
                   '2022-02-26', '2022-02-27'],
                  dtype='datetime64[ns]', freq='D')



![](https://cdn.jsdelivr.net/gh/liwangshengya/picture/img/202202051700963.png)

我们可以使用pandas提供的方法把时间字符串转化为时间序列

df["timeStamp"] = pd.to_datetime(df["timeStamp"],format="")

format参数大部分情况下可以不用写，但是对于pandas无法格式化的时间字符串，我们可以使用该参数，比如包含中文




```python
pd.date_range(start='20220101',end='20220227',freq='10D')#按10天
```




    DatetimeIndex(['2022-01-01', '2022-01-11', '2022-01-21', '2022-01-31',
                   '2022-02-10', '2022-02-20'],
                  dtype='datetime64[ns]', freq='10D')

