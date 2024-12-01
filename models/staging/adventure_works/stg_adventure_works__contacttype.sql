with 

source as (

    select * from {{ source('adventure_works', 'contacttype') }}

),

renamed as (

    select
        contacttypeid,
        name,
        modifieddate

    from source

)

select * from renamed
