-- job_id: 761226fe-180b-4992-8acf-a8b038f12f12
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:01:16.632000+00:00
-- started: 2026-08-01T05:01:16.734000+00:00
-- ended: 2026-08-01T05:01:16.857000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
