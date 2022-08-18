create table analysis.dm_rfm_segments (
    user_id int4 not null primary key,
    recency int2 check(recency >= 1 and recency <= 5),
    frequency int2 check(frequency >= 1 and frequency <= 5),
    monetory_value int2 check(monetory_value >= 1 and monetory_value <= 5)
)