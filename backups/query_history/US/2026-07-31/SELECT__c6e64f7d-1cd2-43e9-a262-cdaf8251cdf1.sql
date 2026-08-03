-- job_id: c6e64f7d-1cd2-43e9-a262-cdaf8251cdf1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T23:05:12.958000+00:00
-- started: 2026-07-31T23:05:13.053000+00:00
-- ended: 2026-07-31T23:05:13.185000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
