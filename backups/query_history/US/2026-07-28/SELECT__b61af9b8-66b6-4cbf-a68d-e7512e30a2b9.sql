-- job_id: b61af9b8-66b6-4cbf-a68d-e7512e30a2b9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:37.864000+00:00
-- started: 2026-07-28T13:39:37.946000+00:00
-- ended: 2026-07-28T13:39:38.126000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-29'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
