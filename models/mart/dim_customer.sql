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

    , joined as (
        select
            customer.customerid
            , customer.personid
            , person.firstname
            , person.middlename
            , person.lastname
            , person.firstname || ' ' || coalesce(person.middlename, '') || ' ' || person.lastname as fullname
        from businessentitycontact
        inner join person using (businessentityid)
        inner join customer using (customerid)
    )

select *
from joined