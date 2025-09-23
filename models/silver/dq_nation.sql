with
    source as (select * from {{ ref("stg_nation") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            n_nationkey as id,
            n_name as "name",
            n_comment as n_comment,
            c_nationkey as nation_key,
            c_phone as phone,
            c_acctbal as account_balance,
            c_mktsegment as market_segment

        from source

    )

select *
from renamed
