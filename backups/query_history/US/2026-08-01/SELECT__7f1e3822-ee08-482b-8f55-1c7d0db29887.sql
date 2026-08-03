-- job_id: 7f1e3822-ee08-482b-8f55-1c7d0db29887
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T18:06:31.239000+00:00
-- started: 2026-08-01T18:06:31.373000+00:00
-- ended: 2026-08-01T18:06:31.528000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
