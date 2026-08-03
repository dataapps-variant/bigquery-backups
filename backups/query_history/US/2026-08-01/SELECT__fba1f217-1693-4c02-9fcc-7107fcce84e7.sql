-- job_id: fba1f217-1693-4c02-9fcc-7107fcce84e7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T02:03:52.933000+00:00
-- started: 2026-08-01T02:03:53.046000+00:00
-- ended: 2026-08-01T02:03:53.187000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
