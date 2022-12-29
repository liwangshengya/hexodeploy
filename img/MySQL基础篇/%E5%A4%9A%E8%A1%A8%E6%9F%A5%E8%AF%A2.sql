--      多表关系
-- 多对多
create table student(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    no varchar(10)  comment '学号'
) comment '学生表';
insert into student values (null, '黛绮丝', '2000100101'),(null, '谢逊', '2000100102'),(null, '殷天正', '2000100103'),(null, '韦一笑', '2000100104');

create table course(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '课程名称'
)comment '课程表';
insert into course values (null, 'Java'), (null, 'PHP'), (null , 'MySQL') , (null, 'Hadoop');

-- 建立中间表有两个外键关联学生表和课程表
create table student_course(
    id int auto_increment primary key comment '主键',
    studentid int not null comment '学生ID',
    courseid int  not null comment '课程ID',
    constraint fk_courseof foreign key (courseid) references course(id),
    constraint fk_studentid foreign key (studentid) references student(id)
)comment '学生课程中间表';
insert into student_course values (null,1,1),(null,1,2),(null,1,3),(null,2,2),(null,2,3),(null,3,4);





-- 一对一
create table tb_user(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    age int comment '年龄',
    gender char(1) comment '1: 男 , 2: 女',
    phone char(11) comment '手机号'
) comment '用户基本信息表';

create table tb_user_edu(
    id int auto_increment primary key comment 'key',
    degree varchar(20) comment '学历',
    major varchar(20) comment '专业',
    primaryschool varchar(50) comment '小学',
    middleschool varchar(50) comment '中学',
    university varchar(50) comment '大写',
    userid int unique comment '用户ID',
    constraint fk_userid foreign key (userid) references tb_user(id)
)comment '用户教育信息表';


insert into tb_user(id, name, age, gender, phone) values
        (null,'黄渤',45,'1','18800001111'),
        (null,'冰冰',35,'2','18800002222'),
        (null,'码云',55,'1','18800008888'),
        (null,'李彦宏',50,'1','18800009999');

insert into tb_user_edu(id, degree, major, primaryschool, middleschool, university, userid) values
        (null,'本科','舞蹈','静安区第一小学','静安区第一中学','北京舞蹈学院',1),
        (null,'硕士','表演','朝阳区第一小学','朝阳区第一中学','北京电影学院',2),
        (null,'本科','英语','杭州市第一小学','杭州市第一中学','杭州师范大学',3),
        (null,'本科','应用数学','阳泉第一小学','阳泉区第一中学','清华大学',4);


-- ------------------------------------> 多表查询 <--------------------------------------------
-- 准备数据
create table dept(
    id   int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部门名称'
)comment '部门表';

create table emp(
    id  int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age  int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
)comment '员工表';

-- 添加外键
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);

INSERT INTO dept (id, name) VALUES (1, '研发部'), (2, '市场部'),(3, '财务部'), (4, '销售部'), (5, '总经办'), (6, '人事部');
INSERT INTO emp (id, name, age, job,salary, entrydate, managerid, dept_id) VALUES
            (1, '金庸', 66, '总裁',20000, '2000-01-01', null,5),

            (2, '张无忌', 20, '项目经理',12500, '2005-12-05', 1,1),
            (3, '杨逍', 33, '开发', 8400,'2000-11-03', 2,1),
            (4, '韦一笑', 48, '开发',11000, '2002-02-05', 2,1),
            (5, '常遇春', 43, '开发',10500, '2004-09-07', 3,1),
            (6, '小昭', 19, '程序员鼓励师',6600, '2004-10-12', 2,1),

            (7, '灭绝', 60, '财务总监',8500, '2002-09-12', 1,3),
            (8, '周芷若', 19, '会计',48000, '2006-06-02', 7,3),
            (9, '丁敏君', 23, '出纳',5250, '2009-05-13', 7,3),

            (10, '赵敏', 20, '市场部总监',12500, '2004-10-12', 1,2),
            (11, '鹿杖客', 56, '职员',3750, '2006-10-03', 10,2),
            (12, '鹤笔翁', 19, '职员',3750, '2007-05-09', 10,2),
            (13, '方东白', 19, '职员',5500, '2009-02-12', 10,2),

            (14, '张三丰', 88, '销售总监',14000, '2004-10-12', 1,4),
            (15, '俞莲舟', 38, '销售',4600, '2004-10-12', 14,4),
            (16, '宋远桥', 40, '销售',4600, '2004-10-12', 14,4),
            (17, '陈友谅', 42, null,2000, '2011-10-12', 1,null);

-- 多表查询  -- 笛卡尔积现象
select * from emp,dept;

select *from emp,dept where emp.dept_id=dept.id;


-- -------------内连接
-- 1. 查询每一个员工的姓名 , 及关联的部门的名称 (隐式内连接实现)
-- 表结构: emp , dept
-- 连接条件: emp.dept_id = dept.id
select emp.name,dept.name from emp,dept where  emp.dept_id=dept.id;
-- 起别名后不能直接通过表名在限定字段
select e.name,d.name from  emp e,dept d where dept_id=d.id;
-- 2. 查询每一个员工的姓名 , 及关联的部门的名称 (显式内连接实现)  --- INNER JOIN ... ON ...
-- 表结构: emp , dept
-- 连接条件: emp.dept_id = dept.id
select  e.name,d.name from emp e inner join dept d on e.dept_id = d.id;
-- inner可以省略
select e.name,d.name from emp e join dept d on d.id = e.dept_id;



-- 外连接演示
-- 1. 查询emp表的所有数据, 和对应的部门信息(左外连接)
-- 表结构 :emp,dept
-- 连接条件：emp.dept_id=dept.id
select e.*,d.name from emp e left outer join dept d on d.id = e.dept_id;
-- outer 可以省略
select e.*,d.name from emp e left join dept d on d.id = e.dept_id;
-- 2. 查询dept表的所有数据, 和对应的员工信息(右外连接)
select d.*,e.name from dept d right join emp e on d.id = e.dept_id;


-- 自连接
-- 1. 查询员工 及其 所属领导的名字
-- 表结构: emp
select a.name,b.name from emp a,emp b where a.managerid=b.id;
-- 2. 查询所有员工 emp 及其领导的名字 emp , 如果员工没有领导, 也需要查询出来
-- 表结构: emp a , emp b
select a.name,b.name from emp a left join emp b on a.managerid=b.id;

-- union all , union
-- 1. 将薪资低于 5000 的员工 , 和 年龄大于 50 岁的员工全部查询出来.
-- union all 直接合并
select * from emp where salary<5000
union all
select *from emp where age>50;
-- union 会去重
select * from emp where salary<5000
union
select *from emp where age>50;


-- 子查询

-- 标量子查询
-- 1.查询“销售部”所有员工的xinx
-- a.查询销售部的ID
select  id from dept where name='销售部';
-- b.根据销售部的ID查询员工信息
select *from emp where dept_id=4;

select  * from emp where dept_id=(select id from dept where dept.name='销售部');

-- 2. 查询在 "方东白" 入职之后的员工信息
select *from emp where entrydate>(select entrydate from emp where name='方东白');

-- 列子查询
-- 1.查询市场部和销售部的 所有员工信息
-- 查询销售部和市场部的部门ID
-- 根据部门ID，查询员工信息
select * from emp where dept_id in(select id from dept where dept.name in ('市场部','销售部'));
-- 2. 查询比财务部所有人员工工资都高的员工信息
-- --a.查询所有财务部人员工资
-- select salary from emp where dept_id=(select id from dept where name='财务部');
select * from emp where salary > all(select salary from emp where dept_id=(select id from dept where name='销售部'));
-- select max(salary) from emp where dept_id=(select id from dept where dept.name='财务部' );
select * from emp where salary>(select max(salary) from emp where dept_id=(select id from dept where dept.name='销售部' ));
-- 3. 查询比研发部其中任意一人工资高的员工信息
select * from emp where salary > any(select salary from emp where dept_id=(select id from dept where name='研发部'));


-- 行子查询
-- 1.查询与张无忌的薪资及直属领导相同的员工信息
select salary,managerid from emp where name='张无忌';
-- select *from emp where (salary=(select salary from emp where name='张无忌'))  and managerid=(select managerid from emp where name='张无忌');
select * from emp where (salary,managerid)=(select salary,managerid from emp where name='张无忌');

-- 表子查询
-- 查询与 鹿杖客，宋远桥的职位和薪资相同的员工的信息
select job,salary from emp where name in('鹿杖客','宋远桥');
select * from emp where (job,salary) in(select job,salary from emp where name in('鹿杖客','宋远桥'));

-- 2.查询入职日期是 '2006-01-01'之后的员工信息，及部门信息
-- a. 入职日期是 "2006-01-01" 之后的员工信息
select *from emp where entrydate>'2006-01-01';
-- b. 查询这部分员工, 对应的部门信息;
select e.*,d.* from (select *from emp where entrydate>'2006-01-01') e left join dept d on d.id=e.dept_id;



-- ---------------------------案例
-- 数据准备
create table salgrade(
    grade int,
    losal int,
    hisal int
) comment '薪资等级表';

insert into salgrade values (1,0,3000);
insert into salgrade values (2,3001,5000);
insert into salgrade values (3,5001,8000);
insert into salgrade values (4,8001,10000);
insert into salgrade values (5,10001,15000);
insert into salgrade values (6,15001,20000);
insert into salgrade values (7,20001,25000);
insert into salgrade values (8,25001,30000);

-- 1.查询员工的姓名、年龄、职位、部门信息（隐式内连接）
select e.name,e.age,e.job,d.name from emp e,dept d where e.dept_id=d.id;
-- 2. 查询年龄小于30岁的员工的姓名、年龄、职位、部门信息（显式内连接）
-- select e.name,e.age,e.job,d.name from (select * from emp where age<30) e join dept d on d.id=e.dept_id;
select e.name,e.age,e.job,d.name from emp e join dept d on d.id=e.dept_id where age<30;
-- 3. 查询拥有员工的部门ID、部门名称
select distinct d.id,d.name from emp e,dept d where e.dept_id=d.id;
-- 4.查询所有年龄大于40岁的员工，及其归属的部门的名称；如果员工没有分配部门，也要展示出来
select * from emp e left join dept d on d.id = e.dept_id where e.age>40;
-- 5.查询所有员工薪资等级
-- 连接条件 emp.salary>=salgrade.losal and emp.salary>=salgrade.histal
select e.*,s.grade '薪资等级' from emp e ,salgrade s where e.salary>=s.losal and e.salary<=s.hisal;
select e.*,s.grade '薪资等级' from emp e ,salgrade s where e.salary between s.losal and s.hisal;
-- 6.查询研发部所有员工的信息及工资等级
-- 表：emp,salgrade,dept
-- 连接条件：emp.salary between salgrade.losal and  salgrade.histal  emp.dept_id=dept_id
-- 查询条件： dept.name='研发部'
select e.*, s.grade '薪资等级'
from emp e,
     salgrade s,
     dept d
where e.salary between s.losal and s.hisal
  and (e.dept_id = d.id)
  and d.name = '研发部';

-- 7.查询研发部员工的平均工资
select avg(salary) '研发部平均薪资' from emp e,dept d where e.dept_id=d.id and d.name='研发部';
-- 8.查询工资比灭绝高的员工信息
select * from emp e where salary>(select salary from emp e2 where e2.name='灭绝');
-- 9.查询比平均工资高的员工信息
select * from emp where salary>(select avg(salary) from emp);
-- 10.查询低于本部门平均工资的员工信息
-- a. 查询指定部门平均薪资  1
select avg(e1.salary) from emp e1 where e1.dept_id = 1;
select avg(e1.salary) from emp e1 where e1.dept_id = 2;
-- b. 查询低于本部门平均工资的员工信息
select *from emp e2 where salary<(select avg(e1.salary) from emp e1 where e1.dept_id = e2.dept_id);
select *,(select avg(e1.salary) from emp e1 where e1.dept_id = e2.dept_id) '平均薪资'  from emp e2 where salary<(select avg(e1.salary) from emp e1 where e1.dept_id = e2.dept_id);

-- 11. 查询所有的部门信息, 并统计部门的员工人数
select count(*) from emp where dept_id=1;

select d.id,d.name,(select count(*) from emp where dept_id=d.id) '人数' from dept d;

 -- 12. 查询所有学生的选课情况, 展示出学生名称, 学号, 课程名称
-- 表: student , course , student_course
-- 连接条件: student.id = student_course.studentid , course.id = student_course.courseid
select s.name,s.no,c.name from student s,student_course sc,course c where s.id=sc.courseid and sc.courseid=c.id;
