with
    source as (
        select * 
        from {{ source('adventure_works', 'workorderrouting') }}
    )

    , renamed as (
        select
            workorderid
            , productid
            , operationsequence
            , locationid
            , cast(scheduledstartdate as timestamp) as scheduledstartdate
            , cast(scheduledenddate as timestamp) as scheduledenddate
            , cast(actualstartdate as timestamp) as actualstartdate
            , cast(actualenddate as timestamp) as actualenddate
            , cast(actualresourcehrs as numeric(38,10)) as actualresourcehrs
            , cast(plannedcost as numeric(38,10)) as plannedcost
            , cast(actualcost as numeric(38,10)) as actualcost
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed