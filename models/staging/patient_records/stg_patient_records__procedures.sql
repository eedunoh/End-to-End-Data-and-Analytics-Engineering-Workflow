with 

source as (

    select * from {{ source('patient_records', 'procedures') }}

),

renamed as (

    select
        start_time,
        stop_time,
        patient,
        encounter,
        code,
        description,
        base_cost,
        reasoncode,
        reasondescription

    from source

)

select * from renamed