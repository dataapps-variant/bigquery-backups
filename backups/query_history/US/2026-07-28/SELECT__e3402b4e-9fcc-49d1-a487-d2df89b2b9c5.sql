-- job_id: e3402b4e-9fcc-49d1-a487-d2df89b2b9c5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:01.261000+00:00
-- started: 2026-07-28T13:42:01.361000+00:00
-- ended: 2026-07-28T13:42:01.544000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-52'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
