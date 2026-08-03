-- job_id: e14c0281-a58d-4025-9f94-a13b88ed6c21
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:02:57.606000+00:00
-- started: 2026-08-03T06:02:57.734000+00:00
-- ended: 2026-08-03T06:02:57.868000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
