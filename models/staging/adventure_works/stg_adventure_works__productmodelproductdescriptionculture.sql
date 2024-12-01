with
    source as (
        select * 
        from {{ source('adventure_works', 'productmodelproductdescriptionculture') }}
    )

    , renamed as (
        select
            productmodelid
            , productdescriptionid
            , cultureid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed