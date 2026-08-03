-- job_id: c13f2cb1-c9e6-407f-a50a-48a28183a669
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:32.268000+00:00
-- started: 2026-08-03T12:23:32.382000+00:00
-- ended: 2026-08-03T12:23:32.566000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3999ST' ORDER BY bc_level
