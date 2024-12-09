with
    credit_card as (
        select *
        from {{ ref('stg_adventure_works__creditcard') }}
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_pk
            , cardtype
            , cardnumber
            , expmonth
            , expyear
        from credit_card
    )

select *
from generate_sk