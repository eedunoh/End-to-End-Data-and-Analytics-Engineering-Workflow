with 

source as (

    select * from {{ source('patient_records', 'organizations') }}

),

renamed as (

    select
        id,
        name,
        address,
        city,
        state,
        zip,
        lat,
        lon

    from source

)

select * from renamed