with
    source as (
        select * 
        from {{ source('adventure_works', 'purchaseorderheader') }}
    )

    , renamed as (
        select
            purchaseorderid
            , revisionnumber
            , status
            , employeeid
            , vendorid
            , shipmethodid
            , cast(orderdate as timestamp) as orderdate
            , cast(shipdate as timestamp) as shipdate
            , cast(subtotal as numeric(38,10)) as subtotal
            , cast(taxamt as numeric(38,10)) as taxamt
            , cast(freight as numeric(38,10)) as freight
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed