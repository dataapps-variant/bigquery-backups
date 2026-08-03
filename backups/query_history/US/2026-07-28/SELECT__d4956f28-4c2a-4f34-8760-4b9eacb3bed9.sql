-- job_id: d4956f28-4c2a-4f34-8760-4b9eacb3bed9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:27.531000+00:00
-- started: 2026-07-28T13:42:27.620000+00:00
-- ended: 2026-07-28T13:42:27.812000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-56'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
