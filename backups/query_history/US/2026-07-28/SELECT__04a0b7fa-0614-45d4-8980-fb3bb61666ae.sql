-- job_id: 04a0b7fa-0614-45d4-8980-fb3bb61666ae
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:12.718000+00:00
-- started: 2026-07-28T13:37:12.824000+00:00
-- ended: 2026-07-28T13:37:13.025000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-6'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
