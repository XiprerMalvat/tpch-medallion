with src as (
  select *, 
    current_timestamp() as _ingest_ts,
    '{{ invocation_id }}' as _ingest_batch_id,
    lower(hash( to_varchar(C_CUSTKEY))) as _record_hash
  from {{ source('staging','customer') }}
)
select * from src