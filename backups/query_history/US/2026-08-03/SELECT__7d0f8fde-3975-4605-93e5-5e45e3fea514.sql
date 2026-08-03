-- job_id: 7d0f8fde-3975-4605-93e5-5e45e3fea514
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:16.300000+00:00
-- started: 2026-08-03T12:23:16.389000+00:00
-- ended: 2026-08-03T12:23:16.640000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 1, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 1, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-10' AND activity_date BETWEEN DATE('2026-04-24') AND DATE('2026-08-02')
            GROUP BY activity_date
