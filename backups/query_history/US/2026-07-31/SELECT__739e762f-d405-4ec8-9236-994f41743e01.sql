-- job_id: 739e762f-d405-4ec8-9236-994f41743e01
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:16:03.576000+00:00
-- started: 2026-07-31T16:16:03.672000+00:00
-- ended: 2026-07-31T16:16:03.795000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
