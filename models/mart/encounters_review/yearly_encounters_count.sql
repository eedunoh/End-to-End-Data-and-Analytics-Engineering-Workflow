select
    date_trunc(year, start_time)::date as period
    , count(*) As enc_count
from {{ ref('stg_patient_records__encounters') }}
group by 1
order by 1 desc