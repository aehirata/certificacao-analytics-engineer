with
    source as (
        select * 
        from {{ source('adventure_works', 'salesreason') }}
    )

    , renamed as (
        select
            salesreasonid
            , name
            , reasontype
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed