-- job_id: 7a9f460a-b266-4f59-9d86-d8dcab4591a9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:13.704000+00:00
-- started: 2026-07-28T10:05:13.778000+00:00
-- ended: 2026-07-28T10:05:13.869000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RL2788ST' ORDER BY bc_level
