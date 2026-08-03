-- job_id: eb8c7e09-3a88-4269-9626-e4f0ab819936
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T15:01:43.630000+00:00
-- started: 2026-08-02T15:01:43.760000+00:00
-- ended: 2026-08-02T15:01:43.903000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
