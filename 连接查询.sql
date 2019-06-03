#案例1：查询员工名和对应的部门名
SELECT last_name,department_name
FROM employees e,departments d
WHERE d.department_id = e.department_id;

#2查询员工名、工种号、工种名
SELECT e.last_name,e.job_id,j.job_title
FROM employees e,jobs j
WHERE e.job_id = j.job_id;

#案例3：查询有奖金的员工名、部门名
SELECT e.last_name,d.department_name
FROM employees e,departments d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL;

#案例4：查询城市名中第二个字符为o的部门名和城市名
SELECT d.department_name,l.city
FROM departments d,locations l
WHERE d.location_id = l.location_id AND l.city LIKE '_o%';

#案例5：查询每个城市的部门个数
SELECT l.city,COUNT(*)
FROM departments d,locations l
WHERE d.location_id = l.location_id
GROUP BY l.city;

#案例6：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT e.manager_id,d.department_name,MIN(e.salary)
FROM employees e,departments d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL
GROUP BY d.department_name,d.manager_id;

#案例7：查询每个工种的工种名和员工的个数，并且按员工个数降序
SELECT j.job_title,COUNT(*)
FROM jobs j,employees e
WHERE j.job_id = e.job_id
GROUP BY j.job_title
ORDER BY COUNT(*) DESC;

#8.显示所有员工的姓名，部门号和部门名称。
SELECT e.last_name,e.department_id,d.department_name
FROM employees e,departments d 
WHERE e.department_id = d.department_id;

#9.查询90号部门员工的job_id和90号部门的location_id
SELECT e.job_id,d.location_id
FROM employees e,departments d
WHERE e.department_id = d.department_id
AND e.department_id = 90;

#10.选择所有有奖金的员工的
#last_name , department_name , location_id , city
SELECT e.last_name,d.department_name,d.location_id,l.city
FROM employees e,locations l,departments d
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
AND e.commission_pct IS NOT NULL;

#11.查询每个工种、每个部门的部门名、工种名和最低工资
SELECT d.department_name,j.job_title,MIN(e.salary)
FROM employees e,jobs j,departments d
WHERE d.department_id = e.department_id AND j.job_id = e.job_id
GROUP BY j.job_id,e.department_id;


---------------

#案例1.查询员工名、部门名
SELECT last_name,department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

#案例2.查询名字中包含e的员工名和工种名
SELECT last_name,job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE last_name LIKE '%e%';

#3. 查询部门个数>3的城市名和部门个数
SELECT city,COUNT(*) 部门个数
FROM locations l
INNER JOIN departments d
ON l.location_id = d.location_id
GROUP BY city
HAVING 部门个数 > 3;

#案例4.查询哪个部门的员工个数>3的部门名和员工个数，并按个数降序
SELECT department_name,COUNT(*)
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY department_name
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC;

#5.查询员工名、部门名、工种名，并按部门名降序
SELECT last_name,department_name,job_title
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN jobs j ON e.job_id = j.job_id
ORDER BY department_name DESC;

#查询员工的名字、上级的名字
SELECT e.last_name,m.last_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id

#案例1：查询哪个部门没有员工
#左外 
 SELECT d.*,employee_id
 FROM departments d
 LEFT OUTER JOIN employees e
 ON d.department_id = e.department_id
 WHERE e.employee_id IS NULL;
 
#右外
SELECT d.*,e.employee_id
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

#二、查询哪个城市没有部门
#左外
SELECT l.*,d.department_id
FROM locations l 
LEFT OUTER JOIN departments d
ON d.location_id = l.location_id
WHERE d.department_id IS NULL;
 
#三、查询部门名为SAL或IT的员工信息
SELECT e.*,d.department_name
FROM departments d
LEFT OUTER JOIN employees e
ON e.department_id = d.department_id
WHERE d.department_name IN ('SAL','IT');
