with
    source as (
        select * 
        from {{ source('adventure_works', 'creditcard') }}
    )

    , renamed as (
        select
            creditcardid
            , cardtype
            , cardnumber
            , expmonth
            , expyear
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed