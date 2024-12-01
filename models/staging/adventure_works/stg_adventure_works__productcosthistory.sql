with
    source as (
        select * 
        from {{ source('adventure_works', 'productcosthistory') }}
    )

    , renamed as (
        select
            productid
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(standardcost as numeric(38,10)) as standardcost
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed