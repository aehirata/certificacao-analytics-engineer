with 
    source as (
        select * 
        from {{ source('adventure_works', 'addresstype') }}

    ) 

    , renamed as (
        select
            addresstypeid
            , name
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select *
from renamed