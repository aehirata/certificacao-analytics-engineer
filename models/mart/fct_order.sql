with
    sales_order_header as (
        select *
        from {{ ref('stg_adventure_works__salesorderheader') }}
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as salesorder_pk
            , {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_pk
            , {{ dbt_utils.generate_surrogate_key(['salespersonid']) }} as salesperson_pk
            , {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_pk
            , {{ dbt_utils.generate_surrogate_key(['shiptoaddressid']) }} as shiptoaddress_pk
            , {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_pk
            , {{ dbt_utils.generate_surrogate_key(['order_status']) }} as order_status
            , revisionnumber
            , orderdate
            , duedate
            , shipdate
            , subtotal
            , taxamt
            , freight
            , totaldue
        from sales_order_header
    )

select *
from generate_sk