-- job_id: a7850853-9018-4939-9a17-8727e558d885
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:11.685000+00:00
-- started: 2026-08-03T12:22:11.772000+00:00
-- ended: 2026-08-03T12:22:12.105000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 0, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 0, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-1' AND activity_date BETWEEN DATE('2026-04-24') AND DATE('2026-08-02')
            GROUP BY activity_date
