-- job_id: 06452c94-2d8f-4500-8e2c-3ca4a06f8975
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:30:09.299000+00:00
-- started: 2026-07-31T05:30:09.732000+00:00
-- ended: 2026-07-31T05:30:10.686000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
