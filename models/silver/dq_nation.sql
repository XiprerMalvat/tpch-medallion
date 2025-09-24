with
    source as (select * from {{ ref("stg_nation") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            n_nationkey as id,
            n_name as "NAME",
            n_comment as n_comment,
            n_regionkey as region_id

        from source

    )

select *
from renamed
