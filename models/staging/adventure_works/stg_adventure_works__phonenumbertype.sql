with
    source as (
        select * 
        from {{ source('adventure_works', 'phonenumbertype') }}
    )

    , renamed as (
        select
            phonenumbertypeid
            , name
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed