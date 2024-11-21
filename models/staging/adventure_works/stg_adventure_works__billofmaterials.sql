with 
    source as (
        select *
        from {{ source('adventure_works', 'billofmaterials') }}
    )

    , renamed as (
        select
            "billofmaterialsid" as billofmaterialsid
            , "productassemblyid" as productassemblyid
            , "componentid" as componentid
            , cast("startdate" as timestamp) as startdate
            , cast("enddate" as timestamp) as enddate
            , "unitmeasurecode" as unitmeasurecode
            , "bomlevel" as bomlevel
            , "perassemblyqty" as perassemblyqty
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed