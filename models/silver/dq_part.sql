with
    source as (select * from {{ ref("stg_part") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            p_partkey as id,
            p_name as "name",
            p_brand as brand,
            p_container as container,
            p_retailprice as retail_price,
            p_size as "size",
            p_type as "type",
            p_mfgr as manufacturer

        from source

    )

select *
from renamed
