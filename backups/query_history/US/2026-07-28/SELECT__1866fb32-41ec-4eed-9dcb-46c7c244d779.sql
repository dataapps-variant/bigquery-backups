-- job_id: 1866fb32-41ec-4eed-9dcb-46c7c244d779
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:45.204000+00:00
-- started: 2026-07-28T10:02:45.340000+00:00
-- ended: 2026-07-28T10:02:45.535000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2688ST' ORDER BY bc_level
