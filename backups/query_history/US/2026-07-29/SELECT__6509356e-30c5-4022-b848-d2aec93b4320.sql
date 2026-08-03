-- job_id: 6509356e-30c5-4022-b848-d2aec93b4320
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:10:26.879000+00:00
-- started: 2026-07-29T16:10:27.003000+00:00
-- ended: 2026-07-29T16:10:27.146000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
