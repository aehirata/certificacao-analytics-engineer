with
    source as (
        select * 
        from {{ source('adventure_works', 'specialofferproduct') }}
    )

    , renamed as (
        select
            specialofferid
            , productid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed