with 

source as (

    select * from {{ source('patient_records', 'payers') }}

),

renamed as (

    select
        id,
        name,
        address,
        city,
        state_headquartered,
        zip,
        phone

    from source

)

select * from renamed