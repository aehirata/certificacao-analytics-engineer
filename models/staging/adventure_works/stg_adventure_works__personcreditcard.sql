with
    source as (
        select * 
        from {{ source('adventure_works', 'personcreditcard') }}
    )

    , renamed as (
        select
            businessentityid
            , creditcardid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed