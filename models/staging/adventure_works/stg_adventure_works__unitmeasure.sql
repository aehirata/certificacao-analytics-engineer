with
    source as (
        select * 
        from {{ source('adventure_works', 'unitmeasure') }}
    )

    , renamed as (
        select
            unitmeasurecode
            , name
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed