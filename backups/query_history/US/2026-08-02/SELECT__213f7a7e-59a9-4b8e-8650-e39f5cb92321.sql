-- job_id: 213f7a7e-59a9-4b8e-8650-e39f5cb92321
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T21:02:21.184000+00:00
-- started: 2026-08-02T21:02:21.281000+00:00
-- ended: 2026-08-02T21:02:21.397000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
