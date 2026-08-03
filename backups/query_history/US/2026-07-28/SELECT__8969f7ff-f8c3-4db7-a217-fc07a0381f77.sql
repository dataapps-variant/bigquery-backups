-- job_id: 8969f7ff-f8c3-4db7-a217-fc07a0381f77
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:44.182000+00:00
-- started: 2026-07-28T13:10:44.264000+00:00
-- ended: 2026-07-28T13:10:44.440000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
    ORDER BY day_order
