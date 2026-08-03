-- job_id: aba12986-85a4-4d8e-910d-b9829ee05a52
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:02:58.485000+00:00
-- started: 2026-07-29T08:02:58.650000+00:00
-- ended: 2026-07-29T08:02:58.757000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
