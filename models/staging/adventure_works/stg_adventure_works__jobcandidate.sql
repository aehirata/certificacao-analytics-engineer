with
    source as (
        select * 
        from {{ source('adventure_works', 'jobcandidate') }}
    )

    , renamed as (
        select
            jobcandidateid
            , businessentityid
            , resume
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed