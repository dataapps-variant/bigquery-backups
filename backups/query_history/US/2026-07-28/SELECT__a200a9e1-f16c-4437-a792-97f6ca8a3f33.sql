-- job_id: a200a9e1-f16c-4437-a792-97f6ca8a3f33
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:45.356000+00:00
-- started: 2026-07-28T10:02:45.409000+00:00
-- ended: 2026-07-28T10:02:45.592000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1440AD' ORDER BY bc_level
