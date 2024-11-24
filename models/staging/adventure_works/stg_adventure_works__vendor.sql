with
    source as (
        select * 
        from {{ source('adventure_works', 'vendor') }}
    )

    , renamed as (
        select
            businessentityid
            , accountnumber
            , name
            , creditrating
            , preferredvendorstatus
            , activeflag
            , purchasingwebserviceurl
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed