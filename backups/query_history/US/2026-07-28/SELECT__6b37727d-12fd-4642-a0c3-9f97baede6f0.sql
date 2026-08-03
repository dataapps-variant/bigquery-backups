-- job_id: 6b37727d-12fd-4642-a0c3-9f97baede6f0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T18:07:15.556000+00:00
-- started: 2026-07-28T18:07:15.701000+00:00
-- ended: 2026-07-28T18:07:15.833000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
