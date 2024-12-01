with
    source as (
        select * 
        from {{ source('adventure_works', 'scrapreason') }}
    )

    , renamed as (
        select
            scrapreasonid
            , name
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed