# Spring Boot + Shiro + Jquery + Vue + ElementUI 整合框架 #

## 概述 ##
##### 问题： #####
前后端分离状态下，首屏百屏，跨域，权限控制，路由，数据同步和服务器重定向等问题。
##### 解决： #####
使用Freemarker，实现服务器渲染，页面挂载虚拟节点方式，数据统一格式进行无刷新交互，回话与服务器同步。

## 依赖库 ##
* jerry-context 基础结构化定义，插件对接定义
* jerry-web Web端服务代理
* jerry-web-public 页面模版，组件模版，前端核心
* jerry-shiro Web端权限服务代理
* jerry-data 数据处理（开发中）
* jerry-workflow 工作流（开发中）

## 内置页面 ##
* 帐号管理
* 角色权限
* 组织结构
* 资源配置
* 数据字典

## 内置功能 ##
* session共享
* 实现javax.persistence.*，jdbc ORM映射及Mybatis数据物理分页，单表增删改查免SQL
* 数据库高级查询
* 缓存实现（永久、延时及定时）
* 文件管理（本地及FTP）
* Office系列读写
* 树形构建
* 请求、响应数据转换
* 页面组件封装
* JS库动态加载
* 国际化
* 类型转换