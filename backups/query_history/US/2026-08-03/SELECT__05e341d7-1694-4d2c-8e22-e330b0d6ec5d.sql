-- job_id: 05e341d7-1694-4d2c-8e22-e330b0d6ec5d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:30:15.323000+00:00
-- started: 2026-08-03T05:30:15.414000+00:00
-- ended: 2026-08-03T05:30:15.778000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
