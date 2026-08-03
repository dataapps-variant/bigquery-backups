-- job_id: d3ee9e94-9a8d-45a5-b0d9-956f841f24ad
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T17:04:00.975000+00:00
-- started: 2026-08-01T17:04:01.076000+00:00
-- ended: 2026-08-01T17:04:01.191000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
