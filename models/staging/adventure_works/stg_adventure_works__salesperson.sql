with
    source as (
        select * 
        from {{ source('adventure_works', 'salesperson') }}
    )

    , renamed as (
        select
            businessentityid
            , territoryid
            , cast(salesquota as numeric(38,10)) as salesquota
            , cast(bonus as numeric(38,10)) as bonus
            , cast(commissionpct as numeric(38,10)) as commissionpct
            , cast(salesytd as numeric(38,10)) as salesytd
            , cast(saleslastyear as numeric(38,10)) as saleslastyear
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed