-- job_id: 8eb1c5c0-ea7f-430a-83c9-975d964cdb9b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:52.091000+00:00
-- started: 2026-07-28T13:36:52.197000+00:00
-- ended: 2026-07-28T13:36:52.452000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-3'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
