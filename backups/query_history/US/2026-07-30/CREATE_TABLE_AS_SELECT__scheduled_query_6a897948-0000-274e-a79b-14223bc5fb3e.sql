-- job_id: scheduled_query_6a897948-0000-274e-a79b-14223bc5fb3e
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T11:00:02.354000+00:00
-- started: 2026-07-30T11:00:02.744000+00:00
-- ended: 2026-07-30T11:00:05.805000+00:00

Create or replace table `variant-finance-data-project.Shared_JF_Data.Sticky_JF` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='JF'
