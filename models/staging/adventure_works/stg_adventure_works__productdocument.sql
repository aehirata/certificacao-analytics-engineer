with
    source as (
        select * 
        from {{ source('adventure_works', 'productdocument') }}
    )

    , renamed as (
        select
            productid
            , cast(modifieddate as timestamp) as modifieddate
            , documentnode
        from source
    )

select * 
from renamed