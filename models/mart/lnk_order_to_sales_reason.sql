with
    order_reason as (
        select * 
        from {{ ref('stg_adventure_works__salesorderheadersalesreason') }}
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesreasonid']) }} as sales_order_reason_pk
            , {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as salesorder_pk
            , {{ dbt_utils.generate_surrogate_key(['salesreasonid']) }} as salesreason_pk
        from order_reason
    )

select * 
from generate_sk