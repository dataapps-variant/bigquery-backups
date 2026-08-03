-- job_id: b3424710-63a6-4cfa-b4b4-bfac87f80842
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:07:47.121000+00:00
-- started: 2026-07-30T15:07:47.252000+00:00
-- ended: 2026-07-30T15:07:47.453000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
