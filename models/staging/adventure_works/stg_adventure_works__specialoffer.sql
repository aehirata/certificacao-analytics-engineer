with
    source as (
        select * 
        from {{ source('adventure_works', 'specialoffer') }}
    )

    , renamed as (
        select
            specialofferid
            , description
            , cast(discountpct as numeric(38,10)) as discountpct
            , type
            , category
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , minqty
            , maxqty
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed