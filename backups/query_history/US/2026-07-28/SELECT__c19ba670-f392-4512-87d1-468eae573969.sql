-- job_id: c19ba670-f392-4512-87d1-468eae573969
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:51.767000+00:00
-- started: 2026-07-28T10:06:51.822000+00:00
-- ended: 2026-07-28T10:06:51.907000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2788ST' ORDER BY bc_level
