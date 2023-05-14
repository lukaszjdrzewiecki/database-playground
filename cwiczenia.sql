-- Zrobić UPDATE, tak aby, nie było już NULL w żadnej tabeli - wstawcie sensowne dane. Pamiętajcie o transakcjach i commit. Róbcie to na jednym komputerze - WSPÓLNIE. Zadania opisane poniżej - zróbcie niezależnie każdy sam.
update student
set first_name = 'Michał',
where first_name is null;

update student
set last_name = 'Senior',
where last_name is null;


-- Wypisać statystyki - jakich imion jest najwięcej
SELECT first_name, COUNT(first_name) AS liczba_powtórzeń
FROM student
GROUP BY first_name
HAVING COUNT(first_name) = (
    SELECT MAX(cnt) FROM (
                             SELECT COUNT(first_name) AS cnt
                             FROM student
                             GROUP BY first_name
                         ) AS t
);

-- Wypisać statystyki - jakich nazwisk jest najwięcej.
SELECT last_name, COUNT(last_name) AS liczba_powtórzeń
FROM student
GROUP BY last_name
HAVING COUNT(last_name) = (
    SELECT MAX(cnt) FROM (
                             SELECT COUNT(last_name) AS cnt
                             FROM student
                             GROUP BY last_name
                         ) AS t
)


-- Ilu jest uczniów
select count(first_name)
from student;


-- Ile jest szkół
select count(id)
from school;

-- Ile jest klas w poszczególnych szkołach
select count(id)
from school_class
where id_school = x;

-- Ilu jest uczniów w każdej klasie
select count(first_name)
from student
where id_school_class = x;

-- Ilu jest Adamów w każdej szkole
select count(first_name)
from student
where first_name='Adam'

