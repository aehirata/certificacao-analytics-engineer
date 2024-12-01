with
    source as (
        select * 
        from {{ source('adventure_works', 'salesterritory') }}
    )

    , renamed as (
        select
            territoryid
            , name
            , countryregioncode
            , "group"
            , cast(salesytd as numeric(38,10)) as salesytd
            , cast(saleslastyear as numeric(38,10)) as saleslastyear
            , costytd
            , costlastyear
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed