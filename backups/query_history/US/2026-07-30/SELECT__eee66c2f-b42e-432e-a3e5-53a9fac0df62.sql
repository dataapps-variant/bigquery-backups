-- job_id: eee66c2f-b42e-432e-a3e5-53a9fac0df62
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:16:35.123000+00:00
-- started: 2026-07-30T06:16:35.225000+00:00
-- ended: 2026-07-30T06:16:35.412000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
