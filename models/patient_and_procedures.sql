{{ config(materialized='table') }}

Select 
pa.prefix
, pa.first
, pa.last
, pa.marital
, pa.id As patient_ids
, pa.race
, po.description
, po.start_time As procedure_start
, po.stop_time As procedure_stop
From raw.patient_records.patients pa
Left Join raw.patient_records.procedures po
On pa.id = po.patient