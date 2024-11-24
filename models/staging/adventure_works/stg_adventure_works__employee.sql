with
    source as (
        select * 
        from {{ source('adventure_works', 'employee') }}
    )

    , renamed as (
        select
            businessentityid
            , nationalidnumber
            , loginid
            , jobtitle
            , birthdate
            , maritalstatus
            , gender
            , hiredate
            , salariedflag
            , vacationhours
            , sickleavehours
            , currentflag
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
            , organizationnode
        from source
    )

select * 
from renamed