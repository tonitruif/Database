CREATE TABLE Extra (
    _name NVARCHAR(25), 
    _type INT,
    _date DATE
);
GO

INSERT INTO Extra VALUES('Ivanov',1,'2018-01-16')
INSERT INTO Extra VALUES('Ivanov',1,'2018-01-17')

INSERT INTO Extra VALUES('Ivanov',1,'2018-06-25')
INSERT INTO Extra VALUES('Ivanov',1,'2018-06-26')
INSERT INTO Extra VALUES('Ivanov',1,'2018-06-27')
INSERT INTO Extra VALUES('Ivanov',1,'2018-06-28')
INSERT INTO Extra VALUES('Ivanov',1,'2018-06-29')
INSERT INTO Extra VALUES('Ivanov',1,'2018-06-30')

INSERT INTO Extra VALUES('Ivanov',1,'2018-09-15')

INSERT INTO Extra VALUES('Petrov',1,'2018-01-15')
INSERT INTO Extra VALUES('Petrov',1,'2018-01-16')
INSERT INTO Extra VALUES('Petrov',1,'2018-01-17')

SELECT * FROM Extra

SELECT _name, _type, _from, MIN(_to) AS _to
FROM
(
        SELECT A._name AS _name, A._type AS _type, A._date AS _from, C._date AS _to
        FROM Extra A, Extra C
        WHERE NOT EXISTS 
        (
            SELECT * 
            FROM Extra B 
            WHERE (DATEDIFF(DAYOFYEAR, A._date, B._date) = -1 OR DATEDIFF(DAYOFYEAR, C._date, B._date) = 1) AND A._name = B._name
        ) AND A._date <= C._date
) AS tmp2
GROUP BY _name, _type, _from 
HAVING _from <= MIN(_to)

DELETE FROM Extra
GO
    
