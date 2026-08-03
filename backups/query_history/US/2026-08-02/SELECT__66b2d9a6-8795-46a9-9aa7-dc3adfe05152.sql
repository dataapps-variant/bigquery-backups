-- job_id: 66b2d9a6-8795-46a9-9aa7-dc3adfe05152
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T20:01:26.790000+00:00
-- started: 2026-08-02T20:01:26.904000+00:00
-- ended: 2026-08-02T20:01:27.032000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
