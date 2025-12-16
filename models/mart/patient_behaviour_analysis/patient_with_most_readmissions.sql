select 
p.first as first_name,
p.last as last_name,
e.patient as patient_id,
count(*) as encounter_counts
from {{ ref('stg_patient_records__encounters') }} e
left join {{ ref('stg_patient_records__patients') }} p
    on e.patient = p.id
group by first_name, last_name, patient_id
qualify row_number() over(order by encounter_counts desc) = 1