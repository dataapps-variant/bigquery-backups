-- job_id: 37800747-0abd-4d1a-a736-f518325f158c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:03.878000+00:00
-- started: 2026-07-28T10:02:04.029000+00:00
-- ended: 2026-07-28T10:02:04.455000+00:00


            SELECT activity_date,
              SUM(IF(bc_number = 1, user_count, 0)) AS bc0,
              SUM(IF(bc_number > 1, user_count, 0)) AS other,
              SUM(gross_revenue_usd) AS rev
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-21' AND activity_date BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
            GROUP BY activity_date
