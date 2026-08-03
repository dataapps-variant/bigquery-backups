-- job_id: 9739e851-a484-46dc-adcf-758c1f067ddf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:06:07.109000+00:00
-- started: 2026-08-03T09:06:07.208000+00:00
-- ended: 2026-08-03T09:06:07.310000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
