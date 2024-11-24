with
    source as (
        select * 
        from {{ source('adventure_works', 'employeedepartmenthistory') }}
    )

    , renamed as (
        select
            businessentityid
            , departmentid
            , shiftid
            , startdate
            , enddate
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed