-- job_id: aa37b850-2c73-48c6-981e-a6a1fde65979
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T18:04:14.244000+00:00
-- started: 2026-07-28T18:04:14.384000+00:00
-- ended: 2026-07-28T18:04:14.524000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
