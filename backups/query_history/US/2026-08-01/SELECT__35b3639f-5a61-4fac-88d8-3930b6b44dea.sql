-- job_id: 35b3639f-5a61-4fac-88d8-3930b6b44dea
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:30:25.421000+00:00
-- started: 2026-08-01T05:30:25.536000+00:00
-- ended: 2026-08-01T05:30:25.760000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
