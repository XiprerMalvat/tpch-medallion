with
    source as (select * from {{ ref("stg_partsupp") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            ps_suppkey as supplier_id,
            ps_partkey as part_id,
            ps_supplycost as supply_cost,
            ps_availqty as available_quantity,
            ps_comment as comment

        from source

    )

select *
from renamed
