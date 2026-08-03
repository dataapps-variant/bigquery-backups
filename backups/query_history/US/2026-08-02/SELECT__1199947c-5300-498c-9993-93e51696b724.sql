-- job_id: 1199947c-5300-498c-9993-93e51696b724
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T01:03:27.201000+00:00
-- started: 2026-08-02T01:03:27.641000+00:00
-- ended: 2026-08-02T01:03:27.872000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
