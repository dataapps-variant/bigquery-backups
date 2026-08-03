-- job_id: 3c330c4f-1f14-4ead-861f-c4f2682ad897
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T00:06:24.335000+00:00
-- started: 2026-08-03T00:06:24.472000+00:00
-- ended: 2026-08-03T00:06:24.737000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
