-- job_id: 2375b764-df7a-412e-9b43-16e45118d554
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:25.044000+00:00
-- started: 2026-07-28T10:02:25.097000+00:00
-- ended: 2026-07-28T10:02:25.254000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
