with
    sales_order_header as (
        select *
        from {{ ref('stg_adventure_works__salesorderheader') }}
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as salesorder_pk
            , {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_pk
            , {{ dbt_utils.generate_surrogate_key(['salespersonid']) }} salesperson_pk
            , {{ dbt_utils.generate_surrogate_key(['territoryid']) }} territory_pk
            , {{ dbt_utils.generate_surrogate_key(['shiptoaddressid']) }} shiptoaddress_pk
            , {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} creditcard_pk
            , revisionnumber
            , orderdate
            , duedate
            , shipdate
            , order_status
            , subtotal
            , taxamt
            , freight
            , totaldue
        from sales_order_header
    )

select *
from generate_sk