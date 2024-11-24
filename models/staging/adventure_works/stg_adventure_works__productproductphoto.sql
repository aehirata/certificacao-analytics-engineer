with
    source as (
        select * 
        from {{ source('adventure_works', 'productproductphoto') }}
    )

    , renamed as (
        select
            productid
            , productphotoid
            , primary
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed