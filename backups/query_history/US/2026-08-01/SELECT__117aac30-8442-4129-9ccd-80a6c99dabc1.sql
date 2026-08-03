-- job_id: 117aac30-8442-4129-9ccd-80a6c99dabc1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T01:04:09.501000+00:00
-- started: 2026-08-01T01:04:09.618000+00:00
-- ended: 2026-08-01T01:04:09.731000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
