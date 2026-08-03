-- job_id: f5a141bc-9f81-403b-a370-3124a3b0eb2b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T16:03:03.870000+00:00
-- started: 2026-07-27T16:03:04.007000+00:00
-- ended: 2026-07-27T16:03:04.173000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
