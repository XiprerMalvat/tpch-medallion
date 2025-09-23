with
    source as (select * from {{ ref("stg_orders") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            o_orderkey as id,
            o_custkey as customer_id,
            o_orderstatus as status_code,
            o_totalprice as total_price,
            o_orderdate as order_date,
            o_orderpriority as priority_code,
            o_clerk as clerk_name,
            o_shippriority as ship_priority,
            o_comment as comment

        from source

    )

select *
from renamed
