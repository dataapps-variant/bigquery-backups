-- job_id: 68cd6b43-6216-4c18-84e2-192d0c66e0c5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:02:32.062000+00:00
-- started: 2026-07-31T05:02:32.172000+00:00
-- ended: 2026-07-31T05:02:32.305000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
