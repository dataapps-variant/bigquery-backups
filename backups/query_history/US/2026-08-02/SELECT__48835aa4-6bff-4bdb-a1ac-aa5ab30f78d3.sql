-- job_id: 48835aa4-6bff-4bdb-a1ac-aa5ab30f78d3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T01:01:20.353000+00:00
-- started: 2026-08-02T01:01:20.501000+00:00
-- ended: 2026-08-02T01:01:20.726000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
