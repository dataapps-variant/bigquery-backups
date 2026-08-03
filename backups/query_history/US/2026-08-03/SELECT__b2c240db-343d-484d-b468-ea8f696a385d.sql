-- job_id: b2c240db-343d-484d-b468-ea8f696a385d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:20:49.030000+00:00
-- started: 2026-08-03T06:20:49.137000+00:00
-- ended: 2026-08-03T06:20:49.327000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
