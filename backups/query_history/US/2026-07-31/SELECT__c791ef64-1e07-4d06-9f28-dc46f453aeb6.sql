-- job_id: c791ef64-1e07-4d06-9f28-dc46f453aeb6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T03:02:52.698000+00:00
-- started: 2026-07-31T03:02:52.813000+00:00
-- ended: 2026-07-31T03:02:52.928000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
