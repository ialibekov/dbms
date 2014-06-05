use task1;

drop table if exists workers;

create table workers
(
	id serial primary key,
	boss integer references workers(id),
	name varchar(50)
);

LOAD DATA LOCAL INFILE '~/sfera/lectures/homework1-data.csv' INTO TABLE workers FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
