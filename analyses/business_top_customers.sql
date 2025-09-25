-- Top 10 spending customers (net spending) with a positive account balance. 
with ranked_customers as (

    select
        
        row_number() over (
                order by sum(o.extended_price) + sum(o.discounted_price) desc
        ) as position -- LIMIT and TOP return errors, this is a workaround
        sum(o.extended_price) + sum(o.discounted_price) as net_spending,
        customer.customer_name,
        customer.nation_name,
        customer.address,
        sum(o.extended_price) as gross_spending,
        sum(o.discounted_price) as discounted_spending,

    from
        {{ ref('fact_sales_orders') }} as o
    join
        {{ ref('dim_customer') }} as customer
    on o.customer_id = customer.id
    where
        customer.account_balance > 0
    group by
        customer.customer_name,
        customer.nation_name,
        customer.address
    /*
    order by
        net_spending DESC
    */

)
select
    *
from
    ranked_customers
where rn <= 10
/*
limit 10
*/