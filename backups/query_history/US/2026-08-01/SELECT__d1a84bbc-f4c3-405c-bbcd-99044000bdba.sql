-- job_id: d1a84bbc-f4c3-405c-bbcd-99044000bdba
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T08:05:05.598000+00:00
-- started: 2026-08-01T08:05:05.755000+00:00
-- ended: 2026-08-01T08:05:06.180000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
