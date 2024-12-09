with
    status as (
        select distinct order_status as order_status_id
        from {{ ref('stg_adventure_works__salesorderheader') }}
    )

    , status_description as (
        select
            order_status_id
            , case
                when order_status_id = 1 then 'In process'
                when order_status_id = 2 then 'Approved'
                when order_status_id = 3 then 'Backordered'
                when order_status_id = 4 then 'Rejected'
                when order_status_id = 5 then 'Shipped'
                when order_status_id = 6 then 'Cancelled'
            end as order_status_description
        from status
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['order_status_id']) }} as order_status_pk
            , order_status_description
        from status_description
    )

select * 
from generate_sk