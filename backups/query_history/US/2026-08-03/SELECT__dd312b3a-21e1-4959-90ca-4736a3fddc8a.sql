-- job_id: dd312b3a-21e1-4959-90ca-4736a3fddc8a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:01:22.651000+00:00
-- started: 2026-08-03T11:01:22.753000+00:00
-- ended: 2026-08-03T11:01:22.866000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
