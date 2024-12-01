with
    source as (
        select * 
        from {{ source('adventure_works', 'salesterritoryhistory') }}
    )

    , renamed as (
        select
            businessentityid
            , territoryid
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed