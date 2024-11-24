with
    source as (
        select * 
        from {{ source('adventure_works', 'stateprovince') }}
    )

    , renamed as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name
            , territoryid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed