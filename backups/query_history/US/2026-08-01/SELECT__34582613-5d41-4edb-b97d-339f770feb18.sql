-- job_id: 34582613-5d41-4edb-b97d-339f770feb18
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:03:38.719000+00:00
-- started: 2026-08-01T13:03:38.807000+00:00
-- ended: 2026-08-01T13:03:38.942000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
