{{ config(
    materialized='incremental',
    unique_key='_record_hash'
) }}

with src as (
  select *, 
    current_timestamp() as _ingest_ts,
    '{{ invocation_id }}' as _ingest_batch_id,
    lower(hash( to_varchar(O_ORDERKEY))) as _record_hash
  from {{ source('staging','orders') }}
)
select * from src