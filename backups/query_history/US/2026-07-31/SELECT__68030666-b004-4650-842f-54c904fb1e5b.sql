-- job_id: 68030666-b004-4650-842f-54c904fb1e5b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T17:09:07.908000+00:00
-- started: 2026-07-31T17:09:07.988000+00:00
-- ended: 2026-07-31T17:09:08.092000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
