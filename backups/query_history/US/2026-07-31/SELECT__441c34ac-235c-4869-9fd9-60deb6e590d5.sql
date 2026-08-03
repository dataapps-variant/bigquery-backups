-- job_id: 441c34ac-235c-4869-9fd9-60deb6e590d5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:30:13.458000+00:00
-- started: 2026-07-31T05:30:13.566000+00:00
-- ended: 2026-07-31T05:30:13.784000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
