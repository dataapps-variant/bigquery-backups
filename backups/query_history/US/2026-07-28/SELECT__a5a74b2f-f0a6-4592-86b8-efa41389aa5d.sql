-- job_id: a5a74b2f-f0a6-4592-86b8-efa41389aa5d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:21.845000+00:00
-- started: 2026-07-28T14:32:21.921000+00:00
-- ended: 2026-07-28T14:32:22.012000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
