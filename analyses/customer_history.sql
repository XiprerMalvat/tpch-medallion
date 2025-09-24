SELECT
    *
FROM
    {{ ref("customer_snapshot") }}
WHERE
    c_custkey = '60001'