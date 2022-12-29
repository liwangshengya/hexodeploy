-- ---------------------------- 事务操作 ----------------------------
-- 数据准备
create table account(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    money int comment '余额'
) comment '账户表';
insert into account(id, name, money) VALUES (null,'张三',2000),(null,'李四',2000);

-- 恢复数据
update account set money=2000 where name='张三' or name='李四';

-- 查看当前事务提交方式
select @@autocommit;  -- 1为自动提交 0 为手动提交

set  @@autocommit =0;

-- 转账操作 张三给李四转账1000
-- 1.查询张三账户余额
select * from account where name='张三';
-- 2.将张三账户余额-1000
update account set money=money-1000 where name='张三';
-- 模拟异常
select aaf;
-- 3. 将李四账户余额+1000
update account set money=money+1000 where name='李四';

-- 提交事务
commit ;

-- 回滚事务
rollback ;


-- 方式二
set  @@autocommit =1;

-- 转账操作 张三给李四转账1000

-- 开启事务
start transaction ;

-- 1.查询张三账户余额
select * from account where name='张三';
-- 2.将张三账户余额-1000
update account set money=money-1000 where name='张三';
-- 模拟异常
select aaf;
-- 3. 将李四账户余额+1000
update account set money=money+1000 where name='李四';

-- 提交事务
commit ;

-- 回滚事务
rollback ;




-- 事务隔离
-- 查看事务隔离级别
select @@transaction_isolation;
set session transaction isolation level read uncommitted ;
set session transaction isolation level repeatable read ;

-- 设置为 read uncommitted;
set session transaction isolation level read uncommitted ;
-- 两个用户都开启事务
start transaction ;

-- 窗口1
select * from account;
-- 零一窗口


