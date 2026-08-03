-- job_id: 5d4d9333-3042-4bc5-b9dd-943f0466afdf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:31.357000+00:00
-- started: 2026-07-28T13:41:31.462000+00:00
-- ended: 2026-07-28T13:41:31.647000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-47'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
