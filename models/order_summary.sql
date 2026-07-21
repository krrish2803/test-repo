{{ config(materialized='view') }}

with staged_orders as (
    select * from {{ source('analytics', 'stg_orders') }}
),

final as (
    select
        order_id,
        customer_id,
        amount_cents,
        status,
        ordered_at,
        amount_cents * 0.08 as tax_amount,
        amount_cents * 1.08 as total_with_tax
    from staged_orders
)

select * from final
-- additional comment
