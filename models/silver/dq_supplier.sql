with
    source as (select * from {{ ref("stg_supplier") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            s_suppkey as id,
            s_name as "name",
            s_phone as phone,
            s_nationkey as nation_id,
            s_address as "address",
            s_acctbal as account_balance,
            s_comment as comment

        from source

    )

select *
from renamed
