-- job_id: 63d76cb0-217f-4bb8-8cfb-ae0ef7368b5d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:56.298000+00:00
-- started: 2026-07-28T13:39:56.417000+00:00
-- ended: 2026-07-28T13:39:56.569000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-32'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
