with
    source as (
        select * 
        from {{ source('adventure_works', 'businessentityaddress') }}
    )

    , renamed as (
        select
            businessentityid
            , addressid
            , addresstypeid
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['businessentityid', 'addressid']) }} as businessentity_address_pk
            , businessentityid
            , addressid
            , addresstypeid
            , rowguid
            , modifieddate
    )

select *
from renamed 
where businessentityid = '20099'