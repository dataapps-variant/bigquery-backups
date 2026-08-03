-- job_id: scheduled_query_6a7238aa-0000-25d1-8374-d4f547f95ab8
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T10:30:05.437000+00:00
-- started: 2026-07-28T10:30:05.904000+00:00
-- ended: 2026-07-28T10:30:08.077000+00:00

Create or replace table `variant-finance-data-project.Shared_PD_Data.Sticky_PD` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='PD'
