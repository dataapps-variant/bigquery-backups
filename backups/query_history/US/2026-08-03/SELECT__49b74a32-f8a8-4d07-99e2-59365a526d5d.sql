-- job_id: 49b74a32-f8a8-4d07-99e2-59365a526d5d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:05:23.554000+00:00
-- started: 2026-08-03T11:05:23.653000+00:00
-- ended: 2026-08-03T11:05:23.783000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
