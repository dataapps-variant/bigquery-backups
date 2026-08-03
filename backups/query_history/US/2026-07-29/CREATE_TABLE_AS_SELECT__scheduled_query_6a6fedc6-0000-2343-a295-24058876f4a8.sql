-- job_id: scheduled_query_6a6fedc6-0000-2343-a295-24058876f4a8
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:30:04.287000+00:00
-- started: 2026-07-29T10:30:04.584000+00:00
-- ended: 2026-07-29T10:30:07.818000+00:00

Create or replace table `variant-finance-data-project.Shared_PD_Data.Sticky_PD` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='PD'
