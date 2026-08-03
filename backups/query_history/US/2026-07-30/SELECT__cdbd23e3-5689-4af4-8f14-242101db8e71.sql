-- job_id: cdbd23e3-5689-4af4-8f14-242101db8e71
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T01:01:30.243000+00:00
-- started: 2026-07-30T01:01:30.356000+00:00
-- ended: 2026-07-30T01:01:30.471000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
