-- job_id: 00120352-3547-4ab1-810c-119264a06f7a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T04:07:05.687000+00:00
-- started: 2026-07-30T04:07:05.784000+00:00
-- ended: 2026-07-30T04:07:05.914000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
