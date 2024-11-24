with
    source as (
        select * 
        from {{ source('adventure_works', 'workorder') }}
    )

    , renamed as (
        select
            workorderid
            , productid
            , orderqty
            , scrappedqty
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(duedate as timestamp) as duedate
            , scrapreasonid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed