-- job_id: 9df55bee-c75e-4554-bbab-23b8b160339d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:06:51.408000+00:00
-- started: 2026-07-31T10:06:51.544000+00:00
-- ended: 2026-07-31T10:06:51.662000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
