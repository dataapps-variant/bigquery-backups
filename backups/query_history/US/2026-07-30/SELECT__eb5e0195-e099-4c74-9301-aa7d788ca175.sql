-- job_id: eb5e0195-e099-4c74-9301-aa7d788ca175
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:26.037000+00:00
-- started: 2026-07-30T16:11:26.121000+00:00
-- ended: 2026-07-30T16:11:26.432000+00:00


    SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
    FROM `variant-finance-data-project.R100.R100_Historical_Spend`
    WHERE spend_date BETWEEN DATE('2026-04-20') AND DATE('2026-07-29')
    GROUP BY 1, 2, 3
