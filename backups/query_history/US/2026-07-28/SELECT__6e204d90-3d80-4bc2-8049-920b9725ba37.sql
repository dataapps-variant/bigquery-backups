-- job_id: 6e204d90-3d80-4bc2-8049-920b9725ba37
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:02:22.788000+00:00
-- started: 2026-07-28T05:02:22.884000+00:00
-- ended: 2026-07-28T05:02:23.037000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
