with
    source as (
        select * 
        from {{ source('adventure_works', 'customer') }}
    )

    , renamed as (
        select
            customerid
            , personid
            , storeid
            , territoryid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed