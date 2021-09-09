drop database ChallengeSql;
create database ChallengeSql;
use ChallengeSql;
create table if not exists users (
	user_id int not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    house varchar(50) not null,
    primary key (user_id)
);

create table if not exists follows(
	user_id int not null,
    follow int not null,
    date_ datetime not null,
    foreign key (user_id) references users(user_id)
);

### Import tables with Tabla Data Import Wizard or using this link: https://www.mysqltutorial.org/import-csv-file-mysql-table/
### the way under should work but there is something when is running the load query. It needs some permission
### useful links: https://stackoverflow.com/questions/32737478/how-should-i-tackle-secure-file-priv-in-mysql
/*load data local infile "\\wsl$\Ubuntu\home\jhordymora\code\JhordyMora\codeChallengePractice\raw_data\user.csv" 
load data infile "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\user.csv"
into table users 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;*/

# 1. Question
select house as House, count(user_id) as "#_Members" from users group by house;

# 2. Question
select date_ from follows where date_ < "1993-09-01";

# 3. Question
select users.first_name, follows.date_ from users natural join follows where date_ < "1993-09-01";

# 4. Question 
select * from users natural join follows where date_ > "1999-12-31";

# 5. Question
select users.first_name, count(follows.follow) from users natural join follows group by first_name;

# 6. Question
