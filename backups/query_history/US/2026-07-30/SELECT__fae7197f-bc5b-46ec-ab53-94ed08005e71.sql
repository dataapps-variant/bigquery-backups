-- job_id: fae7197f-bc5b-46ec-ab53-94ed08005e71
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T02:01:27.814000+00:00
-- started: 2026-07-30T02:01:27.959000+00:00
-- ended: 2026-07-30T02:01:28.076000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
