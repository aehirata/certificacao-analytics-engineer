with
    source as (
        select * 
        from {{ source('adventure_works', 'employeepayhistory') }}
    )

    , renamed as (
        select
            businessentityid
            , ratechangedate
            , cast(rate as numeric(38,10)) as rate
            , payfrequency
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed