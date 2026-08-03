-- job_id: 5caa9a53-1302-4d76-8752-2f5740170b9a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T03:04:06.439000+00:00
-- started: 2026-07-30T03:04:06.542000+00:00
-- ended: 2026-07-30T03:04:06.676000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
