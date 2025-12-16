select
    date_trunc(quarter, start_time)::date as quarter, 
    count(distinct patient) as unique_user_count
from {{ ref('stg_patient_records__encounters') }}
group by 1
order by 1 asc