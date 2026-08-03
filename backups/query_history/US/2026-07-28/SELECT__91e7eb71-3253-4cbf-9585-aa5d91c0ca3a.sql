-- job_id: 91e7eb71-3253-4cbf-9585-aa5d91c0ca3a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:22.675000+00:00
-- started: 2026-07-28T13:38:22.722000+00:00
-- ended: 2026-07-28T13:38:22.879000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-17'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
