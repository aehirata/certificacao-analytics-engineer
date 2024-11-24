with
    source as (
        select * 
        from {{ source('adventure_works', 'culture') }}
    )

    , renamed as (
        select
            cultureid
            , name
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed