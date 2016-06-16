-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill;
-- 使用数据库
USE seckill;

-- 创建秒杀库存表
CREATE TABLE seckill(
	`seckill_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
	`name` VARCHAR(120) NOT NULL COMMENT '商品名称',
	`number` INT NOT NULL COMMENT '库存数量',
	`start_time` TIMESTAMP NOT NULL COMMENT '秒杀开始时间',
	`end_time` TIMESTAMP NOT NULL COMMENT '秒杀结束时间',
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '秒杀创建时间',
	PRIMARY KEY (`seckill_id`),
	/*创建时间索引是为了以后时间查询的业务提供方便*/
	KEY `idx_start_time` (`start_time`),
	KEY `idx_end_time` (`end_time`),
	KEY `idx_create_time` (`create_time`)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表'

-- 初始化数据
INSERT INTO 
	seckill(name, number, start_time, end_time)
VALUES
	('1000元秒杀iphone6', 100, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
	('500元秒杀ipad2', 200, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
	('300元秒杀小米4', 300, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
	('200元秒杀红米note', 400, '2015-11-01 00:00:00', '2015-11-02 00:00:00')

-- 秒杀成功明细表
-- 用户登录认证相关的信息
CREATE TABLE success_killed(
	`seckill_id` BIGINT NOT NULL COMMENT '商品库存id',
	`user_phone` BIGINT NOT NULL COMMENT '用户手机号',
	`state` TINYINT NOT NULL DEFAULT -1 COMMENT '状态信息：-1无效，0成功，1已付款，2已发货',
	`create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
	PRIMARY KEY (`seckill_id`, `user_phone`),/*联合主键*/
	KEY `idx_create_time` (`create_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀库存表'

