-- job_id: 030b6920-193d-4229-89db-ae2ffb5bcc1b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:34.232000+00:00
-- started: 2026-07-28T10:02:34.327000+00:00
-- ended: 2026-07-28T10:02:34.510000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
