-- job_id: 435c6750-a60d-45b3-9cbb-b2eacf24d3ed
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:30:19.378000+00:00
-- started: 2026-07-29T05:30:19.812000+00:00
-- ended: 2026-07-29T05:30:21.510000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
