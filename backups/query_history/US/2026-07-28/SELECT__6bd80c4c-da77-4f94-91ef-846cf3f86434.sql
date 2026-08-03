-- job_id: 6bd80c4c-da77-4f94-91ef-846cf3f86434
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:20.136000+00:00
-- started: 2026-07-28T10:02:20.186000+00:00
-- ended: 2026-07-28T10:02:20.302000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
