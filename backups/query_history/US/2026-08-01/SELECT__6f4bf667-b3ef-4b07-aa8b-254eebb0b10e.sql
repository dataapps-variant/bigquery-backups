-- job_id: 6f4bf667-b3ef-4b07-aa8b-254eebb0b10e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T14:01:32.592000+00:00
-- started: 2026-08-01T14:01:32.704000+00:00
-- ended: 2026-08-01T14:01:32.806000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
