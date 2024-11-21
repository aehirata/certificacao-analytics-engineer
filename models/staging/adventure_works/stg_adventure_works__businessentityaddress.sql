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
            , modifieddate
        from source
    )

select * 
from renamed