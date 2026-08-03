-- job_id: 8a220e74-fa82-48aa-a4e9-adda47f5aec2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T04:01:02.699000+00:00
-- started: 2026-08-03T04:01:02.839000+00:00
-- ended: 2026-08-03T04:01:02.978000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
