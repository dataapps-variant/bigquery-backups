-- job_id: 2ef332bb-6bc4-4a09-8894-5fec2af00f94
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:30:08.502000+00:00
-- started: 2026-07-30T05:30:08.909000+00:00
-- ended: 2026-07-30T05:30:09.908000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
