-- job_id: a3f5dd53-30f0-42e3-b36e-fdb5e5574f6f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:19:06.658000+00:00
-- started: 2026-08-03T06:19:06.810000+00:00
-- ended: 2026-08-03T06:19:07.028000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
