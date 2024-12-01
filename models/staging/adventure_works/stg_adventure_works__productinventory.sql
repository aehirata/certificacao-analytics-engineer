with
    source as (
        select * 
        from {{ source('adventure_works', 'productinventory') }}
    )

    , renamed as (
        select
            productid
            , locationid
            , shelf
            , bin
            , quantity
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed