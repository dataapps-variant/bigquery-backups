-- job_id: f225aa30-9087-4cfc-a418-f40814de0293
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:08:51.008000+00:00
-- started: 2026-07-29T05:08:51.107000+00:00
-- ended: 2026-07-29T05:08:51.234000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
