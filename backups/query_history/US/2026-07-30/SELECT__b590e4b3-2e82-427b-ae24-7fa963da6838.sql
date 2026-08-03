-- job_id: b590e4b3-2e82-427b-ae24-7fa963da6838
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:04:35.533000+00:00
-- started: 2026-07-30T11:04:35.623000+00:00
-- ended: 2026-07-30T11:04:35.761000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
