with
    source as (
        select * 
        from {{ source('adventure_works', 'shoppingcartitem') }}
    )

    , renamed as (
        select
            shoppingcartitemid
            , shoppingcartid
            , quantity
            , productid
            , cast(datecreated as timestamp) as datecreated
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed