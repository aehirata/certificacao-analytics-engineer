with
    sales_reason as (
        select *
        from {{ ref('stg_adventure_works__salesreason') }}
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesreasonid']) }} as salesreason_pk
            , name as sales_reason_name
            , reasontype as sales_reason_type
        from sales_reason
    )

select *
from generate_sk   