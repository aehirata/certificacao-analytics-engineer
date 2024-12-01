with
    source as (
        select * 
        from {{ source('adventure_works', 'salesorderdetail') }}
    )

    , renamed as (
        select
            salesorderid
            , salesorderdetailid
            , carriertrackingnumber
            , orderqty
            , productid
            , specialofferid
            , cast(unitprice as numeric(38,10)) as unitprice
            , cast(unitpricediscount as numeric(38,10)) as unitpricediscount
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed