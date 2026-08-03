-- job_id: 659a9a98-c2be-49f7-978e-f54651f511b7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:29.049000+00:00
-- started: 2026-07-28T10:02:29.114000+00:00
-- ended: 2026-07-28T10:02:29.454000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 1, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 1, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-26' AND activity_date BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
            GROUP BY activity_date
