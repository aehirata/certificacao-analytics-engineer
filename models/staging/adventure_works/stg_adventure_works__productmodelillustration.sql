with
    source as (
        select * 
        from {{ source('adventure_works', 'productmodelillustration') }}
    )

    , renamed as (
        select
            productmodelid
            , illustrationid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed