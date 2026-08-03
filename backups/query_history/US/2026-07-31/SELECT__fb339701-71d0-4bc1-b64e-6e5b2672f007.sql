-- job_id: fb339701-71d0-4bc1-b64e-6e5b2672f007
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:07:44.724000+00:00
-- started: 2026-07-31T10:07:44.851000+00:00
-- ended: 2026-07-31T10:07:44.982000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
