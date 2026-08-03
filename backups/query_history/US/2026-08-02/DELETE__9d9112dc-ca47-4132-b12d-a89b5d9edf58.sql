-- job_id: 9d9112dc-ca47-4132-b12d-a89b5d9edf58
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:30:08.766000+00:00
-- started: 2026-08-02T05:30:09.184000+00:00
-- ended: 2026-08-02T05:30:10.208000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
