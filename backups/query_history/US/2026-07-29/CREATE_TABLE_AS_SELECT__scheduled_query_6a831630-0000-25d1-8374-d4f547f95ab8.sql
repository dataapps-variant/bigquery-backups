-- job_id: scheduled_query_6a831630-0000-25d1-8374-d4f547f95ab8
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T11:00:04.157000+00:00
-- started: 2026-07-29T11:00:04.448000+00:00
-- ended: 2026-07-29T11:00:07.373000+00:00

Create or replace table `variant-finance-data-project.Shared_JF_Data.Sticky_JF` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='JF'
