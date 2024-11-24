with
    source as (
        select * 
        from {{ source('adventure_works', 'purchaseorderdetail') }}
    )

    , renamed as (
        select
            purchaseorderid
            , "purchaseorderdetailid" as purchaseorderdetailid
            , cast("duedate" as timestamp) as duedate
            , "orderqty" as orderqty
            , "productid" as productid
            , cast("unitprice" as numeric(38,10)) as unitprice
            , "receivedqty" as receivedqty
            , "rejectedqty" as rejectedqty
            , "modifieddate" as modifieddate
        from source
    )

select * 
from renamed