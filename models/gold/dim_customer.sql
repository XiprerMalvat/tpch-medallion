{{ config(
    materialized='incremental',
    unique_key='id'
) }}

select

    c.id as customer_id,
    c."name" as customer_name,
    c."address",
    n."name" as nation_name,
    r."name" as region_name,
    c.phone,
    c.account_balance,
    c.market_segment

from {{ ref('dq_customer') }} as c
join {{ ref('dq_nation') }} as n
on c.nation_id = n.id
join {{ ref('dq_region') }} as r
on n.region_id = r.id