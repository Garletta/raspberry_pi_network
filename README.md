# raspberry_pi_network
raspberry pi 树莓派 有线联网和无线WIFI 

  >Raspberry pi 3 Model B+  
  >OS：原装系统  
  >版本：Element 14  
  
## 连接无线网络（WIFI）  
图形界面右上角  

命令界面  
`sudo vim /etc/wpa_supplicant/wpa_supplicant.conf`  

在文件尾部增加如下内容：  

    network{   
      ssid="" //无线网名称   
      psk="" //无线网密码   
      key_mgmt=WPA-PSK  
    }  
  
## 有线连接网络  

在我的 `/etc/network/interfaces` 文件里是以下内容（注意最后一行）  

    # interfaces(5) file used by ifup(8) and ifdown(8)  
      
    # Please note that this file is written to be used with dhcpcd  
    # For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'  
      
    # Include files from /etc/network/interfaces.d:  
    source-directory /etc/network/interfaces.d  

到上一层目录找到 `interfaces.d` 目录，进入，有一个 `interfaces` 空文件，没有就新建一个，内容为：  

    auto lo  
    iface lo inet loopback  
    auto eth0  
    iface eth0 inet static  
      
    address 172.16.204.181  
       
    gateway 172.16.204.1  
    netmask 255.255.0.0  
    
  >address：你网线的IP（路由器局域网为192.168.x.x）  
  >gateway：你的网关  
  >netmask：你的掩码（如果是路由器局域网，就是255.255.255.0）  
  
  
# 树莓派的有线和无线不能同时使用
  >raspberry pi 据说是在电脑启动时就判定接入的网络，如果接入 eth0 成功就不会再去接入其他网络，否则再判断其他是否有网络可以接入，WIFI好像排在第三位。然后如果你同时使用有线和无线两种连接的话，基本上是无法上网的，反正我不行，查了一些博客都表示不可以。所以你只能选择其中一样。
  
  
## 断开 WIFI 接入

    sudo vim /etc/wpa_supplicant/wpa_supplicant.conf  

删掉如下内容：  

    network{   
      ssid="" //无线网名称   
      psk="" //无线网密码   
    }  
    
重新有线接入网络，重启电脑即可！

  
## 断开有线连接，接入WIFI  

    cd /etc/network/interfaces.d  
    sudo rm -rf interfaces  

注意不要删错了，重新接入WIFI，重启电脑即可！
