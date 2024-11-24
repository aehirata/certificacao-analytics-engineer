with
    source as (
        select * 
        from {{ source('adventure_works', 'currency') }}
    )

    , renamed as (
        select
            currencycode
            , name
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed