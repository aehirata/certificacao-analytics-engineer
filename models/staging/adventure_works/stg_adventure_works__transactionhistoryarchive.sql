with
    source as (
        select * 
        from {{ source('adventure_works', 'transactionhistoryarchive') }}
    )

    , renamed as (
        select
            transactionid
            , productid
            , referenceorderid
            , referenceorderlineid
            , cast(transactiondate as timestamp) as transactiondate
            , transactiontype
            , quantity
            , cast(actualcost as numeric(38,10)) as actualcost
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed