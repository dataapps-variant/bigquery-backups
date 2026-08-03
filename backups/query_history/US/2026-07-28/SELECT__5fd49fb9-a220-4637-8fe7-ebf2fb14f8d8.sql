-- job_id: 5fd49fb9-a220-4637-8fe7-ebf2fb14f8d8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:16.536000+00:00
-- started: 2026-07-28T13:38:16.601000+00:00
-- ended: 2026-07-28T13:38:16.793000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-16'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
