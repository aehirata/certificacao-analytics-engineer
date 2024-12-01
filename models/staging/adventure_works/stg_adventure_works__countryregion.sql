with
    source as (
        select * 
        from {{ source('adventure_works', 'countryregion') }}
    )

    , renamed as (
        select
            countryregioncode
            , name
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed