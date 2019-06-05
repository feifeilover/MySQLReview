USE girls;

#1.插入到admin中五条记录
SELECT * FROM admin;
DESC admin;
DELIMITER $
CREATE PROCEDURE myp1()
BEGIN 
	INSERT INTO admin(username,`password`) 
	VALUES('zhangsan','123'),('lisi','333'),('wangwu','222'),('zhaoliu','444'),('jiaqi','555');
END $;

CALL myp1();

#2.删除admin中的两条记录
DELIMITER $
CREATE PROCEDURE myp2()
BEGIN 
	DELETE FROM admin WHERE id IN (2,3,4,5);
END $;

CALL myp2();

#案例1：创建存储过程实现 根据女神名，查询对应的男神信息
DELIMITER $
CREATE PROCEDURE myp3(IN beauty_name VARCHAR(20))
BEGIN 
	SELECT bo.*
	FROM beauty b
	LEFT JOIN boys bo
	ON b.boyfriend_id = bo.id
	WHERE b.name = beauty_name;
END $

CALL myp3('热巴');

#案例1：根据输入的女神名，返回对应的男神名
DELIMITER $
CREATE PROCEDURE myp4(IN beauty_name VARCHAR(20),OUT bo_name VARCHAR(20))
BEGIN 
	SELECT bo.boyname
	FROM beauty b
	LEFT JOIN boys bo
	ON b.boyfriend_id = bo.id
	WHERE b.name = beauty_name;
END $

CALL myp4('热巴',@NAME);

#案例1：传入a和b两个值，最终a和b都翻倍并返回
DELIMITER $
CREATE PROCEDURE myp5(INOUT a INT,INOUT b INT)
BEGIN 
	SET a = a*2;
	SET b = b*2;
END $

SET @m=10;
SET @n=20;
CALL myp5(@m,@n);
SELECT @m,@n;

#输入两个数，求和
DELIMITER $
CREATE PROCEDURE myp6(INOUT a INT,INOUT b INT,OUT c INT)
BEGIN 
	SET c = a+b;
END $

SET @m=10;
SET @n=90;
CALL myp6(@m,@n,@k);
SELECT @k;