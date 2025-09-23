with
    source as (select * from {{ ref("stg_region") }}),

    renamed as (
        -- We would cast types as well here if it was necessary.
        -- E.g.: When ingesting from a raw format such as a CSV file.
        select

            r_regionkey as id,
            r_name as "name",
            r_comment as comment

        from source

    )

select *
from renamed
