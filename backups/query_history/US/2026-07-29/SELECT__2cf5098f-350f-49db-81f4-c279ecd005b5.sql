-- job_id: 2cf5098f-350f-49db-81f4-c279ecd005b5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:04:08.677000+00:00
-- started: 2026-07-29T18:04:08.822000+00:00
-- ended: 2026-07-29T18:04:08.951000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
