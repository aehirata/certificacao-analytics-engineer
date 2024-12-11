
with    
    address as (
        select *
        from {{ ref('stg_adventure_works__address') }}
    )

    , state_province as (
        select *
        from {{ ref('stg_adventure_works__stateprovince') }}
    )

    , country_region as (
        select *
        from {{ ref('stg_adventure_works__countryregion') }}
    )

    , joined as (
        select
            address.addressid
            , address.addressline1
            , address.city
            , state_province.name as state_name
            , state_province.stateprovincecode
            , state_province.stateprovinceid
            , country_region.name as country_name
            , country_region.countryregioncode as country_code
            , state_province.territoryid
        from address
        left join state_province using (stateprovinceid)
        left join country_region using (countryregioncode)
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['addressid']) }} as address_pk
            , addressline1
            , city
            , state_name
            , stateprovincecode
            , stateprovinceid
            , country_name
            , country_code
        from joined

    )

select *
from generate_sk