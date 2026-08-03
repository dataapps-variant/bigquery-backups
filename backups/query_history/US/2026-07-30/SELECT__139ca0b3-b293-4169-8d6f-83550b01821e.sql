-- job_id: 139ca0b3-b293-4169-8d6f-83550b01821e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T01:04:52.115000+00:00
-- started: 2026-07-30T01:04:52.247000+00:00
-- ended: 2026-07-30T01:04:52.376000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
