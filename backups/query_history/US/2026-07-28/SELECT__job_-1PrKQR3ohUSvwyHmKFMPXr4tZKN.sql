-- job_id: job_-1PrKQR3ohUSvwyHmKFMPXr4tZKN
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:09:54.610000+00:00
-- started: 2026-07-28T15:09:54.710000+00:00
-- ended: 2026-07-28T15:09:54.753000+00:00

SELECT MAX(DATE(Date_Purchased)) AS max_purchased FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
