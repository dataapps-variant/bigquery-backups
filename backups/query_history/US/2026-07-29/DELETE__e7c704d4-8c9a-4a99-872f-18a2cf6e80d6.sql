-- job_id: e7c704d4-8c9a-4a99-872f-18a2cf6e80d6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:30:22.279000+00:00
-- started: 2026-07-29T05:30:22.746000+00:00
-- ended: 2026-07-29T05:30:23.694000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
