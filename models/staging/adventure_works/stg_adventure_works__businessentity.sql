with 

    source as (
        select * 
        from {{ source('adventure_works', 'businessentity') }}
    )

    , renamed as (
        select
            businessentityid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select *
from renamed