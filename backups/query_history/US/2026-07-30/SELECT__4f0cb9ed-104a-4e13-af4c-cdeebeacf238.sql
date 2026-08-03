-- job_id: 4f0cb9ed-104a-4e13-af4c-cdeebeacf238
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T02:02:02.680000+00:00
-- started: 2026-07-30T02:02:02.841000+00:00
-- ended: 2026-07-30T02:02:02.959000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
