-- job_id: 8372ca16-58ca-4ae3-adad-58d365e2b83e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T00:09:02.401000+00:00
-- started: 2026-07-28T00:09:02.518000+00:00
-- ended: 2026-07-28T00:09:02.634000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
