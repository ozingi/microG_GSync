# microG_playStore_GoogleContactsSync_installer
# 如何优雅的使用GMS，为此我做了个食用Google服务的magisk懒人包。
## 开端
其实吧，我对google服务的需求并不大，我主要就是在play store下下软件，同步同步通讯录和用Google相机，所以我就在magisk仓库找到了microG体验了一下，挺好的，而且还有一个就是，之前我写的安装方法里的systemizer已经早就停止更新了，在android11用不了。
#### 总结一下就是
##### 1、省电
他不会像play服务一样常驻后台好多个进程，一般就1，2个进程在40m左右。
##### 2、兼容性强
GMS套件中的Google services framework是有安卓版本区别的，不会和play服务还有play store一样版本跨度大。而microG就不会有这个问题。
##### 3、自定义功能强大
Google的fcm消息推送服务可以自定义每个app的开关，也可以停用microG，
Google的各种服务可单独控制开关。

#### 当然也有不足

##### 1、兼容性有不足
因为GMS是“活的”应用，他需要迭代，虽然microG已经可以称作兼容性很强大了，但是这毕竟是一个开源项目，这种兼容是有滞后性的。> `“为爱发电，电力也有限”`
比如smart lock是不能使用的，这是我比较喜欢的一个功能，不过好在问题不大。
##### 2、安装使用比较繁琐
如果是原先有GMS的手机一定要卸载GMS才行，在酷安就有好多人给我反馈说装不上play store，或者play store安装好了play store也会连不上更新服务，Google账户的通讯录同步用不了之类的。而这些我也遇到过，要手动去卸载干净GMS再安装能解决，但是挺繁琐的，所以我想到了做个magisk模块吧，方便自己也能分享给大家，节约不必要的时间浪费。
## 实现
因为前几天下过一个支持安装过程用音量按键控制的magisk模块，这个音量按键控制的功能正好可以解决microG安装过程中是否需要执行清洁安装，所以马上在原有基础上改了起来，最后实现的效果如下，非常傻瓜式，看提示就能操作了。


<table>
  <tr>
  </tr>
  <tr>
    <td valign="top"><img src="https://img-blog.csdnimg.cn/e342d70f6f984fcc93d06529ae97411e.png"></td>
    <td valign="top"><img src="https://img-blog.csdnimg.cn/e342d70f6f984fcc93d06529ae97411e.png"></td>
  </tr>
 </table>


#### 功能描述
 1. 模块支持音量按键选择安装方式
 2. 支持清洁安装
 3. 安装时自动比较版本决定是否升级
 4. 支持旧机型按键校验
 5. 支持Google通讯录同步
 6. 在有Gapps的rom上也可以直接安装。
#### 下载链接
进qq群下载：273145623
也可以自己在GitHub下载：[microG_Sync](https://github.com/ozingi/microG_Sync)

### 🥰如果喜欢你也可以请我喝白开水🥰

### [打赏 / Donate](https://ozingi.github.io/img/payment/Alipay.jpg)
<img alt="图片笑死了" style="width:40% " src="https://ozingi.github.io/img/payment/Alipay.jpg"/>
## end
