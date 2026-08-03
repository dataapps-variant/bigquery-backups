-- job_id: 76792764-2f3e-4107-8cc2-c32a3d8e49f3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:49.096000+00:00
-- started: 2026-07-28T10:02:49.152000+00:00
-- ended: 2026-07-28T10:02:49.225000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
