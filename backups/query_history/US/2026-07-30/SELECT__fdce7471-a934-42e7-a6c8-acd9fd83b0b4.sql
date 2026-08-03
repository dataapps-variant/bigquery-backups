-- job_id: fdce7471-a934-42e7-a6c8-acd9fd83b0b4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:27.278000+00:00
-- started: 2026-07-30T16:11:27.394000+00:00
-- ended: 2026-07-30T16:11:27.587000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
    ORDER BY day_order
