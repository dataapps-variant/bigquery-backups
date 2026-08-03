-- job_id: scheduled_query_6a6c5b09-0000-2bae-a049-7474463f9b85
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T11:00:10.394000+00:00
-- started: 2026-07-28T11:00:10.851000+00:00
-- ended: 2026-07-28T11:00:13.842000+00:00

Create or replace table `variant-finance-data-project.Shared_JF_Data.Sticky_JF` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='JF'
