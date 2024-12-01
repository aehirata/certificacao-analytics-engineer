with
    source as (
        select * 
        from {{ source('adventure_works', 'businessentitycontact') }}
    )

    , renamed as (
        select
            businessentityid
            , personid
            , contacttypeid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed