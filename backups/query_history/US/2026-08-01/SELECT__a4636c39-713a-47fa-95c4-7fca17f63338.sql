-- job_id: a4636c39-713a-47fa-95c4-7fca17f63338
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T20:01:09.089000+00:00
-- started: 2026-08-01T20:01:09.198000+00:00
-- ended: 2026-08-01T20:01:09.319000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
