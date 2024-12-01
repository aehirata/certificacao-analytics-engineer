with
    source as (
        select * 
        from {{ source('adventure_works', 'shift') }}
    )

    , renamed as (
        select
            shiftid
            , name
            , cast(starttime as timestamp) as starttime
            , cast(endtime as timestamp) as endtime
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed