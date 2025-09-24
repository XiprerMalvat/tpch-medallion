with
    source as (select * from {{ ref("stg_customer") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            c_custkey as id,
            c_address as "address",
            c_name as "name",
            c_nationkey as nation_id,
            c_phone as phone,
            c_acctbal as account_balance,
            c_mktsegment as market_segment

        from source

    )

select *
from renamed
