create table analysis.tmp_rfm_recency (
 user_id int not null primary key,
 recency int not null check(recency >= 1 and recency <= 5)
);

insert into analysis.tmp_rfm_recency (
    select 
        user_id,
        ntile(5) over(order by date_part('day', now() - max(order_ts))) as recency
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