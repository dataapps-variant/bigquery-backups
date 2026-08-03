-- job_id: 215ae5cb-f57b-4918-b1ba-9c070d6f6889
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:02:20.919000+00:00
-- started: 2026-07-31T12:02:21.021000+00:00
-- ended: 2026-07-31T12:02:21.118000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
