#now 返回当前系统日期+时间
SELECT NOW(); -- 2019-06-02 22:21:38

#curdate 返回当前系统日期，不包含时间
SELECT CURDATE(); -- 2019-06-02

#curtime 返回当前时间，不包含日期
SELECT CURTIME(); -- 22:23:04

#可以获取指定的部分，年、月、日、小时、分钟、秒
SELECT YEAR(NOW());
SELECT MONTH('2019-09-18');
SELECT MONTHNAME(NOW());
SELECT DISTINCT YEAR(hiredate)
FROM employees;

#str_to_date 将字符通过指定的格式转换成日期
SELECT STR_TO_DATE('1998-02-28','%Y-%c-%d');

#查询入职日期为1992--4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-04-03';

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
SELECT last_name,DATE_FORMAT(hiredate,'%m月%d日%Y年') 入职日期
FROM employees
WHERE commission_pct IS NOT NULL;

#其他函数
SELECT VERSION();
SELECT DATABASE();
SELECT USER();

