---
title: keras实现手写数字识别
date: 2022-02-11 12:02:07
tags:
    - Keras
    - TensorFlow
    - 神经网络
    - 机器学习
categories: 机器学习
---
#### TensorFlow和Kears的安装
Keras是基于TensorFlow和Theano（由加拿大蒙特利尔大学开发的机器学习框架）的深度学习库，是由纯python编写而成的高层神经网络API，也仅支持python开发。它是为了支持快速实践而对tensorflow或者Theano的再次封装，让我们可以不用关注过多的底层细节，能够把想法快速转换为结果。它也很灵活，且比较容易学。
在新版得TensorFlow中已经包含了Keras，所以我们只用安装TresorFlow即可。
TensorFlow安装：
```bash
#在终端或powershell中输入
pip install tensorflow #默认安装CPU和GPU版本
```
如果不是英伟达的GPU，由于不支持CUDA，安装GPU版本在调用时会报如下错误：
```bash
Could not load dynamic library 'libcudart.so.10.1'; dlerror: libcudart.so.10.1: cannot open shared object file: No such file or directory
2020-09-20 21:31:45.455738: I tensorflow/stream_executor/cuda/cudart_stub.cc:29] Ignore above cudart dlerror if you do not have a GPU set up on your machine.
```
所以这时我们只安装CPU版本即可
```bash
pip install tensorflow-cpu#只安装CPU版本
```
#### 使用Keras实现神经网络
##### 导包
```python
from tensorflow.python.keras.utils.np_utils import to_categorical
from keras import models, layers, regularizers
from tensorflow.keras.optimizers import RMSprop
from keras.datasets import mnist#导入数据集
import matplotlib.pyplot as plt
```

##### 数据导入
```python
(train_imgs,train_labels),(test_images,test_labels)=mnist.load_data()#加载数据集
print(train_imgs.shape,test_images.shape)#打印训练集样本数据特征
# print(train_imgs[0])#28*28
# print(train_labels[0])
plt.imshow(train_imgs[0])#打印图片 28*28像素图片
plt.show()
train_labels[:2]
```

    (60000, 28, 28) (10000, 28, 28)




![png](/img/Minst.png)






    array([5, 0], dtype=uint8)



##### 数据处理
```python
train_imgs=train_imgs.reshape((60000,28*28)).astype('float')#将60000*28*28 拍成一维向量 即（60000，28*28）
test_images=test_images.reshape((10000,28*28)).astype('float')
print(train_imgs.shape)
test_images.shape
```

    (60000, 784)





    (10000, 784)




```python
print(train_labels[:2])#对标签进行处理
train_labels=to_categorical(train_labels)#onehot编码
test_labels=to_categorical(test_labels)
print(train_labels.shape)
train_labels[:2]

```

    [5 0]
    (60000, 10)





    array([[0., 0., 0., 0., 0., 1., 0., 0., 0., 0.],
           [1., 0., 0., 0., 0., 0., 0., 0., 0., 0.]], dtype=float32)


##### 建立模型

```python
network=models.Sequential()#模型
#隐藏层
#Dense是全连接得
#activation激活函数
#input_shape是输入层大小
network.add(layers.Dense(units=15,activation='sigmoid',input_shape=(28*28,),))
#使用add来堆叠模型
network.add(layers.Dense(units=10,activation='sigmoid'))

```

    2022-02-10 22:37:39.194764: I tensorflow/core/platform/cpu_feature_guard.cc:151] This TensorFlow binary is optimized with oneAPI Deep Neural Network Library (oneDNN) to use the following CPU instructions in performance-critical operations:  AVX2 AVX512F FMA
    To enable them in other operations, rebuild TensorFlow with the appropriate compiler flags.


##### 编译训练模型
```python
#编译步骤
network.compile(optimizer=RMSprop(lr=0.001),loss='categorical_crossentropy',metrics=['accuracy'])
#训练网络
#epochs表示训练多少个回合，batch——size表示每次训练给多大得数据
network.fit(train_imgs,train_labels,epochs=20,batch_size=128,verbose=2)
#训练了大约100轮，在训练集上得正确率达到了0.9187
```

    Epoch 1/20
    469/469 - 2s - loss: 0.2825 - accuracy: 0.9192 - 2s/epoch - 5ms/step
    Epoch 2/20
    469/469 - 1s - loss: 0.2843 - accuracy: 0.9190 - 1s/epoch - 3ms/step
    Epoch 3/20
    469/469 - 1s - loss: 0.2847 - accuracy: 0.9186 - 1s/epoch - 3ms/step
    Epoch 4/20
    469/469 - 1s - loss: 0.2842 - accuracy: 0.9184 - 1s/epoch - 3ms/step
    Epoch 5/20
    469/469 - 1s - loss: 0.2818 - accuracy: 0.9176 - 1s/epoch - 3ms/step
    Epoch 6/20
    469/469 - 1s - loss: 0.2800 - accuracy: 0.9183 - 1s/epoch - 3ms/step
    Epoch 7/20
    469/469 - 1s - loss: 0.2809 - accuracy: 0.9196 - 1s/epoch - 3ms/step
    Epoch 8/20
    469/469 - 1s - loss: 0.2789 - accuracy: 0.9197 - 1s/epoch - 3ms/step
    Epoch 9/20
    469/469 - 1s - loss: 0.2767 - accuracy: 0.9198 - 1s/epoch - 3ms/step
    Epoch 10/20
    469/469 - 1s - loss: 0.2780 - accuracy: 0.9194 - 1s/epoch - 3ms/step
    Epoch 11/20
    469/469 - 1s - loss: 0.2776 - accuracy: 0.9193 - 1s/epoch - 3ms/step
    Epoch 12/20
    469/469 - 1s - loss: 0.2786 - accuracy: 0.9185 - 1s/epoch - 3ms/step
    Epoch 13/20
    469/469 - 1s - loss: 0.2789 - accuracy: 0.9179 - 1s/epoch - 3ms/step
    Epoch 14/20
    469/469 - 1s - loss: 0.2786 - accuracy: 0.9185 - 1s/epoch - 3ms/step
    Epoch 15/20
    469/469 - 1s - loss: 0.2794 - accuracy: 0.9198 - 1s/epoch - 3ms/step
    Epoch 16/20
    469/469 - 2s - loss: 0.2799 - accuracy: 0.9186 - 2s/epoch - 3ms/step
    Epoch 17/20
    469/469 - 1s - loss: 0.2793 - accuracy: 0.9185 - 1s/epoch - 3ms/step
    Epoch 18/20
    469/469 - 1s - loss: 0.2812 - accuracy: 0.9187 - 1s/epoch - 3ms/step
    Epoch 19/20
    469/469 - 1s - loss: 0.2824 - accuracy: 0.9185 - 1s/epoch - 3ms/step
    Epoch 20/20
    469/469 - 1s - loss: 0.2796 - accuracy: 0.9187 - 1s/epoch - 3ms/step





    <keras.callbacks.History at 0x7f1add8ffc40>




```python
#神将网络总统结构
print(network.summary())
#11775=28*28*15+15
# 160=15*10+10

```
##### 预测与评估

```python
#在测试集上测试一下模型性能
y_pre=network.predict(test_images[:5])
print(y_pre,test_labels[:5])

#评估模型
test_loss,test_accuracy=network.evaluate(test_images,test_labels)
print('test_loss:',test_loss,'      test_accuracy:',test_accuracy)
```

    [[3.7899613e-04 7.9274920e-05 6.9625974e-03 3.8788289e-02 5.3796172e-04
      2.1356046e-03 2.5246632e-07 9.4646072e-01 1.8450618e-04 2.1742195e-02]
     [4.7492981e-04 2.2884309e-03 1.4204246e-01 1.8988550e-03 5.1716688e-07
      4.8227012e-03 6.3610077e-04 9.9899953e-06 3.8048625e-03 3.6833579e-05]
     [5.9188955e-07 9.7502083e-01 1.5270770e-02 4.0745676e-02 4.2839492e-05
      1.5333742e-02 2.3275614e-04 2.7633309e-02 1.5907192e-01 1.4984608e-03]
     [9.5915210e-01 1.6660117e-05 5.6179762e-03 9.1245770e-04 9.8120026e-06
      3.5943031e-02 1.2471378e-03 7.6335669e-04 4.9379766e-03 2.2325516e-03]
     [6.8008900e-04 6.2575936e-04 9.1023445e-02 8.5565448e-03 9.9243879e-01
      1.0120630e-02 3.1238824e-02 5.0986111e-02 9.3790025e-02 4.2072201e-01]] [[0. 0. 0. 0. 0. 0. 0. 1. 0. 0.]
     [0. 0. 1. 0. 0. 0. 0. 0. 0. 0.]
     [0. 1. 0. 0. 0. 0. 0. 0. 0. 0.]
     [1. 0. 0. 0. 0. 0. 0. 0. 0. 0.]
     [0. 0. 0. 0. 1. 0. 0. 0. 0. 0.]]
    313/313 [==============================] - 1s 2ms/step - loss: 0.2939 - accuracy: 0.9143
    test_loss: 0.2938748896121979       test_accuracy: 0.9143000245094299
##### 添加正则化
``` bash
network.add(layers.Dense(units=128,activation='relu',input_shape=(28*28,),
                        kernel_regularizer=regularizers.l2(0.1)))
network.add(layers.Dense(units=30,activation='relu',kernel_regularizer=regularizers.L2(0.1)))
network.add(layers.Dense(units=10,activation='softmax'))
```
