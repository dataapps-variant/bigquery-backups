-- job_id: 8424e6ad-b669-4901-adf9-d05ffe36d531
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T05:07:13.383000+00:00
-- started: 2026-07-30T05:07:13.483000+00:00
-- ended: 2026-07-30T05:07:13.595000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
