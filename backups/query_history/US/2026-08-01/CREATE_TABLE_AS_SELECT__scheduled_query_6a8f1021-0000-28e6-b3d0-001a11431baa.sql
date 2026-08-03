-- job_id: scheduled_query_6a8f1021-0000-28e6-b3d0-001a11431baa
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T11:00:09.049000+00:00
-- started: 2026-08-01T11:00:09.403000+00:00
-- ended: 2026-08-01T11:00:12.157000+00:00

Create or replace table `variant-finance-data-project.Shared_JF_Data.Sticky_JF` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='JF'
