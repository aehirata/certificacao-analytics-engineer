with
    source as (
        select * 
        from {{ source('adventure_works', 'salesorderheadersalesreason') }}
    )

    , renamed as (
        select
            salesorderid
            , salesreasonid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed