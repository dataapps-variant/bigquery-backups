-- job_id: e85b3130-305a-49d3-a342-7ed3cdbd01ff
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:58.766000+00:00
-- started: 2026-07-28T10:04:58.816000+00:00
-- ended: 2026-07-28T10:04:58.903000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2688ST' ORDER BY bc_level
