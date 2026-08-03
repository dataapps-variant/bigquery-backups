-- job_id: 92fba3cf-c4d7-46a4-8dc5-7f92e82a2e32
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:42.196000+00:00
-- started: 2026-07-28T13:38:42.239000+00:00
-- ended: 2026-07-28T13:38:42.453000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-20'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
