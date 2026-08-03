-- job_id: 556dc853-fcfe-4d02-900b-5816088ccc06
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T21:02:40.352000+00:00
-- started: 2026-08-01T21:02:40.462000+00:00
-- ended: 2026-08-01T21:02:40.590000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
