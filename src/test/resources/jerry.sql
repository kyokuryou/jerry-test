create database jerry;
use jerry;
-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
  `create_org` int(11) NOT NULL COMMENT '创建组织',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
  `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `failure_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败次数',
  `locked_date` datetime DEFAULT NULL COMMENT '锁定时间',
  `account_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '帐号过期 : 0:否;1:是',
  `account_locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '帐号锁定 : 账号是否锁定;0:否;1:是',
  `password_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '密码过期 : 0:否;1:是',
  `password_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '密码修改时间',
  `org_id` int(11) NOT NULL COMMENT '组织ID',
  `inner_data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内部数据 : 0:否;1:是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='帐号表';

-- ----------------------------
-- Records of sys_account
-- ----------------------------
BEGIN;
INSERT INTO `sys_account` VALUES (1, 1, 1, 1, '2020-01-21 06:03:25', NULL, NULL, NULL, '00000000000000000000000000000000', '系统管理员', 'admin', '5549db7929989f1606e379f3a9c7de8a', 0, NULL, 0, 0, 0, '2999-12-31 00:00:00', 1, 1);
INSERT INTO `sys_account` VALUES (2, 1, 1, 1, '2020-02-05 13:45:17', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '测试', 'test', '234b64f5e4c0b45fd87845e4f85d7a24', 0, NULL, 0, 0, 0, '2999-12-31 00:00:00', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
  `create_org` int(11) NOT NULL COMMENT '创建组织',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
  `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `content` varchar(600) DEFAULT NULL COMMENT '内容',
  `parent_id` int(11) NOT NULL COMMENT '父级ID',
  `leaf` tinyint(1) NOT NULL COMMENT '叶子节点 : (0:否,1:是)',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Table structure for sys_finder
-- ----------------------------
DROP TABLE IF EXISTS `sys_finder`;
CREATE TABLE `sys_finder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
  `create_org` int(11) NOT NULL COMMENT '创建组织',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
  `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
  `mapping_name` varchar(50) NOT NULL COMMENT '映射编码',
  `mapping_id` int(11) NOT NULL COMMENT '映射ID',
  `media_type` varchar(50) DEFAULT NULL COMMENT '媒体类型',
  `full_name` varchar(100) NOT NULL COMMENT '资源全名 : 资源全名（文件名+后缀）',
  `size` int(11) NOT NULL COMMENT '资源尺寸 : 资源尺寸',
  `file_id` varchar(200) NOT NULL COMMENT '资源标记 : 资源标记',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='资源管理器';

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
  `create_org` int(11) NOT NULL COMMENT '创建组织',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
  `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级ID',
  `leaf` tinyint(1) NOT NULL COMMENT '叶子节点 : (0:否,1:是)',
  `sort` int(11) NOT NULL COMMENT '排序',
  `type` int(1) NOT NULL COMMENT '组织类型 : 0:系统;1:平台;2:公司企业;3:子公司企业;4:部门',
  `inner_data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内部数据 : 0:否;1:是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='组织结构表';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
BEGIN;
INSERT INTO `sys_organization` VALUES (1, 1, 0, 1, '2020-01-21 06:03:25', NULL, NULL, NULL, '00000000000000000000000000000000', '系统机构', 0, 0, 1, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
  `create_org` int(11) NOT NULL COMMENT '创建组织',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
  `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `leaf` tinyint(1) NOT NULL DEFAULT '0' COMMENT '叶子节点 : (0:否,1:是)',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `target` varchar(20) DEFAULT NULL COMMENT '接口名',
  `path` varchar(100) DEFAULT NULL COMMENT '路径',
  `platform` int(1) NOT NULL COMMENT '所属平台',
  `inner_data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内部数据 : 0:否;1:是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `target` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource` VALUES (1, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '系统设置', 0, 0, 'mdi-cogs', 1, NULL, NULL, 1, 1);
INSERT INTO `sys_resource` VALUES (2, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '组织结构', 1, 1, 'fa fa-sitemap', 1, 'organization', 'application/organization', 1, 1);
INSERT INTO `sys_resource` VALUES (3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '角色权限', 1, 1, 'fa fa-gavel', 2, 'role', 'application/role', 1, 1);
INSERT INTO `sys_resource` VALUES (4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '资源管理', 1, 1, 'fa fa-life-ring', 3, 'resource', 'application/resource', 1, 1);
INSERT INTO `sys_resource` VALUES (5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '帐号管理', 1, 1, 'fa fa-users', 4, 'account', 'application/account', 1, 1);
INSERT INTO `sys_resource` VALUES (6, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '数据字典', 1, 1, 'fa fa-code-fork', 5, 'dictionary', 'application/dictionary', 1, 1);
INSERT INTO `sys_resource` VALUES (7, 1, 1, 1, '2020-02-05 13:30:07', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '示例', 0, 0, 'fa fa-info-circle', 2, NULL, NULL, 1, 0);
INSERT INTO `sys_resource` VALUES (8, 1, 1, 1, '2020-02-05 13:37:15', NULL, 1, '2020-05-09 11:12:18', '1fc83a09a651f5bf02e3e01064becce9', '演示', 7, 1, 'fa fa-cubes', 1, 'testDemo', 'example/demo', 1, 0);
INSERT INTO `sys_resource` VALUES (9, 1, 1, 1, '2020-02-14 15:01:41', NULL, 1, '2020-05-09 11:14:38', 'bef7391f6d4a72330b33446d4140f300', '说明', 7, 1, 'fa fa-question', 4, 'testExplain', 'example/explain', 1, 0);
INSERT INTO `sys_resource` VALUES (10, 1, 1, 1, '2020-02-29 13:50:28', NULL, 1, '2020-07-12 13:57:16', 'db2883d5f032d326e56b7f4d896e51e9', 'test', 7, 1, 'fa fa-address-book-o', 5, 'testExample', '/example/test', 1, 0);
INSERT INTO `sys_resource` VALUES (12, 1, 1, 1, '2020-05-09 11:12:02', NULL, 1, '2020-05-09 11:12:55', '7febacd6f4adac1fefa28d1d941096d0', '文件管理器', 7, 1, 'fa fa-folder', 2, 'testFinder', 'example/finder', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
  `create_org` int(11) NOT NULL COMMENT '创建组织',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
  `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `remarks` varchar(600) DEFAULT NULL COMMENT '备注',
  `inner_data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内部数据 : 0:否;1:是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '超级管理员', 'SUPER_ADMIN', '拥有系统所有权限', 1);
INSERT INTO `sys_role` VALUES (2, 1, 1, 1, '2020-02-05 13:37:37', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '示例', '728f9dd0', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_account_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_log`;
CREATE TABLE `sys_account_log` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
    `create_org` int(11) NOT NULL COMMENT '创建组织',
    `create_user` int(11) NOT NULL COMMENT '创建人',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
    `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
    `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
    `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
    `hostname` varchar(50) NOT NULL COMMENT '主机名称',
    `username` varchar(50) NOT NULL COMMENT '用户名',
    `account_status` enum('PASSWORD INCORRECT','PASSWORD EXPIRED','ACCOUNT DISABLED','ACCOUNT LOCKED','ACCOUNT UNLOCKED','SUCCEED') NOT NULL COMMENT '创建状态',
    `platform` int(1) NOT NULL COMMENT '所属平台',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='帐号日志表';

-- ----------------------------
-- Table structure for sys_account_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_role`;
CREATE TABLE `sys_account_role` (
    `account_id` int(11) NOT NULL COMMENT '帐号主键',
    `role_id` int(11) NOT NULL COMMENT '角色主键',
    KEY `SYS_ACCOUNT_ROLE_IX1` (`account_id`),
    KEY `SYS_ACCOUNT_ROLE_IX2` (`role_id`),
    CONSTRAINT `SYS_ACCOUNT_ROLE_FK1` FOREIGN KEY (`account_id`) REFERENCES `sys_account` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `SYS_ACCOUNT_ROLE_FK2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帐号角色表';

-- ----------------------------
-- Records of sys_account_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_account_role` VALUES (1, 1);
INSERT INTO `sys_account_role` VALUES (2, 2);
COMMIT;
-- ----------------------------
-- Table structure for sys_organization_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization_role`;
CREATE TABLE `sys_organization_role` (
    `org_id` int(11) NOT NULL COMMENT '组织主键',
    `role_id` int(11) NOT NULL COMMENT '角色主键',
    KEY `SYS_ORGANIZATION_ROLE_IX1` (`org_id`),
    KEY `SYS_ORGANIZATION_ROLE_IX2` (`role_id`),
    CONSTRAINT `SYS_ORGANIZATION_ROLE_FK1` FOREIGN KEY (`org_id`) REFERENCES `sys_organization` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `SYS_ORGANIZATION_ROLE_FK2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织角色表';

-- ----------------------------
-- Records of sys_organization_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_organization_role` VALUES (1, 1);
COMMIT;
-- ----------------------------
-- Table structure for sys_resource_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_perm`;
CREATE TABLE `sys_resource_perm` (
     `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
     `resource_id` int(11) NOT NULL COMMENT '资源主键',
     `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 : 0:否;1:是',
     `create_org` int(11) NOT NULL COMMENT '创建组织',
     `create_user` int(11) NOT NULL COMMENT '创建人',
     `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
     `modify_org` int(11) DEFAULT NULL COMMENT '修改组织',
     `modify_user` int(11) DEFAULT NULL COMMENT '修改人',
     `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
     `access_code` char(32) DEFAULT NULL COMMENT '更新验证码',
     `name` varchar(50) NOT NULL COMMENT '名称',
     `method` varchar(20) NOT NULL COMMENT '方法',
     `remarks` varchar(600) DEFAULT NULL COMMENT '备注',
     `inner_data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内部数据 : 0:否;1:是',
     PRIMARY KEY (`id`),
     UNIQUE KEY `resource_id` (`resource_id`,`method`),
     KEY `SYS_RESOURCE_PERM_IX1` (`resource_id`),
     CONSTRAINT `SYS_RESROUCE_PERM_FK` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='资源权限表';

-- ----------------------------
-- Records of sys_resource_perm
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource_perm` VALUES (1, 2, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '列表', 'list', '组织结构:列表', 1);
INSERT INTO `sys_resource_perm` VALUES (2, 2, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '详细', 'detail', '组织结构:详细', 1);
INSERT INTO `sys_resource_perm` VALUES (3, 2, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '创建', 'create', '组织结构:创建', 1);
INSERT INTO `sys_resource_perm` VALUES (4, 2, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改', 'modify', '组织结构:修改', 1);
INSERT INTO `sys_resource_perm` VALUES (5, 2, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '删除', 'remove', '组织结构:删除', 1);
INSERT INTO `sys_resource_perm` VALUES (6, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '列表', 'list', '角色权限:列表', 1);
INSERT INTO `sys_resource_perm` VALUES (7, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '详细', 'detail', '角色权限:详细', 1);
INSERT INTO `sys_resource_perm` VALUES (8, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '创建', 'create', '角色权限:创建', 1);
INSERT INTO `sys_resource_perm` VALUES (9, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改', 'modify', '角色权限:修改', 1);
INSERT INTO `sys_resource_perm` VALUES (10, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '删除', 'remove', '角色权限:删除', 1);
INSERT INTO `sys_resource_perm` VALUES (11, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '列出权限', 'listPerm', '角色权限:列出权限', 1);
INSERT INTO `sys_resource_perm` VALUES (12, 3, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '关联权限', 'referencesPerm', '角色权限:关联权限', 1);
INSERT INTO `sys_resource_perm` VALUES (13, 4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '列表', 'list', '资源管理:列表', 1);
INSERT INTO `sys_resource_perm` VALUES (14, 4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '详细', 'detail', '资源管理:详细', 1);
INSERT INTO `sys_resource_perm` VALUES (15, 4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '创建', 'create', '资源管理:创建', 1);
INSERT INTO `sys_resource_perm` VALUES (16, 4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改', 'modify', '资源管理:修改', 1);
INSERT INTO `sys_resource_perm` VALUES (17, 4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '删除', 'remove', '资源管理:删除', 1);
INSERT INTO `sys_resource_perm` VALUES (18, 4, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改权限', 'modifyPerm', '资源管理:修改权限', 1);
INSERT INTO `sys_resource_perm` VALUES (19, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '列表', 'list', '帐号管理:列表', 1);
INSERT INTO `sys_resource_perm` VALUES (20, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '详细', 'detail', '帐号管理:详细', 1);
INSERT INTO `sys_resource_perm` VALUES (21, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '创建', 'create', '帐号管理:创建', 1);
INSERT INTO `sys_resource_perm` VALUES (22, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改', 'modify', '帐号管理:修改', 1);
INSERT INTO `sys_resource_perm` VALUES (23, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '删除', 'remove', '帐号管理:删除', 1);
INSERT INTO `sys_resource_perm` VALUES (24, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '重置密码', 'resetPassword', '帐号管理:重置密码', 1);
INSERT INTO `sys_resource_perm` VALUES (25, 5, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '强制下线', 'forceOffline', '帐号管理:强制下线', 1);
INSERT INTO `sys_resource_perm` VALUES (26, 6, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '列表', 'list', '数据字典:列表', 1);
INSERT INTO `sys_resource_perm` VALUES (27, 6, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '详细', 'detail', '数据字典:详细', 1);
INSERT INTO `sys_resource_perm` VALUES (28, 6, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '创建', 'create', '数据字典:创建', 1);
INSERT INTO `sys_resource_perm` VALUES (29, 6, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改', 'modify', '数据字典:修改', 1);
INSERT INTO `sys_resource_perm` VALUES (30, 6, 1, 1, 1, '2020-01-21 06:03:24', NULL, NULL, NULL, '00000000000000000000000000000000', '修改字典项', 'modifyItem', '数据字典:修改字典项', 1);
INSERT INTO `sys_resource_perm` VALUES (31, 8, 1, 1, 1, '2020-02-05 13:37:15', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '更新', 'modify', '文件管理器：更新', 0);
INSERT INTO `sys_resource_perm` VALUES (32, 9, 1, 1, 1, '2020-02-14 15:02:44', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '展示', 'view', NULL, 0);
INSERT INTO `sys_resource_perm` VALUES (33, 10, 1, 1, 1, '2020-03-10 14:34:25', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', 'list', 'list', NULL, 0);
INSERT INTO `sys_resource_perm` VALUES (34, 10, 1, 1, 1, '2020-03-10 14:34:25', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', 'create', 'create', NULL, 0);
INSERT INTO `sys_resource_perm` VALUES (35, 12, 1, 1, 1, '2020-05-09 11:12:55', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '展示', 'view', NULL, 0);
INSERT INTO `sys_resource_perm` VALUES (36, 1, 1, 1, 1, '2020-05-09 11:14:27', NULL, NULL, NULL, '99914b932bd37a50b983c5e7c90ae93b', '展示', 'view', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm` (
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `resource_perm_id` int(11) NOT NULL COMMENT '资源权限主键',
  KEY `SYS_ROLE_PERM_IX1` (`role_id`),
  KEY `SYS_ROLE_PERM_IX2` (`resource_perm_id`),
  CONSTRAINT `SYS_ROLE_PERM_FK1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `SYS_ROLE_PERM_FK2` FOREIGN KEY (`resource_perm_id`) REFERENCES `sys_resource_perm` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源权限表';

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_perm` VALUES (1, 1);
INSERT INTO `sys_role_perm` VALUES (1, 2);
INSERT INTO `sys_role_perm` VALUES (1, 3);
INSERT INTO `sys_role_perm` VALUES (1, 4);
INSERT INTO `sys_role_perm` VALUES (1, 5);
INSERT INTO `sys_role_perm` VALUES (1, 6);
INSERT INTO `sys_role_perm` VALUES (1, 7);
INSERT INTO `sys_role_perm` VALUES (1, 8);
INSERT INTO `sys_role_perm` VALUES (1, 9);
INSERT INTO `sys_role_perm` VALUES (1, 10);
INSERT INTO `sys_role_perm` VALUES (1, 11);
INSERT INTO `sys_role_perm` VALUES (1, 12);
INSERT INTO `sys_role_perm` VALUES (1, 13);
INSERT INTO `sys_role_perm` VALUES (1, 14);
INSERT INTO `sys_role_perm` VALUES (1, 15);
INSERT INTO `sys_role_perm` VALUES (1, 16);
INSERT INTO `sys_role_perm` VALUES (1, 17);
INSERT INTO `sys_role_perm` VALUES (1, 18);
INSERT INTO `sys_role_perm` VALUES (1, 19);
INSERT INTO `sys_role_perm` VALUES (1, 20);
INSERT INTO `sys_role_perm` VALUES (1, 21);
INSERT INTO `sys_role_perm` VALUES (1, 22);
INSERT INTO `sys_role_perm` VALUES (1, 23);
INSERT INTO `sys_role_perm` VALUES (1, 24);
INSERT INTO `sys_role_perm` VALUES (1, 25);
INSERT INTO `sys_role_perm` VALUES (1, 26);
INSERT INTO `sys_role_perm` VALUES (1, 27);
INSERT INTO `sys_role_perm` VALUES (1, 28);
INSERT INTO `sys_role_perm` VALUES (1, 29);
INSERT INTO `sys_role_perm` VALUES (1, 30);
INSERT INTO `sys_role_perm` VALUES (2, 31);
INSERT INTO `sys_role_perm` VALUES (2, 32);
INSERT INTO `sys_role_perm` VALUES (2, 35);
COMMIT;

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `PRIMARY_ID` char(36) NOT NULL COMMENT 'PRIMARY_ID',
  `SESSION_ID` char(36) NOT NULL COMMENT 'SESSION_ID',
  `CREATION_TIME` bigint(20) NOT NULL COMMENT 'CREATION_TIME',
  `LAST_ACCESS_TIME` bigint(20) NOT NULL COMMENT 'LAST_ACCESS_TIME',
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL COMMENT 'MAX_INACTIVE_INTERVAL',
  `EXPIRY_TIME` bigint(20) NOT NULL COMMENT 'EXPIRY_TIME',
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL COMMENT 'PRINCIPAL_NAME',
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SYS_SESSION_IX1` (`SESSION_ID`),
  KEY `SYS_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SYS_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sys_session';

-- ----------------------------
-- Table structure for sys_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `sys_session_attributes`;
CREATE TABLE `sys_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL COMMENT 'SESSION_PRIMARY_ID',
  `ATTRIBUTE_NAME` varchar(200) NOT NULL COMMENT 'ATTRIBUTE_NAME',
  `ATTRIBUTE_BYTES` blob NOT NULL COMMENT 'ATTRIBUTE_BYTES',
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SYS_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `sys_session` (`PRIMARY_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sys_session_attributes';

