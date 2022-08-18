insert into analysis.dm_rfm_segments (
    with r as (
        select *
        from analysis.tmp_rfm_recency
    ),
    mv as (
        select *
        from analysis.tmp_rfm_monetary_value
    )
    select
        f.user_id,
        r.recency,
        f.frequency,
        mv.monetary_value
    from analysis.tmp_rfm_frequency as f
    inner join mv on f.user_id = mv.user_id
    inner join r on f.user_id = r.user_id
    order by f.user_id
)

0	5	3	4
1	2	3	3
2	4	3	5
3	4	3	3
4	2	3	3
5	1	5	5
6	5	3	5
7	2	2	2
8	5	1	3
9	5	2	2