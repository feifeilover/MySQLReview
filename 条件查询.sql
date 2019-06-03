#案例1：查询工资>12000的员工信息
SELECT *
FROM employees
WHERE salary > 12000;

#案例2：查询部门编号不等于90号的员工名和部门编号
SELECT last_name,department_id
FROM employees 
WHERE department_id <> 90;

#案例3：查询工资z在10000到20000之间的员工名、工资以及奖金
SELECT last_name,salary,IFNULL(commission_pct,0) commission_pct
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

#案例4：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT *
FROM employees
WHERE (department_id < 90
        OR department_id > 110)
     OR salary > 15000;
     
#案例5：查询员工名中包含字符a的员工信息
SELECT *
FROM employees
WHERE last_name LIKE '%a%';

#案例6：查询员工名中第三个字符为n，第五个字符为l的员工名和工资
SELECT
  last_name,
  salary
FROM employees
WHERE last_name LIKE '__n_l%';

#案例7：查询员工名中第二个字符为_的员工名
SELECT
  last_name
FROM employees
WHERE last_name LIKE '_$_%'ESCAPE '$';

#案例8：查询员工编号在100到120之间的员工信息
SELECT *
FROM employees
WHERE employee_id BETWEEN 100
    AND 200;
    
#案例9：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
SELECT
  last_name,
  job_id
FROM employees
WHERE job_id IN('it_prog','ad_vp','ad_pres');

#案例10：查询没有奖金的员工名和奖金率
SELECT
  last_name,
  commission_pct
FROM employees
WHERE commission_pct IS NULL;

#案例11：查询有奖金的员工名和奖金率
SELECT
  last_name,
  commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;