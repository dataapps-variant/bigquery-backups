-- job_id: 3c85c057-008c-4dc5-936b-ac13e9cb58a1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T03:02:42.532000+00:00
-- started: 2026-07-28T03:02:42.705000+00:00
-- ended: 2026-07-28T03:02:42.811000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
