-- job_id: 1ad10715-7063-4d80-a20a-54c5b5739490
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:09:37.348000+00:00
-- started: 2026-08-01T13:09:37.464000+00:00
-- ended: 2026-08-01T13:09:37.581000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
