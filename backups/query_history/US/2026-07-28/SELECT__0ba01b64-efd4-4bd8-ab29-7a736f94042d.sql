-- job_id: 0ba01b64-efd4-4bd8-ab29-7a736f94042d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T22:03:50.899000+00:00
-- started: 2026-07-28T22:03:51.100000+00:00
-- ended: 2026-07-28T22:03:51.215000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
