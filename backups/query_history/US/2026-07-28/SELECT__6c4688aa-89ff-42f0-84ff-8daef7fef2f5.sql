-- job_id: 6c4688aa-89ff-42f0-84ff-8daef7fef2f5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:14.200000+00:00
-- started: 2026-07-28T13:39:14.316000+00:00
-- ended: 2026-07-28T13:39:14.472000+00:00


                SELECT Day_Refunded, SUM(Refund_Amount) AS amt
                FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
                WHERE Input_ID = 'Input-25'
                  AND Day_Refunded BETWEEN DATE('2026-04-18') AND DATE('2026-07-27')
                GROUP BY Day_Refunded
