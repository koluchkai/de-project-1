create view analysis.orders as
with o as (	
	select 
		order_id,
		status_id,
		dttm,
		row_number() over(partition by order_id order by dttm desc) as number_status
	from production.orderstatuslog
	order by order_id
),
os as (
	select 
		order_id,
		status_id
	from o 
	where number_status = 1
)
select 
    om.order_id,
    om.order_ts,
    om.user_id,
    om.bonus_payment,
    om.payment,
    om.cost,
    om.bonus_grant,
    os.status_id as status
from production.orders as om
left join os on om.order_id = os.order_id;