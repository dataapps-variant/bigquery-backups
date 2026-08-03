-- job_id: scheduled_query_6aa9aacc-0000-25d1-8374-d4f547f95ab8
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T11:00:05.599000+00:00
-- started: 2026-07-31T11:00:06.025000+00:00
-- ended: 2026-07-31T11:00:09.801000+00:00

Create or replace table `variant-finance-data-project.Shared_JF_Data.Sticky_JF` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='JF'
