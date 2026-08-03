-- job_id: e61ce389-e869-45c9-95fa-d1e2ddd2f627
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:01.111000+00:00
-- started: 2026-07-28T10:05:01.165000+00:00
-- ended: 2026-07-28T10:05:01.267000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
