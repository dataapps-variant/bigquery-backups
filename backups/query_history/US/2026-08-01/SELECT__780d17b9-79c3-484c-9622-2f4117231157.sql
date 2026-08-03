-- job_id: 780d17b9-79c3-484c-9622-2f4117231157
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T15:02:58.622000+00:00
-- started: 2026-08-01T15:02:58.725000+00:00
-- ended: 2026-08-01T15:02:58.875000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
