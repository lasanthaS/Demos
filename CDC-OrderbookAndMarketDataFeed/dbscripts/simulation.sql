-- -------------------------------------------------------
-- Simulation
-- -------------------------------------------------------
select * from OrderBook
select * from Trades

-- Place sell/buy orders
insert into OrderBook values (1, 'WSO2', 18.50, 1000, 's')
insert into OrderBook values (2, 'WSO2', 18.70, 2000, 's')
insert into OrderBook values (3, 'WSO2', 18.60, 1500, 's')
insert into OrderBook values (4, 'WSO2', 19.00, 1100, 's')

insert into OrderBook values (5, 'WSO2', 18.40, 1500, 'b')

-- Update order to match with buy order 5
update OrderBook set price = 18.40 where id = 3
-- MATCH !!!

-- Delete sell order 2
delete from OrderBook where id = 2
-- ORDER DELETED !!!

-- Place order to match with sell order 1
insert into OrderBook values (6, 'WSO2', 18.50, 1000, 'b')
-- MATCH !!!

insert into OrderBook values (7, 'WSO2', 18.30, 2100, 's')

insert into OrderBook values (8, 'WSO2', 18.20, 2000, 'b')

-- Place order to match with sell order 7
insert into OrderBook values (9, 'WSO2', 18.30, 2100, 'b')