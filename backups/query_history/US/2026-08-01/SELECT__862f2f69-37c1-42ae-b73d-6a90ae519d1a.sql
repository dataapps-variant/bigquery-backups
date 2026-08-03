-- job_id: 862f2f69-37c1-42ae-b73d-6a90ae519d1a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T15:04:53.535000+00:00
-- started: 2026-08-01T15:04:53.642000+00:00
-- ended: 2026-08-01T15:04:53.738000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
