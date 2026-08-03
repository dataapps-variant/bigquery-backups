-- job_id: 87b53784-e0eb-45bf-ada9-3283a843d518
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:24:18.918000+00:00
-- started: 2026-08-01T06:24:19.015000+00:00
-- ended: 2026-08-01T06:24:19.217000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
