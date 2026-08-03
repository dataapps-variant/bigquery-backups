-- job_id: 86a05ff5-e2d3-4bfa-8ab3-27fe5fc3cf8e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:29.398000+00:00
-- started: 2026-07-28T13:40:29.460000+00:00
-- ended: 2026-07-28T13:40:29.622000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-37'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
