-- job_id: 1d9fd9dd-9d06-4f2e-b2d8-6b3b017b7fd7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:09.156000+00:00
-- started: 2026-08-03T09:05:09.280000+00:00
-- ended: 2026-08-03T09:05:09.438000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
