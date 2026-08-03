-- job_id: 4ce1065d-e557-4658-8858-36938d108107
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:49.388000+00:00
-- started: 2026-07-29T15:11:49.490000+00:00
-- ended: 2026-07-29T15:11:49.603000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
