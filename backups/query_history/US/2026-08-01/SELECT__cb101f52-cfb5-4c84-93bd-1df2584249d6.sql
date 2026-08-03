-- job_id: cb101f52-cfb5-4c84-93bd-1df2584249d6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T15:01:57.342000+00:00
-- started: 2026-08-01T15:01:57.466000+00:00
-- ended: 2026-08-01T15:01:57.759000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
