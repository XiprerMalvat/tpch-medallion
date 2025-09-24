{% snapshot customer_snapshot %}

{{

config(

target_schema='snapshots',

unique_key='_record_hash',

strategy='timestamp',

updated_at='_ingest_ts'

)

}}

SELECT * FROM {{ ref("stg_customer") }}

{% endsnapshot %}