with
    sales_order as (
        select *
        from {{ ref('fct_order') }}
        where year(orderdate) = '2011'
    )

    , sales_order_detail as (
        select *
        from {{ ref('fct_order_detail') }}
    )

    , gross_sales_2011 as (
        select
            round(sum(unitprice * orderqty),2) as gross_sales
        from sales_order
        left join sales_order_detail using (salesorder_pk)
    )

    , test as (
        select *
        from gross_sales_2011
        where gross_sales != 12646112.16
    )
    
select * 
from test