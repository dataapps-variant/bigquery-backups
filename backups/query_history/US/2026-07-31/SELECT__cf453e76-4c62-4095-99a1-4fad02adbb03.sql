-- job_id: cf453e76-4c62-4095-99a1-4fad02adbb03
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T18:04:14.694000+00:00
-- started: 2026-07-31T18:04:14.797000+00:00
-- ended: 2026-07-31T18:04:14.903000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
