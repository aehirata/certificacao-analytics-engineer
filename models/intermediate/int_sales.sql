
with
    sales_order_header as (
        select *
        from {{ ref('stg_adventure_works__salesorderheader') }}
    )

    , sales_order_detail as (
        select *
        from {{ ref('stg_adventure_works__salesorderdetail') }}
    )

    , sales as (
        select
            sales_order_header.salesorderid
            , salesorderdetailid
            , sales_order_header.orderdate
            , sales_order_header.order_status
            , sales_order_header.customerid
            , sales_order_header.shiptoaddressid
            , sales_order_header.creditcardid
            , sales_order_header.totaldue
            , sales_order_detail.orderqty
            , sales_order_detail.productid
            , sales_order_detail.specialofferid
            , (sales_order_detail.unitprice - sales_order_detail.unitpricediscount) * sales_order_detail.orderqty as revenue
            , sales_order_detail.unitpricediscount
            , sales_order_detail.unitprice
        from sales_order_header
        inner join sales_order_detail using (salesorderid)
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesorderdetailid']) }} as sales_key
            , {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_key
            , {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_key
            , {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_key
            , {{ dbt_utils.generate_surrogate_key(['shiptoaddressid']) }} as ship_address_key
            , {{ dbt_utils.generate_surrogate_key(['order_status']) }} as order_status_key
            , {{ dbt_utils.generate_surrogate_key(['orderdate']) }} as order_date_key
            , salesorderid
            , salesorderdetailid
            , unitprice
            , orderqty
            , revenue
        from sales
    )

select *
from generate_sk
