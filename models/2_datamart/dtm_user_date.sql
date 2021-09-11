{{
    config(
        materialized='table',
        tags = ['dtm','user']
    )
}}

select  date_trunc(cast(LAST_REG_TIME as date),day) reg_date,
        count(*) user_count
from {{source('test_source','Users')}}
group by 1
union all
select '2021-01-01',10
