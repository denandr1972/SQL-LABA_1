Примечание: чтобы получить уникальные имена таблиц для каждого студента просьба во всех DDL командах использовать уникальное окончание в имени таблицы в ней рекомендую хранить первую букву имени и фамилию (пример table_name_mbelko)

1. Создать таблицу для хранения списка книг в библиотеке (пример имени таблицы books_mbelko).
без первичных ключей и ограничений
перечень и имена колонок на Ваше усмотрение
вставить 3 произвольные строки с данными для всех колонок
написать проверочный скрипт демонстрирующий Ваше изменения используя словарь INFORMATION_SCHEMA.COLUMNS
написать проверочный скрипт на содержание вашего инсерта


DROP TABLE db_laba.dbo.books_dandrosov;

CREATE TABLE db_laba.dbo.books_dandrosov

(book_ID int NOT NULL,
name_of_the_book varchar(20),
author_firstname varchar(20) NOT NULL,
author_lastname varchar(20) NOT NULL,
duedate varchar(20)
)

insert
	into
	db_laba.dbo.books_dandrosov
select
	1,'Name of the Rose', 'Umberto', 'Eco','2020-01-01'
UNION all
select
	2,'The Magus', 'John','Fowels','2019-12-31'
UNION all
select
	3,'Master and Margarita', 'Michail','Bulgakov','2019-11-05'

SELECT
	*
from
	db_laba.dbo.books_dandrosov



--check
SELECT ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'books_dandrosov';



2. В созданную в 1м задании таблицу добавить колонку description с типом данных char(32)
вставить 3 произвольные строки с данными для всех колонок
написать проверочный скрипт демонстрирующий Ваше изменения используя словарь INFORMATION_SCHEMA.COLUMNS
написать проверочный скрипт на содержание вашего инсерта


alter table db_laba.dbo.books_dandrosov add description char(32);

insert
	into
	db_laba.dbo.books_dandrosov
select
	4,'Jane Aire', 'Sharlotte', 'Bronte','2020-01-01', 'roman'
UNION all
select
	5,'Golden Calb', 'Ilja','Ilf','2019-12-31','roman'
UNION all
select
	6,'12 chairs', 'Ewgeny','Petrow','2019-11-05','roman'

update db_laba.dbo.books_dandrosov
set description = 'roman' where book_ID IN (1,2,3);


--SELECT ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'books_dandrosov';

SELECT
	*
from
	 db_laba.dbo.books_dandrosov

SELECT name, type_desc, is_unique, is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('db_laba.dbo.books_dandrosov')



3. В созданную в 1м задании таблицу вставить строку с произвольными данными, но для в колонки description вставить следующий текст (без кавычек):
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
(подсказка для этого Вам понадобиться изменить тип данных колонки description)
написать все использованные скрипты для модификации таблицы
написать проверочный скрипт демонстрирующий Ваше изменения используя словарь INFORMATION_SCHEMA.COLUMNS
написать проверочный скрипт на содержание вашего инсерта



ALTER TABLE db_laba.dbo.books_dandrosov
ALTER COLUMN description NVARCHAR(200)

insert
	into
	db_laba.dbo.books_dandrosov
select
	7,'Eugene Onegin', 'Alexander', 'Pushkin','2019-11-01','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

SELECT
	*
from
	 db_laba.dbo.books_dandrosov

SELECT ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'books_dandrosov'



4. Создать новую таблицу на основе таблицы из 1го задания (со всеми колонками на текущий момент)
сделать колонку description обязательной ко вводу и длиной не менее 3 символов со значением по умолчанию 'N/A' (без кавычек)
написать все использованные скрипты для модификации таблицы
написать проверочный скрипт демонстрирующий Ваше изменения используя словарь INFORMATION_SCHEMA.COLUMNS
написать проверочный скрипт на содержание вашей новой таблицы


--часть 1 - создание табицы с 3 строками

DROP TABLE db_laba.dbo.books_dandrosov;

CREATE TABLE db_laba.dbo.books_dandrosov

(book_ID int NOT NULL,
name_of_the_book varchar(20),
author_firstname varchar(20) NOT NULL,
author_lastname varchar(20) NOT NULL,
duedate varchar(20)
)

insert
	into
	db_laba.dbo.books_dandrosov
select
	1,'Name of the Rose', 'Umberto', 'Eco','2020-01-01'
UNION all
select
	2,'The Magus', 'John','Fowels','2019-12-31'
UNION all
select
	3,'Master and Margarita', 'Michail','Bulgakov','2019-11-05'

--проверка

SELECT
	*
from
	 db_laba.dbo.books_dandrosov

SELECT name, type_desc, is_unique, is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('db_laba.dbo.books_dandrosov')

--_____________________________________________________________

--часть 2 добавление description с типом данных char(32)

alter table db_laba.dbo.books_dandrosov add description char(32);

insert
	into
	db_laba.dbo.books_dandrosov
select
	4,'Jane Aire', 'Sharlotte', 'Bronte','2020-01-01', 'roman'
UNION all
select
	5,'Golden Calb', 'Ilja','Ilf','2019-12-31','roman'
UNION all
select
	6,'12 chairs', 'Ewgeny','Petrow','2019-11-05','roman'

-- не понял, нужно ли это делать, но заполняю певые три строки в поле description

--update db_laba.dbo.books_dandrosov
--set description = 'roman' where book_ID IN (1,2,3);

--проверка

SELECT
	*
from
	 db_laba.dbo.books_dandrosov

SELECT name, type_desc, is_unique, is_primary_key
FROM sys.indexes
WHERE object_id = OBJECT_ID('db_laba.dbo.books_dandrosov')
--__________________________________________________________________________________

-- добавляю строку 7 с  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
--                       sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
-- в поле description

ALTER TABLE db_laba.dbo.books_dandrosov
ALTER COLUMN description VARCHAR(200) DEFAULT 'N/A'
CHECK (LEN(description)>=3)


insert
	into
	db_laba.dbo.books_dandrosov
select
	7,'Eugene Onegin', 'Alexander', 'Pushkin','2019-11-01','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

--проверка

SELECT
	*
from
	 db_laba.dbo.books_dandrosov


SELECT ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'books_dandrosov'

--_______________________________________________________________________________________________
ALTER TABLE db_laba.dbo.books_dandrosov


SELECT
	*
from
db_laba.dbo.books_dandrosov 
