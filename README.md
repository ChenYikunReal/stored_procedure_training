# stored_procedure_training
SQL/PL-SQL存储过程训练

## 软件工具
| 软件名称 | 工具版本 |
|:---:|:---:|
| MySQL | 8.0.16 |
| Navicat | 11.1.11 |
| DataGrip | 2020.1.5 |

## SQL、T-SQL、PL-SQL 辨析
SQL是Structrued Query Language的缩写，即结构化查询语言。它是负责与ANSI（美国国家标准学会）维护的数据库交互的标准。作为关系数据库的标准语言，它已被众多商用DBMS产品所采用，使得它已成为关系数据库领域中一个主流语言，不仅包含数据查询功能，还包括插入、删除、更新和数据定义功能。<br/>
T-SQL是SQL语言的一种版本，且只能在SQL SERVER上使用。它是ANSI SQL的加强版语言、提供了标准的SQL命令。另外，T-SQL还对SQL做了许多补允，提供了数据库脚本语言，即类似C、Basic和Pascal的基本功能，如变量说明、流控制语言、功能函数等。<br/>
PL-SQL（Procedural Language-SQL）是一种增加了过程化概念的SQL语言，是Oracle对SQL的扩充。与标准SQL语言相同，PL-SQL也是Oracle客户端工具（如SQL*Plus、Developer/2000等）访问服务器的操作语言。它有标准SQL所没有的特征：变量（包括预先定义的和自定义的）；控制结构（如IF-THEN-ELSE等流控制语句）；自定义的存储过程和函数 ；对象类型等。由于 P/L-SQL 融合了SQL语言的灵活性和过程化的概念，使得PL-SQL成为了一种功能强大的结构化语言，可以设计复杂的应用。<br/>

## DataGrip配置教程
- [教程](https://www.cnblogs.com/linkenpark/p/10908101.html)
- [下载地址](https://dev.mysql.com/downloads/connector/j/)
- 导入的jar包见项目中的<code>mysql-connector-java-8.0.21</code>

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
运行前<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/pre.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)
<br/>运行参数<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/param.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)
<br/>运行成功<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/success.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)
<br/>运行后<br/>
![在这里插入图片描述](https://github.com/ChenYikunReal/stored_procedure_training/blob/master/pro.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg5NjMxOA==,size_16,color_FFFFFF,t_70)


