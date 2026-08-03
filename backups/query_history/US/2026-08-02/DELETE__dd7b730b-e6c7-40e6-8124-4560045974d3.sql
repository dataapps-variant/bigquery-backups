-- job_id: dd7b730b-e6c7-40e6-8124-4560045974d3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:30:11.027000+00:00
-- started: 2026-08-02T05:30:11.432000+00:00
-- ended: 2026-08-02T05:30:12.319000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
