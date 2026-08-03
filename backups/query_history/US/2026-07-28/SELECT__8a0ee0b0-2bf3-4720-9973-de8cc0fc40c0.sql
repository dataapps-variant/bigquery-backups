-- job_id: 8a0ee0b0-2bf3-4720-9973-de8cc0fc40c0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:06:31.198000+00:00
-- started: 2026-07-28T06:06:31.313000+00:00
-- ended: 2026-07-28T06:06:31.773000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
