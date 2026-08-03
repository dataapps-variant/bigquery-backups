-- job_id: c4692c82-c509-450a-92a8-c757ce84bb9b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:01:56.454000+00:00
-- started: 2026-07-27T14:01:56.544000+00:00
-- ended: 2026-07-27T14:01:56.700000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
