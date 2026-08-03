-- job_id: 282f244d-bf7e-4bed-8b02-b428a8d7ade3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:58.371000+00:00
-- started: 2026-07-28T13:40:58.458000+00:00
-- ended: 2026-07-28T13:40:58.635000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-42'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
