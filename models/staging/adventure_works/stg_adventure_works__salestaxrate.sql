with
    source as (
        select * 
        from {{ source('adventure_works', 'salestaxrate') }}
    )

    , renamed as (
        select
            salestaxrateid
            , stateprovinceid
            , taxtype
            , cast(taxrate as numeric(38,10)) as taxrate
            , name
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed