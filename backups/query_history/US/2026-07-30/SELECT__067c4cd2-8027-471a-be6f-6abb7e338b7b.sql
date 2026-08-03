-- job_id: 067c4cd2-8027-471a-be6f-6abb7e338b7b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:30.485000+00:00
-- started: 2026-07-30T16:11:30.574000+00:00
-- ended: 2026-07-30T16:11:30.771000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
    ORDER BY day_order
