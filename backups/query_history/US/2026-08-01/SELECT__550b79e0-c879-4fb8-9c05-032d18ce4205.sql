-- job_id: 550b79e0-c879-4fb8-9c05-032d18ce4205
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T03:03:48.437000+00:00
-- started: 2026-08-01T03:03:48.589000+00:00
-- ended: 2026-08-01T03:03:48.717000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
