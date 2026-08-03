-- job_id: bc3daf4a-5990-4f0a-93de-b1157d45f5c3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:31.610000+00:00
-- started: 2026-07-28T14:32:31.666000+00:00
-- ended: 2026-07-28T14:32:31.767000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
