-- job_id: dd4c95f8-5d17-46ff-819f-e928aae07fb6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:01:17.029000+00:00
-- started: 2026-08-02T06:01:17.146000+00:00
-- ended: 2026-08-02T06:01:17.359000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
