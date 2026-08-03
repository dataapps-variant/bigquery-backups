-- job_id: 2d419011-72de-421e-b008-1e170e7f1855
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:03:51.063000+00:00
-- started: 2026-07-30T18:03:51.159000+00:00
-- ended: 2026-07-30T18:03:51.294000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
