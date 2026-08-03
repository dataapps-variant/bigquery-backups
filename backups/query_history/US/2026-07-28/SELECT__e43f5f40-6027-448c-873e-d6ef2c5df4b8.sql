-- job_id: e43f5f40-6027-448c-873e-d6ef2c5df4b8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:46.485000+00:00
-- started: 2026-07-28T10:02:46.558000+00:00
-- ended: 2026-07-28T10:02:46.653000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
                ORDER BY day_order
