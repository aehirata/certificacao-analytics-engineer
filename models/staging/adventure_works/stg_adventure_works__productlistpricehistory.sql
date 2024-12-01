with
    source as (
        select *
        from {{ source('adventure_works', 'productlistpricehistory') }}
    )

    , renamed as (
        select
            productid
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(listprice as numeric(38,10)) as listprice
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed