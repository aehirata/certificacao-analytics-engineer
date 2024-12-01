with
    source as (
        select * 
        from {{ source('adventure_works', 'shipmethod') }}
    )

    , renamed as (
        select
            shipmethodid
            , name
            , cast(shipbase as numeric(38,10)) as shipbase
            , cast(shiprate as numeric(38,10)) as shiprate
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed