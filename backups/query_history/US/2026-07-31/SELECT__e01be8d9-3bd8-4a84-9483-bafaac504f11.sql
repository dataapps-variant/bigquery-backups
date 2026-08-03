-- job_id: e01be8d9-3bd8-4a84-9483-bafaac504f11
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T21:02:44.464000+00:00
-- started: 2026-07-31T21:02:44.578000+00:00
-- ended: 2026-07-31T21:02:44.696000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
