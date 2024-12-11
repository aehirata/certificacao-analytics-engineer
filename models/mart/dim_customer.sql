with
    businessentitycontact as (
        select *
        from {{ ref('stg_adventure_works__businessentitycontact') }}
    )

    , customer as (
        select *
        from {{ ref('stg_adventure_works__customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_adventure_works__person') }}
    )

    , store as (
        select *
        from {{ ref('stg_adventure_works__store') }}
    )

    , person_customer as (
        select
            customer.personid as businessentityid
            , person.firstname || ' ' || coalesce(person.middlename, '') || ' ' || person.lastname as customer_name
            , 'Person' as customer_type
        from businessentitycontact
        inner join person 
            on person.businessentityid = businessentitycontact.personid
        inner join customer
            on customer.personid = person.businessentityid
    )

    , store_customer as (
        select
            businessentityid
            , name as customer_name
            , 'Store' as customer_type
        from store
        inner join customer
            on store.businessentityid = customer.storeid
    )

    , all_customers as (
        select *
        from person_customer
        union
        select *
        from store_customer
    )

    , generate_sk as (
        select 
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as customer_pk
            , customer_name
            , customer_type
        from all_customers
    )

select *
from generate_sk