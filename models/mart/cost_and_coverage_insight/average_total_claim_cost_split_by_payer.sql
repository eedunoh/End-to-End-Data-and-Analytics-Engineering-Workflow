with base as (
    select 
    *
    from {{ ref('stg_patient_records__encounters') }} e
    left join {{ ref('stg_patient_records__payers') }} p
        on e.payer = p.id
)

select 
name as payer_name
, round(avg(total_claim_cost),1) as avg_total_claim_cost
from base
group by 1
order by 2 desc