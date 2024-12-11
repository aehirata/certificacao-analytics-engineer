with
    sales_order_detail as (
        select *
        from {{ ref('stg_adventure_works__salesorderdetail') }}
    )

    , revenue as (
        select
            *
            , (unitprice - unitpricediscount) * orderqty as revenue
        from sales_order_detail
    )

    , generate_sk as (
        select distinct
            {{ dbt_utils.generate_surrogate_key(['salesorderdetailid', 'salesorderid']) }} as pk
            , {{ dbt_utils.generate_surrogate_key(['salesorderdetailid']) }} as salesorderdetail_pk
            , {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as salesorder_pk
            , {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_pk
            , {{ dbt_utils.generate_surrogate_key(['specialofferid']) }} as specialoffer_pk
            , unitprice
            , unitpricediscount
            , orderqty
            , revenue
        from revenue
    )

select *
from generate_sk