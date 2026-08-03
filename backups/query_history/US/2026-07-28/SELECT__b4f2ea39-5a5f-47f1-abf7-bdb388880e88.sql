-- job_id: b4f2ea39-5a5f-47f1-abf7-bdb388880e88
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:19.106000+00:00
-- started: 2026-07-28T13:41:19.181000+00:00
-- ended: 2026-07-28T13:41:19.362000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-45'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
