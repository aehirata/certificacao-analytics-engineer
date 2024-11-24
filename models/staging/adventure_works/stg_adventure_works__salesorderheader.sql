with
    source as (
        select * 
        from {{ source('adventure_works', 'salesorderheader') }}
    )

    , renamed as (
        select
            salesorderid
            , revisionnumber
            , cast(orderdate as timestamp) as orderdate
            , cast(duedate as timestamp) as duedate
            , cast(shipdate as timestamp) as shipdate
            , status
            , onlineorderflag
            , purchaseordernumber
            , accountnumber
            , customerid
            , salespersonid
            , territoryid
            , billtoaddressid
            , shiptoaddressid
            , shipmethodid
            , creditcardid
            , creditcardapprovalcode
            , currencyrateid
            , cast(subtotal as numeric(38,10)) as subtotal
            , cast(taxamt as numeric(38,10)) as taxamt
            , cast(freight as numeric(38,10)) as freight
            , cast(totaldue as numeric(38,10)) as totaldue
            , comment
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed