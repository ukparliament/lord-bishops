drop table if exists translations;
drop table if exists lord_bishop_diocese_incumbencies;
drop table if exists lord_bishop_dioceses;
drop table if exists people;
drop table if exists established_churches;
drop table if exists lord_bishop_diocese_incumbency_end_reasons;


create table lord_bishop_diocese_incumbency_end_reasons (
	id serial not null,
	reason varchar(255) not null,
	primary key (id)
);
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
create table lord_bishop_diocese_incumbencies (
	id serial not null,
	start_year int,
	start_month int,
	start_day int,
	end_year int,
	end_month int,
	end_day int,
	note text,
	link_on varchar(255) not null,
	person_id int not null,
	lord_bishop_diocese_id int not null,
	lord_bishop_diocese_incumbency_end_reason_id int,
	constraint fk_person foreign key (person_id) references people(id),
	constraint fk_lord_bishop_diocese foreign key (lord_bishop_diocese_id) references lord_bishop_dioceses(id),
	constraint fk_lord_bishop_diocese_incumbency_end_reason foreign key (lord_bishop_diocese_incumbency_end_reason_id) references lord_bishop_diocese_incumbency_end_reasons(id),
	primary key (id)
);
create table translations (
	id serial not null,
	from_lord_bishop_diocese_incumbency_id int not null,
	to_lord_bishop_diocese_incumbency_id int not null,
	note text,
	constraint fk_from_incumbency foreign key (from_lord_bishop_diocese_incumbency_id) references lord_bishop_diocese_incumbencies(id),
	constraint fk_to_incumbency foreign key (to_lord_bishop_diocese_incumbency_id) references lord_bishop_diocese_incumbencies(id),
	primary key (id)
);

