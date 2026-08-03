-- job_id: 15084b7e-a2a2-4e5b-89e0-8be248624230
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T04:04:26.244000+00:00
-- started: 2026-07-28T04:04:26.378000+00:00
-- ended: 2026-07-28T04:04:26.524000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
