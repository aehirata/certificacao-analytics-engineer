with
    source as (
        select * 
        from {{ source('adventure_works', 'countryregioncurrency') }}
    )

    , renamed as (
        select
            countryregioncode
            , currencycode
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed