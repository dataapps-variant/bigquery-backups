-- job_id: 3bb26b39-2814-4c1d-9caf-27d847d50619
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T05:30:12.794000+00:00
-- started: 2026-07-30T05:30:12.895000+00:00
-- ended: 2026-07-30T05:30:13.392000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
