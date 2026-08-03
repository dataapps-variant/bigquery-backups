-- job_id: e764c4dc-baf4-4c69-af5e-a0ca308356b7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:53.029000+00:00
-- started: 2026-07-28T10:04:53.074000+00:00
-- ended: 2026-07-28T10:04:53.158000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
