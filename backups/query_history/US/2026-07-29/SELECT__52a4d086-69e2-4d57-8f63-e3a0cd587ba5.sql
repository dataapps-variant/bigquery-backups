-- job_id: 52a4d086-69e2-4d57-8f63-e3a0cd587ba5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T00:03:55.027000+00:00
-- started: 2026-07-29T00:03:55.148000+00:00
-- ended: 2026-07-29T00:03:55.279000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
