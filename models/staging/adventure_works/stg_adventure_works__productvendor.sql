with
    source as (
        select * 
        from {{ source('adventure_works', 'productvendor') }}
    )

    , renamed as (
        select
            productid
            , businessentityid
            , averageleadtime
            , cast(standardprice as numeric(38,10)) as standardprice
            , cast(lastreceiptcost as numeric(38,10)) as lastreceiptcost
            , cast(lastreceiptdate as timestamp) as lastreceiptdate
            , minorderqty
            , maxorderqty
            , onorderqty
            , unitmeasurecode
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed