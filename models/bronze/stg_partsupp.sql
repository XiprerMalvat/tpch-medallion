{{ config(
    materialized='incremental',
    unique_key='_record_hash'
) }}

with src as (
  select *, 
    current_timestamp() as _ingest_ts,
    '{{ invocation_id }}' as _ingest_batch_id,
    lower(hash( concat(to_varchar(PS_PARTKEY), '|', to_varchar(PS_SUPPKEY)))) as _record_hash
  from {{ source('staging','partsupp') }}
)
select * from src