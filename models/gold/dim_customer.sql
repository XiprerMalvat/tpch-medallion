{{ config(
    materialized='incremental',
    unique_key='id'
) }}

select

    id,
    "address",
    "name",
    nation_id
    phone,
    account_balance,
    market_segment

from {{ ref('dq_customer') }}