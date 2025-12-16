with base as (
    select 
    *,
    case when payer_coverage <= 0 then 'zero payer coverage'
        else 'non-zero payer coverage'
    end as payer_coverage_category 
    from {{ ref('stg_patient_records__encounters') }}
)

select 
    payer_coverage_category,
    count(*) as cnt_encounters,
    sum(cnt_encounters) over () as total,
    round(ratio_to_report(cnt_encounters) over (),2) as pct_of_total
from base
group by 1
order by 1