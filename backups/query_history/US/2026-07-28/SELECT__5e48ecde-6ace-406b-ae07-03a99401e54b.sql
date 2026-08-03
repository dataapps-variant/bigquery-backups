-- job_id: 5e48ecde-6ace-406b-ae07-03a99401e54b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:00.690000+00:00
-- started: 2026-07-28T10:04:00.737000+00:00
-- ended: 2026-07-28T10:04:00.878000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL8970ST' ORDER BY bc_level
