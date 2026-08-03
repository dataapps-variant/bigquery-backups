-- job_id: 43568d4c-1f3f-4112-913d-65e851cc6ab9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:08:18.054000+00:00
-- started: 2026-08-03T06:08:18.194000+00:00
-- ended: 2026-08-03T06:08:18.430000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
