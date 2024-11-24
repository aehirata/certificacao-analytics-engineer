with
    source as (
        select * 
        from {{ source('adventure_works', 'person') }}
    )

    , renamed as (
        select
            businessentityid
            , persontype
            , namestyle
            , title
            , firstname
            , middlename
            , lastname
            , suffix
            , emailpromotion
            , nullif(additionalcontactinfo, '[NULL]') as additionalcontactinfo
            , demographics
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select *
from renamed