-- job_id: f5f496ca-d020-493e-b0f1-368c7075f6a1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T19:02:51.088000+00:00
-- started: 2026-07-27T19:02:51.239000+00:00
-- ended: 2026-07-27T19:02:51.363000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
