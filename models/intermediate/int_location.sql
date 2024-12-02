{{
    config(
        materialized='ephemeral'
    )
}}
with    
    address as (
        select *
        from {{ ref('stg_adventure_works__address') }}
    )

    , business_entity_address as (
        select *
        from {{ ref('stg_adventure_works__businessentityaddress') }}
    )

    , state_province as (
        select *
        from {{ ref('stg_adventure_works__stateprovince') }}
    )

    , country_region as (
        select *
        from {{ ref('stg_adventure_works__countryregion') }}
    )

    , final as (
        select
            business_entity_address.businessentityid
            , address.addressline1
            , address.city
            , state_province.name as state_name
            , state_province.stateprovincecode
            , state_province.stateprovinceid
            , country_region.name as country_name
            , country_region.countryregioncode as country_code
            , state_province.territoryid
        from address
        left join business_entity_address using (addressid)
        left join state_province using (stateprovinceid)
        left join country_region using (countryregioncode)
    )

select *
from final