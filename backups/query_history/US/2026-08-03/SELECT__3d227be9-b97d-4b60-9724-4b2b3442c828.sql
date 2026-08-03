-- job_id: 3d227be9-b97d-4b60-9724-4b2b3442c828
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:01:36.375000+00:00
-- started: 2026-08-03T12:01:36.466000+00:00
-- ended: 2026-08-03T12:01:36.566000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
