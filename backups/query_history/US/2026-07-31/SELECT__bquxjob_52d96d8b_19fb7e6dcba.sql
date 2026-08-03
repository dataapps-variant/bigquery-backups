-- job_id: bquxjob_52d96d8b_19fb7e6dcba
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T11:19:48.813000+00:00
-- started: 2026-07-31T11:19:48.930000+00:00
-- ended: 2026-07-31T11:19:49.815000+00:00

SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where Date_of_Sale >= "2025-01-01"
and Date_of_Sale <= "2025-01-02"
