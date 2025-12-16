with base as (
    select
        date_trunc(year, start_time)::date as period,
        encounterclass
    from {{ ref('stg_patient_records__encounters') }}
)

select
    period,
    encounterclass,
    count(*) as cnt_encounters,
    sum(cnt_encounters) over (partition by period) as yearly_total,
    round(ratio_to_report(cnt_encounters) over (partition by period),2) as yearly_pct_per_enccounter_type
from base
group by period, encounterclass
order by period desc, encounterclass asc
