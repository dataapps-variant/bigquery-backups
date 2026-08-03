-- job_id: f501d108-5fa7-44ed-a9a9-3fc3c27d565a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:41.869000+00:00
-- started: 2026-08-03T13:03:41.958000+00:00
-- ended: 2026-08-03T13:03:42.259000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
