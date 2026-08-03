-- job_id: d41d3b0f-ec92-443e-aa5e-e52f54501ee1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:04:39.768000+00:00
-- started: 2026-07-29T17:04:39.863000+00:00
-- ended: 2026-07-29T17:04:40.012000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
