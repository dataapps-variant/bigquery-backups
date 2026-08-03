-- job_id: b59137f7-5b24-41c1-8023-a306e8e02e02
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T02:05:03.256000+00:00
-- started: 2026-08-03T02:05:03.458000+00:00
-- ended: 2026-08-03T02:05:03.565000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
