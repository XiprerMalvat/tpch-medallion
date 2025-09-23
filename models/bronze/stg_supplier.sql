with src as (
  select *, 
    current_timestamp() as _ingest_ts,
    '{{ invocation_id }}' as _ingest_batch_id,
    lower(hash( to_varchar(S_SUPPKEY))) as _record_hash
  from {{ source('staging','supplier') }}
)
select * from src