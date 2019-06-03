#1.length 获取参数值的字节个数
SELECT LENGTH('john'); -- 4
SELECT LENGTH('啦啦啦hahahaha'); -- 17

#2.concat 拼接字符串
SELECT CONCAT(last_name,'_',first_name) 姓名 FROM employees;

#示例：将姓变大写，名变小写，然后拼接
SELECT CONCAT(UPPER(last_name),LOWER(first_name)) FROM employees;

SELECT SUBSTR('abcdef',5)  put; -- ef
SELECT SUBSTR('abcdef',1,3) put; -- abc

#案例：姓名中首字符大写，其他字符小写然后用_拼接，显示出来
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),'_',LOWER(SUBSTR(last_name,2))) FROM employees;

#5.instr 返回子串第一次出现的索引，如果找不到返回0
SELECT INSTR('啦啦你是啦啦','你是'); -- 3
SELECT INSTR('啦啦你是啦啦','啦啦'); -- 1

#去除前后空格
SELECT TRIM('    嘻嘻    '); --  嘻嘻 

#7.lpad 用指定的字符实现左填充指定长度
SELECT LPAD('哈哈',8,'*'); -- ******哈哈
#replace 替换
SELECT REPLACE('哈哈嘻嘻嘻啦啦啦呜呜呜哈哈','哈哈','999');