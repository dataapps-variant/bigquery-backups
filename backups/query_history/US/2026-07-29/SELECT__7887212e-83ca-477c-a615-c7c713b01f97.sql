-- job_id: 7887212e-83ca-477c-a615-c7c713b01f97
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:03:13.745000+00:00
-- started: 2026-07-29T09:03:13.834000+00:00
-- ended: 2026-07-29T09:03:14.014000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
