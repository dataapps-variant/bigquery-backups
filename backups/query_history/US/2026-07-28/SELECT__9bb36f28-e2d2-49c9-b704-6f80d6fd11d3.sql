-- job_id: 9bb36f28-e2d2-49c9-b704-6f80d6fd11d3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:48.964000+00:00
-- started: 2026-07-28T10:00:49.068000+00:00
-- ended: 2026-07-28T10:00:49.384000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 1, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 1, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-10' AND activity_date BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
            GROUP BY activity_date
