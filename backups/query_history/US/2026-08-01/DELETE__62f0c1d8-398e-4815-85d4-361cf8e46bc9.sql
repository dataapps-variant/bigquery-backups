-- job_id: 62f0c1d8-398e-4815-85d4-361cf8e46bc9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:30:20.763000+00:00
-- started: 2026-08-01T05:30:21.205000+00:00
-- ended: 2026-08-01T05:30:22.199000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
