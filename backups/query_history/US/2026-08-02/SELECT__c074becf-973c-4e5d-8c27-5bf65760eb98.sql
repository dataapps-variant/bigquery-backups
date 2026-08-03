-- job_id: c074becf-973c-4e5d-8c27-5bf65760eb98
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:02:32.708000+00:00
-- started: 2026-08-02T12:02:32.829000+00:00
-- ended: 2026-08-02T12:02:32.917000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
