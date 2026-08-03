-- job_id: 675070ab-d353-4aad-a455-201769d49969
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T21:08:09.634000+00:00
-- started: 2026-07-28T21:08:09.792000+00:00
-- ended: 2026-07-28T21:08:09.896000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
