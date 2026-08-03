-- job_id: b8a0ed41-c4d1-420d-829f-faebd9a187bf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T17:04:23.584000+00:00
-- started: 2026-07-27T17:04:23.717000+00:00
-- ended: 2026-07-27T17:04:23.851000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
