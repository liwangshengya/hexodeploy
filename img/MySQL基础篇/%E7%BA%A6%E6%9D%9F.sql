-- - 约束演示---
drop table if exists user;
create table user(
    id   int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check ( age>0 and age<=120 ) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
) comment '用户表';

-- 插入数据
-- id 自动增长，由数据库进行维护
insert into user(name, age, status, gender) values ('tom1',19,'1','男'),('tom2',25,'0','男');
insert into user( name, age, status, gender) values ('tom3',30,'1','男');

insert into user( name, age, status, gender) values ('tom4',-1,'1','男');
insert into user( name, age,  gender) values ('tom5',30,'男');


-- -----------------约束(外键)---------------------
-- 准备数据
drop table if exists dept;
create table dept(
    id int auto_increment primary key comment 'ID',
    name varchar(50) not null comment '部门名称'
)comment '部门表';
INSERT INTO dept (id, name) VALUES (1, '研发部'), (2, '市场部'),(3, '财务部'), (4, '销售部'), (5, '总经办');

drop table if exists empl;
create table empl(
    id int auto_increment primary key  comment 'ID',
    name varchar(50) not null comment '姓名',
    age int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
)comment '员工表';

INSERT INTO empl (id, name, age, job, salary, entrydate, managerid, dept_id) VALUES
            (1, '金庸', 66, '总裁',20000, '2000-01-01', null,5),(2, '张无忌', 20, '项目经理',12500, '2005-12-05', 1,1),
            (3, '杨逍', 33, '开发', 8400,'2000-11-03', 2,1),(4, '韦一笑', 48, '开发',11000, '2002-02-05', 2,1),
            (5, '常遇春', 43, '开发',10500, '2004-09-07', 3,1),(6, '小昭', 19, '程序员鼓励师',6600, '2004-10-12', 2,1);

-- 添加外键
-- 为emp表的dept_id字段添加外键约束,关联dept表的主键id。
alter table empl add constraint fk_empl_deptip foreign key (dept_id) references dept(id);

-- 删除外键
-- 删除emp表的外键fk_emp_dept_id。
alter table empl drop foreign key fk_empl_deptip;



-- --------- 外键的删除和更新
alter table empl add constraint fk_empl_dept_id foreign key (dept_id) references dept(id) on update cascade on delete cascade ;

alter table empl add constraint fk_empl_dept_id foreign key (dept_id) references dept(id) on update set null on delete set null ;

