drop table if exists lord_bishop_dioceses;
drop table if exists people;
drop table if exists established_churches;


create table established_churches (
	id serial not null,
	name varchar(255) not null,
	disestablished_on date,
	wikidata_id varchar(16) not null,
	note text,
	primary key (id)
);
create table people (
	id serial not null,
	forenames varchar(255) not null,
	surname varchar(255) not null,
	year_of_birth int not null,
	month_of_birth int,
	day_of_birth int,
	year_of_death int,
	month_of_death int,
	day_of_death int,
	is_advanced_under_lords_spiritual_women_act_2015 boolean default false,
	wikidata_id varchar(16) not null,
	mnis_id int,
	note text,
	link_on varchar(500) not null,
	primary key (id)
);
create table lord_bishop_dioceses (
	id serial not null,
	most_recent_name varchar(255) not null,
	start_year int,
	start_month int,
	start_day int,
	end_year int,
	end_month int,
	end_day int,
	gazette_url varchar(255),
	is_named_see boolean default false,
	is_archdiocese boolean default false,
	wikidata_id varchar(16) not null,
	note text,
	link_on varchar(500) not null,
	established_church_id int not null,
	constraint fk_established_church foreign key (established_church_id) references established_churches(id),
	primary key (id)
);