-- job_id: b6af466a-5ebc-4217-89d3-f274ae96ecdb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:30:22.820000+00:00
-- started: 2026-08-01T05:30:23.333000+00:00
-- ended: 2026-08-01T05:30:24.755000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
