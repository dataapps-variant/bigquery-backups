-- job_id: 4c68b752-730f-4e2b-a1ac-1845859a2ed8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:33.636000+00:00
-- started: 2026-07-28T13:37:33.729000+00:00
-- ended: 2026-07-28T13:37:33.914000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-9'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
