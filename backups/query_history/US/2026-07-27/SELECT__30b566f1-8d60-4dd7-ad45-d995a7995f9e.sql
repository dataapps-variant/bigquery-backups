-- job_id: 30b566f1-8d60-4dd7-ad45-d995a7995f9e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T15:02:45.517000+00:00
-- started: 2026-07-27T15:02:45.643000+00:00
-- ended: 2026-07-27T15:02:45.771000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
