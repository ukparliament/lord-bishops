drop table if exists people;



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