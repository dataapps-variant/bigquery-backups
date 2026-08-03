-- job_id: cd2cb40e-1566-4d54-9252-8d6b3cfb07f5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:52.648000+00:00
-- started: 2026-07-28T13:37:52.751000+00:00
-- ended: 2026-07-28T13:37:52.918000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-12'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
