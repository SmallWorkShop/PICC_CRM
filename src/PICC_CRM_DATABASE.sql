/*创建数据库：PICC_CRM_DATABASE 并定义编码格式为UTF-8*/
CREATE DATABASE IF NOT EXISTS PICC_CRM_DATABASE DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
use PICC_CRM_DATABASE;
/*创建表：T_CUST_INFO*/
-- ----------------------------
-- Table structure for `t_cust_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_cust_info`;
CREATE TABLE `t_cust_info` (
  `CUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLATE_NO` char(10) DEFAULT NULL,
  `BRAND` varchar(100) DEFAULT NULL,
  `BRAND_TYP` varchar(20) DEFAULT NULL,
  `FRAME_NO` varchar(30) DEFAULT NULL,
  `ENGINE_NO` varchar(20) DEFAULT NULL,
  `CUS_ID_NO` varchar(20) DEFAULT NULL,
  `CUS_NME` varchar(155) DEFAULT NULL,
  `CUS_ADDR` varchar(255) DEFAULT NULL,
  `CUS_TEL` varchar(20) DEFAULT NULL,
  `CUS_PHON` varchar(20) DEFAULT NULL,
  `LOG_DATE` varchar(20) DEFAULT NULL,
  `CUS_STS` char(2) DEFAULT NULL,
  `BUSIER_ID` int(11) DEFAULT NULL,
  `ISSU_ID` int(11) DEFAULT NULL,
  `DIST_ID` int(11) DEFAULT NULL,
  `INSUR_ID` int(11) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_CUST_INFO:客户基本信息表';

-- ----------------------------
-- Records of t_cust_info
-- ----------------------------
/*创建表：T_INSUR_INFO*/
-- ----------------------------
-- Table structure for `t_insur_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_insur_info`;
CREATE TABLE `t_insur_info` (
  `INSUR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUS_ID` int(11) DEFAULT NULL,
  `ST_DATE` date DEFAULT NULL,
  `EX_DATE` date DEFAULT NULL,
  `INSUR_COM` varchar(255) DEFAULT NULL,
  `CHL` char(2) DEFAULT NULL,
  `ADDR` varchar(255) DEFAULT NULL,
  `DIST_DATE` varchar(20) DEFAULT NULL,
  `GIFT` varchar(255) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`INSUR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_INSUR_INFO:保单信息表';

-- ----------------------------
-- Records of t_insur_info
-- ----------------------------
/*创建表：T_INS_INFO*/
-- ----------------------------
-- Table structure for `t_ins_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_ins_info`;
CREATE TABLE `t_ins_info` (
  `INS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INS_NME` varchar(255) DEFAULT NULL,
  `INS_KND` char(2) DEFAULT NULL,
  `INS_AMT` decimal(15,2) DEFAULT NULL,
  `INS_STS` char(1) DEFAULT NULL,
  `INS_S_AMT` decimal(15,2) DEFAULT NULL,
  `INS_LIM` decimal(15,2) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`INS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_INS_INFO:险种信息表';

-- ----------------------------
-- Records of t_ins_info
-- ----------------------------
/*创建表：T_CUST_INS*/
-- ----------------------------
-- Table structure for `t_cust_ins`
-- ----------------------------
DROP TABLE IF EXISTS `t_cust_ins`;
CREATE TABLE `t_cust_ins` (
  `CUST_INS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUS_ID` int(11) DEFAULT NULL,
  `INS_ID` int(11) DEFAULT NULL,
  `INS_AMT` decimal(15,2) DEFAULT NULL,
  `INS_S_AMT` decimal(15,2) DEFAULT NULL,
  `INS_LIM` varchar(20) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CUST_INS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_CUST_INS:客户险种信息';

-- ----------------------------
-- Records of t_cust_ins
-- ----------------------------
/*创建表：T_BUSI_JRN*/
-- ----------------------------
-- Table structure for `t_busi_jrn`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_jrn`;
CREATE TABLE `t_busi_jrn` (
  `JRN_NO` int(11) NOT NULL AUTO_INCREMENT,
  `AC_DTE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OPER_NO` char(4) DEFAULT NULL,
  `OPER_NME` varchar(50) DEFAULT NULL,
  `CUS_ID` int(11) DEFAULT NULL,
  `PLATE_NO` char(10) DEFAULT NULL,
  `FRAME_NO` varchar(30) DEFAULT NULL,
  `CUS_NME` varchar(155) DEFAULT NULL,
  `BUSIER_ID` int(11) DEFAULT NULL,
  `OPER_INFO` varchar(255) DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`JRN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_BUSI_JRN:业务日志表';

-- ----------------------------
-- Records of t_busi_jrn
-- ----------------------------
/*创建表：T_SERV_INFO*/
-- ----------------------------
-- Table structure for `t_serv_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_serv_info`;
CREATE TABLE `t_serv_info` (
  `SERV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUS_ID` int(11) DEFAULT NULL,
  `AC_DTE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DEAL_COD` char(4) DEFAULT NULL,
  `DEAL_NME` varchar(50) DEFAULT NULL,
  `ADDR` varchar(255) DEFAULT NULL,
  `AMT` decimal(15,2) DEFAULT NULL,
  `DEAL_INFO` varchar(255) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SERV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_SERV_INFO:维修/保养日志信息表';

-- ----------------------------
-- Records of t_serv_info
-- ----------------------------
/*创建表：T_CONN_JRN*/
-- ----------------------------
-- Table structure for `t_conn_jrn`
-- ----------------------------
DROP TABLE IF EXISTS `t_conn_jrn`;
CREATE TABLE `t_conn_jrn` (
  `CONN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUS_ID` int(11) DEFAULT NULL,
  `AC_DTE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CONN_NUM` int(11) DEFAULT NULL,
  `NEXT_CONN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CONN_DETAIL` varchar(255) DEFAULT NULL,
  `STS` char(1) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CONN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_CONN_JRN:客户联系日志表';

-- ----------------------------
-- Records of t_conn_jrn
-- ----------------------------
/*创建表：T_USER_INFO*/
-- ----------------------------
-- Table structure for `t_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT,
  `U_CODE` varchar(50) DEFAULT NULL,
  `U_PWD` varchar(50) DEFAULT NULL,
  `U_P_ID` int(11) DEFAULT NULL,
  `U_TYP` char(2) DEFAULT NULL,
  `U_STS` char(2) DEFAULT NULL,
  `U_S_STS` char(2) DEFAULT NULL,
  `U_ADDR` varchar(255) DEFAULT NULL,
  `U_SCOP` varchar(255) DEFAULT NULL,
  `U_ROLE` varchar(125) DEFAULT NULL,
  `U_NME` varchar(100) DEFAULT NULL,
  `U_TP_ID` varchar(32) DEFAULT NULL,
  `U_TEL` varchar(20) DEFAULT NULL,
  `U_PHO` varchar(20) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_USER_INFO:用户信息表';

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
/*创建表：T_ROLE_INFO*/
-- ----------------------------
-- Table structure for `t_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_info`;
CREATE TABLE `t_role_info` (
  `R_ID` int(11) NOT NULL AUTO_INCREMENT,
  `R_CODE` varchar(50) DEFAULT NULL,
  `R_NME` varchar(150) DEFAULT NULL,
  `R_STS` char(2) DEFAULT NULL,
  `R_RIGHT` varchar(50) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`R_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_ROLE_INFO:角色信息表';

-- ----------------------------
-- Records of t_role_info
-- ----------------------------
/*创建表：T_FUNC*/
-- ----------------------------
-- Table structure for `t_func`
-- ----------------------------
DROP TABLE IF EXISTS `t_func`;
CREATE TABLE `t_func` (
  `FUNC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUNC_CODE` varchar(50) DEFAULT NULL,
  `FUNC_NME` varchar(100) DEFAULT NULL,
  `FUNC_S_NME` varchar(50) DEFAULT NULL,
  `P_FUNC_ID` int(11) DEFAULT NULL,
  `P_FUNC_CODE` varchar(50) DEFAULT NULL,
  `FUNC_IMG` varchar(100) DEFAULT NULL,
  `FUNC_URL` varchar(100) DEFAULT NULL,
  `FUNC_STS` char(2) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`FUNC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_FUNC:功能表';

-- ----------------------------
-- Records of t_func
-- ----------------------------
/*创建表：T_RIGHT*/
-- ----------------------------
-- Table structure for `t_right`
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right` (
  `TR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `R_ID` int(11) DEFAULT NULL,
  `FUNC_ID` int(11) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_RIGHT:权限表';

-- ----------------------------
-- Records of t_right
-- ----------------------------
/*创建表：T_DICT*/
-- ----------------------------
-- Table structure for `t_dict`
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `DICT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICT_KND` varchar(4) DEFAULT NULL,
  `DICT_KND_NME` varchar(100) DEFAULT NULL,
  `DICT_CODE` varchar(30) DEFAULT NULL,
  `DICT_NME` varchar(100) DEFAULT NULL,
  `DIST_P_CODE` varchar(30) DEFAULT NULL,
  `DIST_P_NME` varchar(100) DEFAULT NULL,
  `DIST_STS` char(1) DEFAULT NULL,
  `CRE_DATE` date DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `PRE_COL1` varchar(10) DEFAULT NULL,
  `PRE_COL2` varchar(10) DEFAULT NULL,
  `PRE_COL3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DICT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_DICT:数据字典';

-- ----------------------------
-- Records of t_dict
-- ----------------------------