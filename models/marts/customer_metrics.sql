with orders as (
    select * from {{ ref('stg_orders') }}
),
customer_metrics as (
    select
        customer_id,
        count(*) as total_orders,
        sum(order_amount) as lifetime_value,
        avg(order_amount) as avg_order_value,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date
    from orders
    group by customer_id
)
select
    customer_id,
    total_orders,
    round(lifetime_value, 2) as customer_ltv,
    round(avg_order_value, 2) as avg_order_size,
    first_order_date,
    last_order_date,
    datediff('day', first_order_date, last_order_date) as customer_tenure_days
from customer_metrics
