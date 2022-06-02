CREATE TABLE sales.promotions (
    promotion_id INT,
    promotion_name VARCHAR (255) NOT NULL,
    discount NUMERIC (3, 2) DEFAULT 0,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
); 

INSERT INTO sales.promotions (
    promotion_id,
    promotion_name,
    discount,
    start_date,
    expired_date
)
VALUES
    (
        54671,
        '2019 Summer Promotion',
        0.15,
        '20190601',
        '20190901'
    ),
    (
        54672,
        '2019 Fall Promotion',
        0.20,
        '20191001',
        '20191101'
    ),
    (
        54673,
        '2019 Winter Promotion',
        0.25,
        '20191201',
        '20200101'
    );

