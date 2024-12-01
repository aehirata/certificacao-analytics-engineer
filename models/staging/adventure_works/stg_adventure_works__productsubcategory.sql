with
    source as (
        select * 
        from {{ source('adventure_works', 'productsubcategory') }}
    )

    , renamed as (
        select
            productsubcategoryid
            , productcategoryid
            , name
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed