-- job_id: e8a0aa93-a263-43f0-8dcb-5bd806ddb1a0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T02:05:30.743000+00:00
-- started: 2026-08-02T02:05:30.871000+00:00
-- ended: 2026-08-02T02:05:31.053000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
