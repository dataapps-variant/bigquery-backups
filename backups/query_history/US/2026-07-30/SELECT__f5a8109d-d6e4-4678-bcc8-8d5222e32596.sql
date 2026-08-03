-- job_id: f5a8109d-d6e4-4678-bcc8-8d5222e32596
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:08:42.378000+00:00
-- started: 2026-07-30T16:08:42.493000+00:00
-- ended: 2026-07-30T16:08:42.686000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
