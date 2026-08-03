-- job_id: f42bc2fc-33c1-4b4a-ad15-2c3bd1c48d63
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:02.720000+00:00
-- started: 2026-08-03T12:25:02.788000+00:00
-- ended: 2026-08-03T12:25:03.080000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 1, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 1, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-26' AND activity_date BETWEEN DATE('2026-04-24') AND DATE('2026-08-02')
            GROUP BY activity_date
