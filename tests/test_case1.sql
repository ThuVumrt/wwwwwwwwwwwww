with user_count_data as (
  select count(*) user_count
  from  {{source('test_source','Users')}}
),
dtm_user_count_data as (
  select sum(user_count) dtm_total
  from {{ref('dtm_user_date')}}
)
select *
from user_count_data
cross join dtm_user_count_data
where user_count <> dtm_total
