-- job_id: ad805852-408a-4d99-a5e1-a3d7c2d53502
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:08:53.724000+00:00
-- started: 2026-07-30T10:08:53.816000+00:00
-- ended: 2026-07-30T10:08:53.952000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
