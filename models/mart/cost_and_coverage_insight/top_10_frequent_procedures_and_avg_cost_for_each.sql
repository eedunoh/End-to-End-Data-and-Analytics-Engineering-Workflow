select
    description,
    count(*) as cnt,
    round(avg(base_cost),1) as avg_base_cost,
    row_number() over (order by cnt desc) as rank
from {{ ref('stg_patient_records__procedures') }}
group by description
qualify row_number() over (order by cnt desc) <= 10
