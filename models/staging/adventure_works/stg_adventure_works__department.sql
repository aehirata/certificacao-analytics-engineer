with
    source as (
        select * 
        from {{ source('adventure_works', 'department') }}
    )

    , renamed as (
        select
            departmentid
            , name
            , groupname
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed