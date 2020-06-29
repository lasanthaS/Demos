-- Create the database and switch to it.
create database stocksDB
go

use stocksDB
go

-- Create tables
create table OrderBook(
    id int primary key,
    symbol varchar(4) not null,
    price money not null,
    volume numeric(18, 0) not null,
    orderType char(1) not null,
)
go

create table Trades (
    symbol varchar(4),
    volume numeric(18, 0) not null,
    currentPrice money not null,
    sellOrderId int,
    buyOrderId int
)
go

-- Enable CDC for the database.
exec sys.sp_cdc_enable_db
go

-- Enable CDC for the 'OrderBook' table.
exec sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'OrderBook',
    @role_name     = null,
    @supports_net_changes = 0
go

-- Enable CDC for the 'Trades' table.
exec sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'Trades',
    @role_name     = null,
    @supports_net_changes = 0
go

-- View CDC status
exec sys.sp_cdc_help_change_data_capture
go

-- List tables
select * from OrderBOok
go
select * from Trades
go