with
    source as (select * from {{ ref("stg_lineitem") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            {{ dbt_utils.generate_surrogate_key(["l_orderkey", "l_linenumber"]) }}
            as order_item_key,
            l_orderkey as order_id,
            l_partkey as part_id,
            l_suppkey as supplier_id,
            l_linenumber as line_number,
            l_quantity as quantity,
            l_extendedprice as extended_price,
            l_discount as discount_percentage,
            l_tax as tax_rate,
            l_returnflag as return_flag,
            l_linestatus as status_code,
            l_shipdate as ship_date,
            l_commitdate as commit_date,
            l_receiptdate as receipt_date,
            l_shipinstruct as ship_instructions,
            l_shipmode as ship_mode,
            l_comment as comment

        from source

    )

select *
from renamed
