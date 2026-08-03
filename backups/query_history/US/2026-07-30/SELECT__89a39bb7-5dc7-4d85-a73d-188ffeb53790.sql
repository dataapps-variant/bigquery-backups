-- job_id: 89a39bb7-5dc7-4d85-a73d-188ffeb53790
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T03:01:30.579000+00:00
-- started: 2026-07-30T03:01:30.681000+00:00
-- ended: 2026-07-30T03:01:30.810000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
