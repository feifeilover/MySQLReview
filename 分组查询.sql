#案例1：查询每个工种的员工平均工资
SELECT AVG(salary),job_id
FROM employees
GROUP BY job_id;

#案例2：查询每个城市的部门个数
SELECT COUNT(country_id),city
FROM locations
GROUP BY city;

#案例3：查询邮箱中包含a字符的 每个部门的最高工资
SELECT MAX(salary),department_id
FROM employees 
WHERE email LIKE '%a%'
GROUP BY department_id;

#案例4：查询有奖金的每个领导手下员工的平均工资
SELECT AVG(salary),manager_id
FROM employees
WHERE commission_pct IS NOT NULL 
GROUP BY manager_id;

#案例5：查询哪个部门的员工个数>5
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

#案例6：每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
SELECT MAX(salary),job_id
FROM employees 
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary) > 12000;

#案例7：领导编号>102的每个领导手下的最低工资大于5000的领导编号和最低工资
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id > 102
GROUP BY manager_id
HAVING MIN(salary) > 5000;

#案例8：每个工种有奖金的员工的最高工资>6000的工种编号和最高工资,按最高工资升序
SELECT job_id,MAX(salary)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary) > 6000
ORDER BY MAX(salary) ASC;

#案例9：查询每个工种每个部门的最低工资,并按最低工资降序
SELECT MIN(salary) m,job_id,department_id
FROM employees
GROUP BY job_id,department_id
ORDER BY m DESC;

#10.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，没有管理者的员工不计算在内
SELECT MIN(salary) m ,manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING m>=6000;

#11.查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
SELECT department_id,COUNT(*),AVG(salary) a
FROM employees
GROUP BY department_id
ORDER BY a DESC;