with 

source as (

    select * from {{ source('patient_records', 'encounters') }}

),

renamed as (

    select
        id,
        start_time,
        stop_time,
        patient,
        organization,
        payer,
        encounterclass,
        code,
        description,
        base_encounter_cost,
        total_claim_cost,
        payer_coverage,
        reasoncode,
        reasondescription

    from source

)

select * from renamed