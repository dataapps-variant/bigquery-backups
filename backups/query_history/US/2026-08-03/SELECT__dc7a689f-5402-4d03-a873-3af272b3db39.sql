-- job_id: dc7a689f-5402-4d03-a873-3af272b3db39
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:03.838000+00:00
-- started: 2026-08-03T12:24:03.967000+00:00
-- ended: 2026-08-03T12:24:04.148000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL5985ST' ORDER BY bc_level
