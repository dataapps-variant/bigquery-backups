-- job_id: 5bfb2fb5-0600-4edf-9969-81a5e5637210
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:30:13.063000+00:00
-- started: 2026-08-03T05:30:13.496000+00:00
-- ended: 2026-08-03T05:30:14.636000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
