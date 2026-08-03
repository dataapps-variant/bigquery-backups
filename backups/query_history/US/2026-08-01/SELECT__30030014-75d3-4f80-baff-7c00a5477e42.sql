-- job_id: 30030014-75d3-4f80-baff-7c00a5477e42
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T11:01:27.562000+00:00
-- started: 2026-08-01T11:01:27.692000+00:00
-- ended: 2026-08-01T11:01:27.821000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
