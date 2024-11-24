with
    source as (
        select * 
        from {{ source('adventure_works', 'productmodel') }}
    )

    , renamed as (
        select
            productmodelid
            , name
            , catalogdescription
            , instructions
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed