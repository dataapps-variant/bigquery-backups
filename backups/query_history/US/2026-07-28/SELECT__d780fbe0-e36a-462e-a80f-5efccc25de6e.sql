-- job_id: d780fbe0-e36a-462e-a80f-5efccc25de6e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:41.841000+00:00
-- started: 2026-07-28T13:10:41.894000+00:00
-- ended: 2026-07-28T13:10:42.063000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
    ORDER BY day_order
