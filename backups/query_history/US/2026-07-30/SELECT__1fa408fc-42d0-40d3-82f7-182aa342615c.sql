-- job_id: 1fa408fc-42d0-40d3-82f7-182aa342615c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T22:03:26.632000+00:00
-- started: 2026-07-30T22:03:26.785000+00:00
-- ended: 2026-07-30T22:03:26.909000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
