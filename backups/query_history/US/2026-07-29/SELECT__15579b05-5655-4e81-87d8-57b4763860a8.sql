-- job_id: 15579b05-5655-4e81-87d8-57b4763860a8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:30:24.361000+00:00
-- started: 2026-07-29T05:30:24.467000+00:00
-- ended: 2026-07-29T05:30:24.667000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
