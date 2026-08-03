-- job_id: 7a7845c3-6925-4697-8ddb-c9d8f3becc13
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:48.327000+00:00
-- started: 2026-07-28T13:38:48.423000+00:00
-- ended: 2026-07-28T13:38:48.596000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-21'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
