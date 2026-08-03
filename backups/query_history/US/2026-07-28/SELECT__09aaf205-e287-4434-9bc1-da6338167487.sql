-- job_id: 09aaf205-e287-4434-9bc1-da6338167487
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T01:03:43.811000+00:00
-- started: 2026-07-28T01:03:43.904000+00:00
-- ended: 2026-07-28T01:03:44.022000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
