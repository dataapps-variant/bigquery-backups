-- job_id: scheduled_query_6a7ebf17-0000-2191-a113-fc4116926309
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T10:30:02.932000+00:00
-- started: 2026-07-31T10:30:03.262000+00:00
-- ended: 2026-07-31T10:30:05.852000+00:00

Create or replace table `variant-finance-data-project.Shared_PD_Data.Sticky_PD` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='PD'
