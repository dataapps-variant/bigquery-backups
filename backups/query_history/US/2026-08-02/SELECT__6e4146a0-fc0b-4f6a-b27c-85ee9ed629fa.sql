-- job_id: 6e4146a0-fc0b-4f6a-b27c-85ee9ed629fa
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T02:01:43+00:00
-- started: 2026-08-02T02:01:43.132000+00:00
-- ended: 2026-08-02T02:01:43.322000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
