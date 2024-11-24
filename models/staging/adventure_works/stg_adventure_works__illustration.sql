with
    source as (
        select * 
        from {{ source('adventure_works', 'illustration') }}
    )

    , renamed as (
        select
            illustrationid
            , diagram
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed