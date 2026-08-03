-- job_id: 857238e1-bf8f-47a4-89e5-aa934d1c91b0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T02:01:52.433000+00:00
-- started: 2026-07-28T02:01:52.595000+00:00
-- ended: 2026-07-28T02:01:52.717000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
