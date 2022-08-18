create table analysis.tmp_rfm_monetary_value (
 user_id int not null primary key,
 monetary_value int not null check(monetary_value >= 1 and monetary_value <= 5)
);

insert into analysis.tmp_rfm_monetary_value (
    select 
        user_id,
        ntile(5) over(order by sum(payment)) as monetary_value
    from analysis.orders
    where 
        date_trunc('year', order_ts) :: date = '2022-01-01'
        and status = (
            select 
                id
            from analysis.orderstatuses 
            where
                key = 'Closed'
        )
    group by 
        user_id
);