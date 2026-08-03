-- job_id: e7aa1e23-5021-4d6b-9f2c-61ab65a06aef
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:03:13.353000+00:00
-- started: 2026-07-29T16:03:13.460000+00:00
-- ended: 2026-07-29T16:03:13.589000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
