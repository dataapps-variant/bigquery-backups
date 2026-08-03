-- job_id: 619eeed6-4c7a-40e9-8efc-5584fb2529c9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:02:15.570000+00:00
-- started: 2026-07-30T06:02:15.694000+00:00
-- ended: 2026-07-30T06:02:15.834000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
