-- job_id: 59b34353-1780-4f13-b1fe-fdfbad8a671d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:04:15.203000+00:00
-- started: 2026-07-28T09:04:15.296000+00:00
-- ended: 2026-07-28T09:04:15.394000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
