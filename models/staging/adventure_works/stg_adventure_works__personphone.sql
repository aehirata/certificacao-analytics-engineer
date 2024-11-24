with
    source as (
        select * 
        from {{ source('adventure_works', 'personphone') }}
    )

    , renamed as (
        select
            businessentityid
            , phonenumber
            , phonenumbertypeid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed