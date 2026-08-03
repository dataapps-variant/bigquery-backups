-- job_id: 7196d428-5dd4-442c-85b2-429e6b2c323d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:03.453000+00:00
-- started: 2026-08-03T12:23:03.706000+00:00
-- ended: 2026-08-03T12:23:04.095000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 0, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 0, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-8' AND activity_date BETWEEN DATE('2026-04-24') AND DATE('2026-08-02')
            GROUP BY activity_date
