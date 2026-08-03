-- job_id: a5f29881-e175-42c1-a5a6-8215d79f3631
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:30:20.722000+00:00
-- started: 2026-07-28T05:30:21.098000+00:00
-- ended: 2026-07-28T05:30:22.051000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
