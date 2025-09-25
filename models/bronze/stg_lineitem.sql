{{ config(
    materialized='incremental',
    unique_key='_record_hash'
) }}

with src as (
  select *, 
    current_timestamp() as _ingest_ts,
    '{{ invocation_id }}' as _ingest_batch_id,
    lower(hash( concat(to_varchar(L_ORDERKEY), '|', to_varchar(L_LINENUMBER)))) as _record_hash
  from {{ source('staging','lineitem') }}
)
select * from src