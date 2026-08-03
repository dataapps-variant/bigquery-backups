-- job_id: 9588a347-9206-483e-83dc-09c93671a265
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:01:27.235000+00:00
-- started: 2026-07-28T15:01:27.363000+00:00
-- ended: 2026-07-28T15:01:27.467000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
