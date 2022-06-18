# wechat_flutter
![dart](https://img.shields.io/badge/dart-2.16-blue.svg)
![flutter](https://img.shields.io/badge/flutter-2.10-blue.svg) 
![get](https://img.shields.io/badge/get-4.6-blue.svg)
![star](https://img.shields.io/github/stars/wslynn/wechat_flutter?style=social)


## 1 项目简介
仿微信即时通信软件(基于GetX和Flutter框架)
![](https://img.gejiba.com/images/660ff7cde6d11c49e1ca7c8340a4057a.gif)


## 2 common目录说明
- apis: 访问服务器的接口封装
- entities: 网络请求与响应体结构
- langs: 国际化多语言翻译
- middlewares: 中间件, 如是否登录鉴权
- mock: 模拟的假数据, 渲染到界面上展示效果
- models: 请求与响应的结构体
- routes: app路由配置
- store: 本地数据存储, 调用utils/storage
- utils: 跟业务逻辑无关的工具包
    - storage: 根据平台不同, 存储数据到cookie或本机路径等
    - http: http请求封装
    - loading: 加载页面


## 3 后端接口文档
[ApiPost接口文档](https://console-docs.apipost.cn/preview/6c245af8bcc075c4/42820335d3df842c)
欢迎各位flutter同学多多PR, 
如果需要添加接口, 请邮箱联系我: ws156858@163.com

## 4 数据库访问
MySQL数据库: 101.42.134.18:3306
账号: guest
密码: 123456
> 注意: 
本数据库账号仅有读权限, 所有写操作均通过`Http`或`Websocket`接口实现

![13456e16319b7ba652f4374297f9dce6.png](https://img.gejiba.com/images/13456e16319b7ba652f4374297f9dce6.png)


## 5 接下来的开发计划
+ [ ] 添加好友
+ [ ] 同意好友申请
+ [ ] 聊天页上拉自动获取历史消息
+ [ ] 修改密码
+ [ ] 修改用户信息
+ [ ] 消息页按最后时间倒序
+ [ ] 前端发送消息时websocket断线重连
+ [ ] 重连后拉取离线消息
+ [ ] 支持发送图片和视频

空闲时间会继续更新, 直至实现微信的大部分功能, 也欢迎各位大佬PR~