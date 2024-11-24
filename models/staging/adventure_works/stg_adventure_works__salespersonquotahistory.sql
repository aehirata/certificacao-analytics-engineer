with
    source as (
        select * 
        from {{ source('adventure_works', 'salespersonquotahistory') }}
    )

    , renamed as (
        select
            businessentityid
            , cast(quotadate as timestamp) as quotadate
            , salesquota
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed