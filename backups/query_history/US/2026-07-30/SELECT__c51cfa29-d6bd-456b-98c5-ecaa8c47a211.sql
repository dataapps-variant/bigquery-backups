-- job_id: c51cfa29-d6bd-456b-98c5-ecaa8c47a211
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:28.139000+00:00
-- started: 2026-07-30T16:11:28.266000+00:00
-- ended: 2026-07-30T16:11:28.476000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
    ORDER BY day_order
