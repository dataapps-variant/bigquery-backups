-- job_id: scheduled_query_6a6fbaf1-0000-2852-8e73-089e082668b0
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T10:30:05.373000+00:00
-- started: 2026-07-30T10:30:06.054000+00:00
-- ended: 2026-07-30T10:30:09.120000+00:00

Create or replace table `variant-finance-data-project.Shared_PD_Data.Sticky_PD` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='PD'
