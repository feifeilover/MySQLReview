#1.查询表中的单个字段
SELECT
  first_name
FROM employees;

#2.查询表中的多个字段
SELECT
  first_name,
  last_name,
  job_id
FROM employees;

#3.查询表中的所有字段
SELECT *
FROM employees;

#4.查询常量值
SELECT
  90;
SELECT
  'Neena';
  
#5.查询表达式
SELECT
  100/30;
  
#6.查询函数
SELECT
  VERSION();
-- 查询当前数据库的版本号
SELECT
  DATABASE();
-- 查询当前数据库

#7.起别名
SELECT
  last_name AS 姓
FROM employees;
SELECT
  first_name AS 名
FROM employees;
SELECT
  last_name 姓
FROM employees;
-- 可以省略as
SELECT
  first_name AS "out put"
FROM employees;
-- 有特殊字符就用双引号引起来

#8.去重
#案例：查询员工表中涉及到的所有的部门编号
SELECT DISTINCT
  department_id
FROM employees;

#9.+号的作用
SELECT 122+22;
-- 144
SELECT '123'+90;
-- 213
SELECT 'join'+90;
-- 90
SELECT NULL+90;
-- null
#案例：查询员工名和姓连接成一个字段，并显示为 姓名
SELECT
  CONCAT(first_name,last_name) AS "姓名"
FROM employees;