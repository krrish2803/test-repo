with source as (
    select * from {{ source('raw', 'orders') }}
),
renamed as (
    select
        order_id,
        customer_id,
        order_date,
        status,
        amount as order_amount,
        currency
    from source
)
select * from renamed
