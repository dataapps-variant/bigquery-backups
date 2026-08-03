-- job_id: 62c46eba-0f60-4a6a-b011-8f2927dfe37e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:40.994000+00:00
-- started: 2026-07-28T13:40:41.066000+00:00
-- ended: 2026-07-28T13:40:41.252000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-39'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
