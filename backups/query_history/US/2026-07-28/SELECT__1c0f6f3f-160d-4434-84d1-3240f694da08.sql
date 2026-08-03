-- job_id: 1c0f6f3f-160d-4434-84d1-3240f694da08
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T01:03:31.375000+00:00
-- started: 2026-07-28T01:03:31.509000+00:00
-- ended: 2026-07-28T01:03:31.638000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
