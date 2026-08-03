-- job_id: 97f1c0b7-3ebb-496a-b956-69177ab2aa1f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:06.073000+00:00
-- started: 2026-07-28T14:30:06.212000+00:00
-- ended: 2026-07-28T14:30:06.331000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2995MT' ORDER BY bc_level
