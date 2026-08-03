-- job_id: 42f7fe29-8cbd-4c05-a99c-3dacba8af8af
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:43.467000+00:00
-- started: 2026-07-28T10:03:43.517000+00:00
-- ended: 2026-07-28T10:03:43.918000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 0, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 0, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-41' AND activity_date BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
            GROUP BY activity_date
