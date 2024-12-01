with
    source as (
        select * 
        from {{ source('adventure_works', 'store') }}
    )

    , renamed as (
        select
            businessentityid
            , name
            , salespersonid
            , demographics
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamedwith
    source as (
        select * 
        from {{ source('adventure_works', 'store') }}
    )

    , renamed as (
        select
            businessentityid
            , name
            , salespersonid
            , demographics
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed