with
    source as (
        select * 
        from {{ source('adventure_works', 'businessentityaddress') }}
    )

    , renamed as (
        select
            businessentityid
            , addressid
            , addresstypeid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select *
from renamed 