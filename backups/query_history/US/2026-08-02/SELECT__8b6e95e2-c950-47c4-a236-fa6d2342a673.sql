-- job_id: 8b6e95e2-c950-47c4-a236-fa6d2342a673
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T05:30:13.026000+00:00
-- started: 2026-08-02T05:30:13.120000+00:00
-- ended: 2026-08-02T05:30:13.338000+00:00


        SELECT DISTINCT Date, Currency
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE CONCAT(CAST(Date AS STRING), '|', Currency) IN UNNEST(@combinations)
