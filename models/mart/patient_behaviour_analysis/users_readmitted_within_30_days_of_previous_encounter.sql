with base as (
    select 
    patient,
    start_time,
    LEAD(start_time, 1) over (partition by patient order by start_time desc) as last_encounter_time,
    datediff(day, last_encounter_time, start_time) as dt_diff
    from {{ ref('stg_patient_records__encounters') }}
    order by start_time desc
)

select 
count(distinct patient) as unique_user_count
from base
where dt_diff <= 30