-- job_id: scheduled_query_6aab77b4-0000-2fa5-bcfc-240588731210
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T10:30:06.177000+00:00
-- started: 2026-08-01T10:30:06.467000+00:00
-- ended: 2026-08-01T10:30:08.365000+00:00

Create or replace table `variant-finance-data-project.Shared_PD_Data.Sticky_PD` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='PD'
