-- job_id: scheduled_query_6ab16e4b-0000-2fd9-ad59-30fd3813e120
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T11:00:05.985000+00:00
-- started: 2026-08-03T11:00:06.292000+00:00
-- ended: 2026-08-03T11:00:09.117000+00:00

Create or replace table `variant-finance-data-project.Shared_JF_Data.Sticky_JF` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='JF'
