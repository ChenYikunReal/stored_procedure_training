# stored_procedure_training
SQL/PL-SQL存储过程训练

## 软件工具
| 软件名称 | 工具版本 |
|:---:|:---:|
| MySQL | 8.0.16 |
| Navicat | 11.1.11 |
| DataGrip | 2020.1.5 |

## SQL、T-SQL、PL-SQL 辨析
SQL是Structrued Query Language的缩写，即结构化查询语言。它是负责与ANSI（美国国家标准学会）维护的数据库交互的标准。作为关系数据库的标准语言，它已被众多商用DBMS产品所采用，使得它已成为关系数据库领域中一个主流语言，不仅包含数据查询功能，还包括插入、删除、更新和数据定义功能。

T-SQL是SQL语言的一种版本，且只能在SQL SERVER上使用。它是ANSI SQL的加强版语言、提供了标准的SQL命令。另外，T-SQL还对SQL做了许多补允，提供了数据库脚本语言，即类似C、Basic和Pascal的基本功能，如变量说明、流控制语言、功能函数等。

PL-SQL(Procedural Language-SQL)是一种增加了过程化概念的SQL语言，是Oracle对SQL的扩充。与标准SQL语言相同，PL-SQL也是Oracle客户端工具（如SQL*Plus、Developer/2000等）访问服务器的操作语言。它有标准SQL所没有的特征：变量（包括预先定义的和自定义的）；控制结构（如IF-THEN-ELSE等流控制语句）；自定义的存储过程和函数 ；对象类型等。由于 P/L-SQL 融合了SQL语言的灵活性和过程化的概念，使得PL-SQL成为了一种功能强大的结构化语言，可以设计复杂的应用。

## DataGrip配置教程
- [DataGrip官网](https://www.jetbrains.com/datagrip/)
- [教程](https://www.cnblogs.com/linkenpark/p/10908101.html)
- [jar包下载地址](https://dev.mysql.com/downloads/connector/j/)
- 导入的jar包见项目中的<code>mysql-connector-java-8.0.21</code>，JDBC用的也是这个东西

## 存储过程概述
MySQL 5.0 版本开始支持存储过程。<br/>
存储过程(Stored Procedure)是一种在数据库中存储复杂程序，以便外部程序调用的一种数据库对象。<br/>
存储过程是为了完成特定功能的SQL语句集，经编译创建并保存在数据库中，用户可通过指定存储过程的名字并给定参数(需要时)来调用执行。<br/>
存储过程思想上很简单，就是数据库 SQL 语言层面的代码封装与重用。<br/>
优点：
- 存储过程可封装，并隐藏复杂的商业逻辑。
- 存储过程可以回传值，并可以接受参数。
- 存储过程无法使用 SELECT 指令来运行，因为它是子程序，与查看表，数据表或用户定义函数不同。
- 存储过程可以用在数据检验，强制实行商业逻辑等。

缺点：
- 存储过程，往往定制化于特定的数据库上，因为支持的编程语言不同。当切换到其他厂商的数据库系统时，需要重写原有的存储过程。
- 存储过程的性能调校与撰写，受限于各种数据库系统。

## 存储过程学习心得
1. [菜鸟教程](https://www.runoob.com/w3cnote/mysql-stored-procedure.html)
2. 所有的VARCHAR都不对，必须写VARCHAR(255)这种
3. Navicat对调试存储过程帮助不大，甚至说毫无帮助，建议使用DataGrip
4. 注意分号
5. 注意<code>END IF</code>这种都是必写的，与Java不同，有点像VB.NET

## 存储过程Demo
```mysql
# 这是查询语句
# 如果有这个存储过程就删掉
DROP PROCEDURE IF EXISTS insert_new_student;

# 新建存储过程 定义函数名和函数参数 这里类型全是IN 注意VARCHAR必须指定(255)这种
CREATE PROCEDURE insert_new_student(IN studentName VARCHAR(255), IN studentAge INT, IN studentBirthday DATETIME, IN studentEmail VARCHAR(255), IN studentCountry VARCHAR(255))

# 存储过程开始
BEGIN
    # 定义变量 插入前最大ID
    DECLARE maxId INT;
    # 定义变量 插入后最大ID 用于比较
    DECLARE newId INT;
    # 定义变量 执行后的结果
    DECLARE state VARCHAR(255);
    # 这里的一个细节是：可以对Age和Birthday的关系进行一个judge，我觉得太麻烦不想写……
    # 获取插入信息前的最大ID（ID为主键且自增1）
    SELECT MAX(id) INTO maxId FROM stu_info;
    # 插入新的一条学生信息
    INSERT INTO stu_info VALUES (NULL, studentName, studentAge, studentBirthday, studentEmail, studentCountry);
    # 获取插入信息后的最大ID
    SELECT MAX(id) INTO newId FROM stu_info;
    # 通过ID判断是否插入成功
    IF maxId+1 = newId THEN
        SET state = '新增学生信息成功';
    ELSE
        SET state = '新增学生信息失败';
    # END IF必须有
    END IF;
# 存储过程结束
END
```

## 如何尝试
Navicat导入(命令行也可)test.sql，很快就能执行完毕。<br/>
导入的时候注意直接导入sql文件，不要复制到"新建查询"里！<br/>
test.sql不仅含有表结构，还含有表数据，甚至还有存储过程！

## 效果演示
运行前：<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/pre.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)
<br/>运行参数：<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/param.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)
<br/>运行成功：<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/success.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)
<br/>运行后：<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/pro.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)


