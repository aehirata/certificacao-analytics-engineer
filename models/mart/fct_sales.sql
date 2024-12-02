
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
            , sales_order_header.status
            , sales_order_header.customerid
            , sales_order_header.shiptoaddressid
            , sales_order_header.creditcardid
            , sales_order_header.totaldue
            , sales_order_detail.orderqty
            , sales_order_detail.productid
            , sales_order_detail.specialofferid
            , sales_order_detail.unitprice
            , sales_order_detail.unitpricediscount
            , sales_order_detail.unitprice 
            , sales_order_detail.modifieddate
        from sales_order_header
        inner join sales_order_detail using (salesorderid)
    )
