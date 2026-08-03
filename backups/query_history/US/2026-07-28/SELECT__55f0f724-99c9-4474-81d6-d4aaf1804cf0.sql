-- job_id: 55f0f724-99c9-4474-81d6-d4aaf1804cf0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:04.802000+00:00
-- started: 2026-07-28T13:41:04.884000+00:00
-- ended: 2026-07-28T13:41:05.129000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-43'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
