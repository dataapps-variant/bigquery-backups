-- job_id: 4afd4f2b-de0f-496d-8024-3e6dbe521552
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T02:05:19.171000+00:00
-- started: 2026-07-31T02:05:19.304000+00:00
-- ended: 2026-07-31T02:05:19.425000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
