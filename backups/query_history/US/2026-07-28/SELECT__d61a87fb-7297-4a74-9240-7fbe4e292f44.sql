-- job_id: d61a87fb-7297-4a74-9240-7fbe4e292f44
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:54.934000+00:00
-- started: 2026-07-28T14:32:55.024000+00:00
-- ended: 2026-07-28T14:32:55.132000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'IQ2788YT' ORDER BY bc_level
