-- job_id: 16dacfed-21af-4c4d-b26f-34c8f8c21f9e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:01:38.071000+00:00
-- started: 2026-07-29T09:01:38.528000+00:00
-- ended: 2026-07-29T09:01:38.655000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
