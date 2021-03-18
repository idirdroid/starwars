create table gender
(
	id_gender serial not null
		constraint gender_pk
			primary key,
	gender varchar(25)
);

alter table gender owner to postgres;

create table climat
(
	id_climat serial not null
		constraint climat_pk
			primary key,
	name_climat varchar(25)
);

alter table climat owner to postgres;

create table terrain
(
	id_terrain serial not null
		constraint terrain_pk
			primary key,
	type_terrain varchar(25)
);

alter table terrain owner to postgres;

create table planet
(
	id_planet serial not null
		constraint planet_pk
			primary key,
	name varchar(50),
	rotation_period integer,
	orbital_period integer,
	diametre integer,
	gravity varchar(100),
	id_climat integer
		constraint id_climat_fk
			references climat,
	id_terrain integer
		constraint id_terrain_fk
			references terrain,
	surface_water integer,
	population bigint
);

alter table planet owner to postgres;

create table color
(
	id_color serial not null
		constraint color_pk
			primary key,
	color_name varchar(30)
);

alter table color owner to postgres;

create table language
(
	id_language serial not null
		constraint language_pk
			primary key,
	language varchar(25)
);

alter table language owner to postgres;

create table classification
(
	id_classification serial not null
		constraint classification_pk
			primary key,
	classification varchar(25)
);

alter table classification owner to postgres;

create table designation
(
	id_designation serial not null
		constraint designation_pk
			primary key,
	designation varchar(25)
);

alter table designation owner to postgres;

create table species
(
	id_species serial not null
		constraint species_pk
			primary key,
	name varchar(25),
	id_classification integer
		constraint id_classification_fk
			references classification,
	id_designation integer
		constraint id_designation_fk
			references designation,
	average_height integer,
	average_lifespan integer,
	id_language integer
		constraint id_language_fk
			references language,
	id_planet integer
		constraint id_planet_fk
			references planet
);

alter table species owner to postgres;

create table character
(
	id_character serial not null
		constraint character_pk
			primary key,
	name varchar(25),
	height integer,
	mass integer,
	birth_year varchar(10),
	id_gender integer
		constraint id_gender_fk
			references gender,
	id_planet integer
		constraint id_planet_fk
			references planet,
	id_species integer
		constraint id_species_fk
			references species
);

alter table character owner to postgres;

create table color_characters
(
	id_color integer
		constraint id_color_fk
			references color,
	id_characters integer
		constraint id_characters_fk
			references character
);

alter table color_characters owner to postgres;

create table color_species
(
	id_color integer
		constraint id_color_fk
			references color,
	id_species integer
		constraint id_species_fk
			references species
);

alter table color_species owner to postgres;

create table type_vehicule
(
	id_type serial not null
		constraint type_vehicule_pk
			primary key,
	type varchar(25)
);

alter table type_vehicule owner to postgres;

create table vehicule_class
(
	id_class serial not null
		constraint vehicule_class_pk
			primary key,
	class varchar(25)
);

alter table vehicule_class owner to postgres;

create table manufacturer
(
	id_manufacturer serial not null
		constraint manufacturer_pk
			primary key,
	manufacturer varchar(25)
);

alter table manufacturer owner to postgres;

create table vehicules
(
	id_vehicule serial not null
		constraint vehicules_pk
			primary key,
	name varchar(25),
	model varchar(50),
	id_manufacturer integer
		constraint id_manufacturer_fk
			references manufacturer,
	cost_in_credits integer,
	vehicule_length integer,
	max_atmospering_speed integer,
	crew integer,
	passengers integer,
	cargo_capacity integer,
	consumables varchar(50),
	hyperdrive_rating double precision,
	mglt integer,
	id_vehicule_class integer
		constraint id_class_fk
			references vehicule_class,
	id_type integer
		constraint id_type_fk
			references type_vehicule
);

alter table vehicules owner to postgres;

