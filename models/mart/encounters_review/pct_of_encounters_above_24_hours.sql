with base as (
    select 
    *,
    datediff('hours', start_time, stop_time) as encounter_time_diff,
    case when encounter_time_diff <= 24 then 'under 24 hours'
        else 'over 24 hours'
    end as time_diff_category 
    from {{ ref('stg_patient_records__encounters') }}
)

select 
    time_diff_category,
    count(*) as cnt_encounters,
    sum(cnt_encounters) over () as total,
    round(ratio_to_report(cnt_encounters) over (),3) as pct_of_total
from base
group by 1
order by 1