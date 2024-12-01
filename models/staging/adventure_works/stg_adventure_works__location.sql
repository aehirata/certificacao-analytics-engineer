with
    source as (
        select * 
        from {{ source('adventure_works', 'location') }}
    )

    , renamed as (
        select
            "locationid" as locationid
            , "name" as name
            , cast("costrate" as numeric(38,10)) as costrate
            , "availability" as availability
            , cast("modifieddate" as timestamp) as modifieddate
        from source
    )

select * 
from renamed