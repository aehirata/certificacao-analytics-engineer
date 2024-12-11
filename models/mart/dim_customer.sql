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
            customer.customerid
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
            customer.customerid
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
            {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_pk
            , customerid
            , listagg(customer_type, '; ') within group (order by customer_type) as customer_type
            , listagg(customer_name, '; ') within group (order by customer_type) as customer_name
        from all_customers
        group by customer_pk, customerid
    )

select *
from generate_sk
