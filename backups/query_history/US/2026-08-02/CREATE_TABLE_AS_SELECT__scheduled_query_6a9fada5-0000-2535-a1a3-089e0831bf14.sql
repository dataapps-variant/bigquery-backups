-- job_id: scheduled_query_6a9fada5-0000-2535-a1a3-089e0831bf14
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T10:30:09.641000+00:00
-- started: 2026-08-02T10:30:09.911000+00:00
-- ended: 2026-08-02T10:30:12.304000+00:00

Create or replace table `variant-finance-data-project.Shared_PD_Data.Sticky_PD` as
SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
Where Entity_Name='PD'
