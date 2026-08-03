-- job_id: f6e83b44-8145-401d-9a54-f83f03488d46
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T19:09:12.934000+00:00
-- started: 2026-07-30T19:09:13.102000+00:00
-- ended: 2026-07-30T19:09:13.241000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
