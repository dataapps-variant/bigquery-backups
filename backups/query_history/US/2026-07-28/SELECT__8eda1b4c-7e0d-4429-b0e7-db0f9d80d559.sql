-- job_id: 8eda1b4c-7e0d-4429-b0e7-db0f9d80d559
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:50.435000+00:00
-- started: 2026-07-28T13:39:50.539000+00:00
-- ended: 2026-07-28T13:39:50.754000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-31'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
