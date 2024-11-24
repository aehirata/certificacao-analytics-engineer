with
    source as (
        select *
        from {{ source('adventure_works', 'product') }}
    )

    , renamed as (
        select
            productid
            , name
            , productnumber
            , makeflag
            , finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , cast(standardcost as numeric(38,10)) as standardcost
            , cast(listprice as numeric(38,10)) as listprice
            , size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , cast(weight as numeric(38,10)) as weight
            , daystomanufacture
            , productline
            , class
            , style
            , productsubcategoryid
            , productmodelid
            , cast(sellstartdate as timestamp) as sellstartdate
            , cast(sellenddate as timestamp) as sellenddate
            , discontinueddate
            , rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from source
    )

select * 
from renamed