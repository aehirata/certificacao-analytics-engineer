with
    source as (
        select * 
        from {{ source('adventure_works', 'currencyrate') }}
    )

    , renamed as (
        select
            currencyrateid
            , cast(currencyratedate as timestamp) as currencyratedate
            , fromcurrencycode
            , tocurrencycode
            , cast(averagerate as numeric(38,10)) as averagerate
            , cast(endofdayrate as numeric(38,10)) as endofdayrate
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed
