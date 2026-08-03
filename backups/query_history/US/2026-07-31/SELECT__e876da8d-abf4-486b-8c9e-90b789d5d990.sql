-- job_id: e876da8d-abf4-486b-8c9e-90b789d5d990
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T09:03:51.818000+00:00
-- started: 2026-07-31T09:03:51.922000+00:00
-- ended: 2026-07-31T09:03:52.336000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
