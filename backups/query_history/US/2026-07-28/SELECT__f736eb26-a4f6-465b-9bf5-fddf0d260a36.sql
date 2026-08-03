-- job_id: f736eb26-a4f6-465b-9bf5-fddf0d260a36
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:39.710000+00:00
-- started: 2026-07-28T13:37:39.783000+00:00
-- ended: 2026-07-28T13:37:39.964000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-10'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
