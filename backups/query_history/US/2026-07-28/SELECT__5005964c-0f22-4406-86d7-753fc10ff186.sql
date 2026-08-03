-- job_id: 5005964c-0f22-4406-86d7-753fc10ff186
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T21:07:19.475000+00:00
-- started: 2026-07-28T21:07:19.692000+00:00
-- ended: 2026-07-28T21:07:19.781000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
