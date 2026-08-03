-- job_id: 637c8721-dbac-46a4-a408-a93374d5ea63
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T20:07:35.482000+00:00
-- started: 2026-07-28T20:07:35.629000+00:00
-- ended: 2026-07-28T20:07:35.741000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
