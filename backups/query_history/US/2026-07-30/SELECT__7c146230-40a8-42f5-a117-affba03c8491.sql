-- job_id: 7c146230-40a8-42f5-a117-affba03c8491
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T20:02:12.978000+00:00
-- started: 2026-07-30T20:02:13.139000+00:00
-- ended: 2026-07-30T20:02:13.273000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
