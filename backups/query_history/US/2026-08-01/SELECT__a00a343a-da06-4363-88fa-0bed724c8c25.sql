-- job_id: a00a343a-da06-4363-88fa-0bed724c8c25
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T15:04:06.551000+00:00
-- started: 2026-08-01T15:04:06.657000+00:00
-- ended: 2026-08-01T15:04:06.774000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
