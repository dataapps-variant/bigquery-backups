-- job_id: 83ddcde5-fa25-49b5-ae2b-112a5d6235e1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:06:14.436000+00:00
-- started: 2026-07-30T14:06:14.556000+00:00
-- ended: 2026-07-30T14:06:14.675000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
