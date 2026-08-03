-- job_id: 935e5dd1-0fd2-48af-a69a-b27a9f461b24
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:37.353000+00:00
-- started: 2026-07-28T13:41:37.435000+00:00
-- ended: 2026-07-28T13:41:37.619000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-48'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
