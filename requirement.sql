create table galaxy_cluster(
   galaxy_cluster_id serial primary key not null,
   name           varchar(30) not null unique,
age numeric(2,1),
size numeric(2,1),
);

create table galaxy(
   galaxy_id         serial      not null primary key,
   galaxy_cluster_id int         references galaxy_cluster(galaxy_cluster_id),
   name              varchar(30) not null unique,
   age               numeric(2,1),
   size              numeric(2,1)
);

create table star(
   star_id           serial      not null primary key,
   galaxy_id         int         references galaxy(galaxy_id),
   name              varchar(30) not null unique,
   age               numeric(2,1),
   size              numeric(2,1),
   planets_num int
);

create table planet(
   planet_id           serial      not null primary key,
   star_id         int         references star(star_id),
   name              varchar(30) not null unique,
   age               numeric(2,1),
   size              numeric(2,1),
   description text,
   solid boolean,
   moons_num int
);

create table moon(
   moon_id           serial      not null primary key,
   planet_id         int         references planet(planet_id),
   name              varchar(30) not null unique,
   age               numeric(2,1),
   size              numeric(2,1),
   solid boolean
);

insert into galaxy_cluster
(name) 
values('Virgo'),('Coma'),('Perseus');

SELECT galaxy_cluster_id from galaxy_cluster WHERE name='Virgo';/*1*/

/*6 galaxies*/
insert into galaxy
(name, galaxy_cluster_id)
values('Milky_way',1),
('Andromeda'),
('Triangulum'),
('Messier_81'),
('Messier_82'),
('Centaurus_A')
;

/*6 stars*/
SELECT galaxy_id from galaxy WHERE name='Milky_way';/*1*/
insert into star
(name, galaxy_id)
values('Sun',1),
('Alpha_Centauri',1),
('Sirius',1),
('Epsilon_Eridani',1),
('Procyon',1),
('Tau_Ceti',1)
;

SELECT star_id from star WHERE name='Sun';/*1*/
/*12 planets*/
insert into planet
(name, star_id)
values('Jupiter',1),
('Saturn',1),
('Uranus',1),
('Neptune',1),
('Earth',1),
('Venus',1),
('Mars',1),
('Mercury',1),
('Pluto',1),
('Ceres',1),
('Eris',1),
('Haumea',1)
;

SELECT planet_id from planet WHERE name='Jupiter';/*1*/
/*20 moons*/
insert into moon
(name, planet_id)
values('Io',1),
('Europa',1),
('Ganymede',1),
('Callisto',1),
('Mimas',1),
('Enceladus',1),
('Tethys',1),
('Dione',1),
('Rhea',1),
('Titan',1),
('Iapetus',1),
('Miranda',1),
('Ariel',1),
('Umbriel',1),
('Titania',1),
('Oberon',1),
('Triton',1),
('Charon',1),
('Hydra',1),
('Nix',1)
;