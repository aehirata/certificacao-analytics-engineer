with
    product as (
        select *
        from {{ ref('stg_adventure_works__product') }}
    )

    , product_category as (
        select *
        from {{ ref('stg_adventure_works__productcategory') }}
    )

    , product_sub_category as (
        select *
        from {{ ref('stg_adventure_works__productsubcategory') }}
    )

    , product_enriched as (
        select
            {{ dbt_utils.generate_surrogate_key(['product.productid']) }} as product_pk
            , product.productid
            , product.name as product_name
            , product.productnumber
            , product.color
            , product.class
            , product_sub_category.name as product_subcategory_name
            , product_category.name as product_category_name
        from product
        left join product_sub_category using (productsubcategoryid)
        left join product_category using (productcategoryid)
    )

select *
from product_enriched