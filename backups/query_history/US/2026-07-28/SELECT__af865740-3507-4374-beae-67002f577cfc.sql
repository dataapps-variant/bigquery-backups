-- job_id: af865740-3507-4374-beae-67002f577cfc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:30:22.563000+00:00
-- started: 2026-07-28T05:30:22.664000+00:00
-- ended: 2026-07-28T05:30:22.912000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
