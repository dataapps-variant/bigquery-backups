-- job_id: 3d69e654-0ff2-45fc-a5bc-63d023887c83
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:10:22.938000+00:00
-- started: 2026-07-30T13:10:23.048000+00:00
-- ended: 2026-07-30T13:10:23.144000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
