select * from cities;
select * from countries;
select * from languages;

/* Consulta 1: ¿Qué consulta harías para obtener todos los países que hablan esloveno?*/
select 
	co.name as 'País', 
    la.language as 'Idiomas',  
    la.percentage  as 'Porcentaje'
from countries co inner join languages la on co.id = la.country_id
where la.language = 'Slovene'
order by la.percentage desc;

/* Consulta 2: ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? */
select
	co.name as 'País',
    count(ci.id) as 'Número de ciudades'
from countries co inner join cities ci 
on co.id = country_id
group by co.name
order by count(ci.id) desc;

/* Consulta 3: ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000?*/
select
	ci.name as 'Cuidad',
    ci.population as 'Población'
from cities ci inner join countries co
on co.id = ci.country_id
where co.name = 'Mexico' and ci.population >500000
order by ci.population desc;

/* Consulta 4: ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%?*/
select 
	co.name as 'País', 
    la.language as 'Idiomas',  
    la.percentage  as 'Porcentaje'
from countries co inner join languages la 
on co.id = la.country_id
where la.percentage > 89
order by 1 asc, 3 desc;

/* Consulta 5: ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000?  */
select
	name as 'País',
    surface_area as 'Superficie kms2',
    population as 'Población'
from countries
where surface_area < 501 and population > 100000;

/* Consulta 6: ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años?*/
select
	name as 'País',
    government_form as 'Forma de Gobierno',
    capital as 'Capital',
	life_expectancy as 'Esperanza de Vida'
from countries
where government_form = 'Constitutional Monarchy' and capital > 200 and life_expectancy > 75
order by name;

/* Consulta 7: ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000?*/
select
	co.name as 'País',
    ci.name as 'Ciudad',
    ci.district as 'Distrito',
    ci.population as 'Población'
from countries co inner join cities ci
on co.id = ci.country_id
where ci.district = 'Buenos Aires' and ci.population > 500000
order by 2;

/* Consulta 8: ¿Qué consulta harías para resumir el número de países en cada región?*/
select
	region as 'Región',
    count(id) as 'Cantidad de Países'
from countries co
order by count(co.id) desc;
