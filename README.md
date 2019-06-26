# Hanser
hanser的直播提醒

一个linux下监听直播状态并推送提醒的服务（学习一下systemd守护进程）

博文:[守护全世界最好的烤箱--systemd学习](https://xuranus.github.io/2019/06/26/%E5%AE%88%E6%8A%A4%E5%85%A8%E4%B8%96%E7%95%8C%E6%9C%80%E5%A5%BD%E7%9A%84%E7%83%A4%E7%AE%B1-systemd%E5%AD%A6%E4%B9%A0/)

# INSTALL
先在`hanser.service`配置中配置自己的环境变量和用户（等我搞懂了linux X11机制后再改）
```
sudo ./INSTALL
sudo systemctl start hanser
sudo systemctl enable hanser
```

## UNINSTALL
```
sudo ./UNINSTALL
```
