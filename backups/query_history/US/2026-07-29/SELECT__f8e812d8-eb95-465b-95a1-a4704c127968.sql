-- job_id: f8e812d8-eb95-465b-95a1-a4704c127968
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:06:39.143000+00:00
-- started: 2026-07-29T12:06:39.249000+00:00
-- ended: 2026-07-29T12:06:39.387000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
