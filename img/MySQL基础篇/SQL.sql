
insert into employee(id, workno, name, gender, age, idcard, entrydata) VALUE (1,'1','Itcast','男',10,'12345677','2020-1-1');

insert into employee values (2,'2','张无尽','男',23,'123456789','2022-4-23');

insert into employee  values (3,'3','张无尽','男',23,'123456789','2022-4-23'),(4,'4','张无尽','男',23,'123456789','2022-4-23');

delete from employee where  id=3 or 4;

-- 修改id为3的数据，将name 修改为赵敏
update employee set name='赵敏' where id=3;
-- 修改id为4 的数据，将name修改为小昭，性别修改为女
update employee set name='小昭',gender='女' where  id =4;
-- 将所有员工入职时间修改为 2008-01-01
update  employee set entrydata='2020-08-01';

-- 删除gender为女的员工
delete from employee where gender='女';

-- 删除所有的员工
delete  from  employee ;

select *from employee;

drop  table  emp;

-- 查询数据
-- 数据准备
create table  emp(
    id          int              comment '编号',
    workno      varchar(10)      comment '工号',
    name        varchar(10)      comment '姓名',
    gender      varchar(1)       comment '性别',
    age         tinyint unsigned comment '年龄',
    idcard      char(18)         comment '身份证号',
    workaddress varchar(50) comment '工作地址',
    entrydate   date          comment '入职时间'
) comment '员工表';

INSERT INTO emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
VALUES
    (1, '00001', '柳岩666', '女', 20, '123456789012345678', '北京', '2000-01-01'),
    (2, '00002', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01'),
    (3, '00003', '韦一笑', '男', 38, '123456789712345670', '上海', '2005-08-01'),
    (4, '00004', '赵敏', '女', 18, '123456757123845670', '北京', '2009-12-01'),
    (5, '00005', '小昭', '女', 16, '123456769012345678', '上海', '2007-07-01'),
    (6, '00006', '杨逍', '男', 28, '12345678931234567X', '北京', '2006-01-01'),
    (7, '00007', '范瑶', '男', 40, '123456789212345670', '北京', '2005-05-01'),
    (8, '00008', '黛绮丝', '女', 38, '123456157123645670', '天津', '2015-05-01'),
    (9, '00009', '范凉凉', '女', 45, '123156789012345678', '北京', '2010-04-01'),
    (10, '00010', '陈友谅', '男', 53, '123456789012345670', '上海', '2011-01-01'),
    (11, '00011', '张士诚', '男', 55, '123567897123465670', '江苏', '2015-05-01'),
    (12, '00012', '常遇春', '男', 32, '123446757152345670', '北京', '2004-02-01'),
    (13, '00013', '张三丰', '男', 88, '123656789012345678', '江苏', '2020-11-01'),
    (14, '00014', '灭绝', '女', 65, '123456719012345670', '西安', '2019-05-01'),
    (15, '00015', '胡青牛', '男', 70, '12345674971234567X', '西安', '2018-04-01'),
    (16, '00016', '周芷若', '女', 18, null, '北京', '2012-06-01');



-- 基本查询
-- 1. 查询指定字段name ，workno age 返回
select name,workno,age from emp;

-- 2. 查询所有字段返回值
select id,workno,name, gender,age,idcard,workaddress,entrydate from emp;

select * from  emp;
-- 3.查询所有员工工作地址，起别名
select workaddress as '工作地址' from emp;
select workaddress '工作地址' from emp;
-- 4. 查询员工上班地址(不要重复)
select distinct workaddress as '工作地址' from emp;




-- 条件查询
-- 1. 查询年龄等于88的员工信息
select *from emp where age=88;
-- 2. 查询年龄小于20的员工信息
select *from emp where age<20;
-- 3.查询年龄小于等于20的员工信息
select *from emp where age<=20;
-- 4. 查询没有身份证号的员工信息
select *from emp where idcard is null;
-- 5. 查询由身份证号的员工的信息
select *from emp where idcard is not null ;
-- 6. 查询年龄不等于88的员工信息
select *from  emp where age!=88;
select *from  emp where age <> 88;
-- 7.查询年龄在15（包含）岁到20岁（包含）之间的员工信息
select *from  emp where age between 15 and 20;  -- between 跟最小值 and跟最大值
select *from  emp where age>=15 and age<=20;
-- 8.查询性别为女 且年龄小于20 的员工信息
select *from emp where gender='女' and age<20;
--  '&&' is deprecated and will be removed in a future release. Please use AND instead
select *from emp where (gender='女' && age<20);
-- 9. 查询年龄等于18或 20 或 40的员工信息
select *from emp where age in(18,20,40);
select  *from  emp where age=18 OR age=40 OR age=20;
-- '|| as a synonym for OR' is deprecated and will be removed in a future release. Please use OR instead
select *from emp where age=18 || age=20 || age=40;

select *from emp where name like '__'; -- 注意是 下划线
-- 11. 查询身份证最后以为是X的员工信息
select *from emp where idcard like '%X';


-- 聚合函数
-- 1.统计该企业员工数量
select count(*) from emp; -- 由于聚合函数不统计null，所以统计总数常用 *
select count(id)  as '企业员工总数'from emp;
-- 2.统计该企业员工的平均年龄
select avg(age) from emp;
-- 3.统计该企业的最大年龄
select max(age) as '最大年龄' from emp;
-- 4. 统计该企业员工的最小年龄
select min(age)  from  emp;
-- 5.统计西安地区员工的年龄之和
select sum(age) from emp where workaddress='西安';


-- 分组查询
-- 1.根据性别分组，统计男性员工 和女性员工的数量
select   gender,count(*) from emp group by gender;

-- 2.根据性别分组，统计 男性员工 和 女性员工 的平均年龄
select  gender,avg(age) from emp group by gender;

-- 3.查询年龄小于45的员工，并根据工作地址分组，获取员工数量大于等于3的工作地址
select workaddress,count(*) from emp where age<45 group by workaddress having count(*)>=3;
select workaddress,count(*) address_count from emp where age<45 group by workaddress having address_count>=3;
-- 4.统计各个工作地址上上班的男性及女性员工数量
select  workaddress,gender,count(*) '数量' from emp group by gender,workaddress;


-- 排序查询
-- 1.根据年龄对公司的员工进行升序排序
select *from emp order by age asc ;
-- 2. 根据入职时间，对员工进行降序排序
select *from emp order by entrydate desc ;
-- 3.根据年龄对公司员工进行升序排序，年龄相同，在按照入职时间进行降序排序
select *from emp order by age asc,entrydate desc ;

-- 分页查询
-- 1. 查询第一页员工数据，每页展示10条记录
select  *from emp limit 0,10;
-- 1. 查询第二页员工数据，每页展示10 条记录  (页码-1) *每页显示的记录数
select  *from emp limit 10,10;


-- ----------- DQL 语句练习
-- 1.查询年龄为20，21，22，23岁的女性员工信息
select *from emp where gender='女' and age in(20,21,22,23);
-- 2.查询性别为 男，并且年龄在20-40 岁（含）以内的姓名为三个字的员工
select *from emp where gender='男' and (age between 20 and 40)   and name like '___';
-- 3. 统计员工表中，年龄小于60岁的，男性员工和女性员工的人数
select gender,count(*) '人数' from emp where age<=60 group by gender;
-- 4. 查询所有年龄小于等于35岁员工的姓名和年龄，并对查询结果按照年龄升序排序，如果年龄相同按入职时间降序排序
select name,age from emp where age<=35 order by age asc ,entrydate desc ;
-- 5. 查询性别为男，且年龄在20-40岁（含）以内的前5个员工信息，查询的结果按照年龄升序排序，年龄相同则按照入职时间升序排序
select * from emp where gender='男' and (age between 20 and 40) order by age,entrydate limit 0,5;

-- 用户管理
use mysql;
select database();
-- 创建用户 itcast,只能够在当前主句localhost访问，密码123456
create user 'itcast'@'localhost' identified by '123456';
-- 创建用户 heima，可以在任意主机访问该数据库密码123456
create user 'heima'@'%' identified by '123456';
-- 修改用户heima 的访问密码为1234
alter user 'heima'@'%' identified with mysql_native_password by '1234';
-- 删除itcast@localhost 用户
drop user 'itcast'@'localhost';




-- DCL 权限管理
-- 查询权限
show grants for 'heima'@'%';

-- 授予权限
grant all on test.* to 'heima'@'%';

-- 撤销权限
revoke all on test.* from 'heima'@'%';

