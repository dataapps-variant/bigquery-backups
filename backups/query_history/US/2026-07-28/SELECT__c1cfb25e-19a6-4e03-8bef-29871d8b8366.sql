-- job_id: c1cfb25e-19a6-4e03-8bef-29871d8b8366
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T01:01:41.196000+00:00
-- started: 2026-07-28T01:01:41.356000+00:00
-- ended: 2026-07-28T01:01:41.499000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
