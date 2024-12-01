with
    source as (
        select * 
        from {{ source('adventure_works', 'productdescription') }}
    )

    , renamed as (
        select
            productdescriptionid
            , description
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed