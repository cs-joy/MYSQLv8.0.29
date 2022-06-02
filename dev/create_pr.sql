CREATE DATABASE cr;

CREATE TABLE cr.pr (
    promotion_id INT,
    promotion_name VARCHAR (255) NOT NULL,
    category_name VARCHAR(255) NOT NULL,
    discount NUMERIC (3, 2) DEFAULT 0,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
); 

INSERT INTO cr.pr (
    promotion_id,
    promotion_name,
    category_name,
    discount,
    start_date,
    expired_date
)
VALUES
    (
        54671,
        '2019 Summer Promotion',
        'Summer',
        0.15,
        '20190601',
        '20190901'
    ),
    (
        54672,
        '2019 Fall Promotion',
        'Fall',
        0.20,
        '20191001',
        '20191101'
    ),
    (
        54673,
        '2019 Winter Promotion',
        'Winter',
        0.25,
        '20191201',
        '20200101'
    );

