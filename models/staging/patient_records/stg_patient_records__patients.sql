with 

source as (

    select * from {{ source('patient_records', 'patients') }}

),

renamed as (

    select
        id,
        birthdate,
        deathdate,
        prefix,
        first,
        last,
        suffix,
        maiden,
        marital,
        race,
        ethnicity,
        gender,
        birthplace,
        address,
        city,
        state,
        county,
        zip,
        lat,
        lon

    from source

)

select * from renamed