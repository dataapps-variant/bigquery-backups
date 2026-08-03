-- job_id: 04c5bd2f-5345-4246-a515-f93d30ff9285
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:30:10.567000+00:00
-- started: 2026-07-30T05:30:10.977000+00:00
-- ended: 2026-07-30T05:30:12.102000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
