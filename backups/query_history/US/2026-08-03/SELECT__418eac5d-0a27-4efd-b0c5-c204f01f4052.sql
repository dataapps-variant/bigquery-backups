-- job_id: 418eac5d-0a27-4efd-b0c5-c204f01f4052
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:05.698000+00:00
-- started: 2026-08-03T12:28:05.872000+00:00
-- ended: 2026-08-03T12:28:06.128000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 0, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 0, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-58' AND activity_date BETWEEN DATE('2026-04-24') AND DATE('2026-08-02')
            GROUP BY activity_date
