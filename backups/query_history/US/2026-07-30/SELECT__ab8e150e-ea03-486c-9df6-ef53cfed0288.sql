-- job_id: ab8e150e-ea03-486c-9df6-ef53cfed0288
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T08:01:46.287000+00:00
-- started: 2026-07-30T08:01:46.371000+00:00
-- ended: 2026-07-30T08:01:46.503000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
