with 
    source as (
        select *
        from {{ source('adventure_works', 'address') }}
)

, renamed as (
    select
        addressid
        , addressline1
        , addressline2
        , city
        , stateprovinceid
        , postalcode
        , spatiallocation
        , rowguid
        , cast(modifieddate as timestamp) as modifieddate
    from source
    )

select * 
from renamed
