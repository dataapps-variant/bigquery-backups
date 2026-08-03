-- job_id: 64a3327d-6f19-417a-818c-7e02f1110124
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:30:10.755000+00:00
-- started: 2026-08-03T05:30:11.173000+00:00
-- ended: 2026-08-03T05:30:12.368000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
