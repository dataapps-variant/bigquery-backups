-- job_id: a5654645-be62-4c35-9ac2-fddb7769ad3f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:12.328000+00:00
-- started: 2026-07-28T10:03:12.375000+00:00
-- ended: 2026-07-28T10:03:12.570000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
