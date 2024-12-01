with
    source as (
        select * 
        from {{ source('adventure_works', 'productcategory') }}
    )

    , renamed as (
        select
            productcategoryid
            , name
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed