select
    lineitem.id as line_order_id,
    lineitem.part_id,
    lineitem.line_number,
    lineitem.extended_price,
    orders.id as order_id,
    orders.customer_id,
    orders.order_date,
    {{ discounted_amount('lineitem.extended_price', 'lineitem.discount_percentage') }} as discounted_price
from
    {{ ref('dq_orders') }} as orders
join
    {{ ref('dq_lineitem') }} as lineitem
        on orders.id = lineitem.order_id
order by
    orders.order_date