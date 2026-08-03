-- job_id: 39e78eae-92ab-4ff8-ac95-ec7beea63054
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:30:11.317000+00:00
-- started: 2026-07-31T05:30:11.742000+00:00
-- ended: 2026-07-31T05:30:12.694000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
