create table analysis.tmp_rfm_frequency (
 user_id int not null primary key,
 frequency int not null check(frequency >= 1 and frequency <= 5)
);

insert into analysis.tmp_rfm_frequency (
    select 
        user_id,
        ntile(5) over(order by count(*)) as frequency
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