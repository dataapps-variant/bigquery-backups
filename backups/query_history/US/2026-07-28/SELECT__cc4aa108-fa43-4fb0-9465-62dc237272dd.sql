-- job_id: cc4aa108-fa43-4fb0-9465-62dc237272dd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:01:58.491000+00:00
-- started: 2026-07-28T16:01:58.598000+00:00
-- ended: 2026-07-28T16:01:58.714000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
