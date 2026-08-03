-- job_id: 5135747b-f3b9-4e15-861e-4d9cf9870f74
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:37.120000+00:00
-- started: 2026-08-03T12:25:37.198000+00:00
-- ended: 2026-08-03T12:25:37.517000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 0, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 0, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-33' AND activity_date BETWEEN DATE('2026-04-24') AND DATE('2026-08-02')
            GROUP BY activity_date
