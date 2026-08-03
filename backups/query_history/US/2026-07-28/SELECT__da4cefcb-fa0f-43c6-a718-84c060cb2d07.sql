-- job_id: da4cefcb-fa0f-43c6-a718-84c060cb2d07
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:20.289000+00:00
-- started: 2026-07-28T13:42:20.431000+00:00
-- ended: 2026-07-28T13:42:20.609000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-55'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
