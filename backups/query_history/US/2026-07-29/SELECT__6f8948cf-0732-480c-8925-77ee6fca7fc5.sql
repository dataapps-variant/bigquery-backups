-- job_id: 6f8948cf-0732-480c-8925-77ee6fca7fc5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T03:03:39.024000+00:00
-- started: 2026-07-29T03:03:39.128000+00:00
-- ended: 2026-07-29T03:03:39.228000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
