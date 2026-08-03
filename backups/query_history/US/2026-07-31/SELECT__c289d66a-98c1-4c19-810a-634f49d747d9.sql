-- job_id: c289d66a-98c1-4c19-810a-634f49d747d9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T02:02:31.824000+00:00
-- started: 2026-07-31T02:02:32.028000+00:00
-- ended: 2026-07-31T02:02:32.143000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
