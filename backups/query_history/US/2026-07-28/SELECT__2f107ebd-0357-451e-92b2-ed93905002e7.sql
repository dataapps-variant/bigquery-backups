-- job_id: 2f107ebd-0357-451e-92b2-ed93905002e7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:46.741000+00:00
-- started: 2026-07-28T10:04:46.809000+00:00
-- ended: 2026-07-28T10:04:46.890000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
