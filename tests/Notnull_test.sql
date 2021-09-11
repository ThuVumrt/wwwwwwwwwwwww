select *
from {{ref('stg_orders')}}
where order_id is null
