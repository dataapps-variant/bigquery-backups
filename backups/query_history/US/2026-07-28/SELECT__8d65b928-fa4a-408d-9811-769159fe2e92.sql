-- job_id: 8d65b928-fa4a-408d-9811-769159fe2e92
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:03:36.178000+00:00
-- started: 2026-07-28T12:03:36.378000+00:00
-- ended: 2026-07-28T12:03:36.508000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
