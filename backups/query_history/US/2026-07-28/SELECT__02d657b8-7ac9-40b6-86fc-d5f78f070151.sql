-- job_id: 02d657b8-7ac9-40b6-86fc-d5f78f070151
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:04:39.147000+00:00
-- started: 2026-07-28T12:04:39.280000+00:00
-- ended: 2026-07-28T12:04:39.395000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
