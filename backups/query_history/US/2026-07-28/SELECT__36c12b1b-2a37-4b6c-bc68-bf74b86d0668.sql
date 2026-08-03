-- job_id: 36c12b1b-2a37-4b6c-bc68-bf74b86d0668
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:02.110000+00:00
-- started: 2026-07-28T13:39:02.197000+00:00
-- ended: 2026-07-28T13:39:02.362000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-23'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
