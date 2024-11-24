with
    source as (
        select * 
        from {{ source('adventure_works', 'emailaddress') }}
    )

    , renamed as (
        select
            businessentityid
            , emailaddressid
            , emailaddress
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed