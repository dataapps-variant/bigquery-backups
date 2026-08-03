-- job_id: 0d7a10d6-54f0-4784-a4dd-8159f99ec387
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:20.083000+00:00
-- started: 2026-07-28T13:39:20.140000+00:00
-- ended: 2026-07-28T13:39:20.312000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-26'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
