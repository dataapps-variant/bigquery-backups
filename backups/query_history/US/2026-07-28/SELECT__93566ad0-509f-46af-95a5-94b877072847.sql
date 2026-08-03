-- job_id: 93566ad0-509f-46af-95a5-94b877072847
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:15.148000+00:00
-- started: 2026-07-28T10:02:15.245000+00:00
-- ended: 2026-07-28T10:02:15.327000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
