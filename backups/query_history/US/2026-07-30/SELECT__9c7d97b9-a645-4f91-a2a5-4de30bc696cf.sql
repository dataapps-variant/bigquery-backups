-- job_id: 9c7d97b9-a645-4f91-a2a5-4de30bc696cf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T08:01:46.533000+00:00
-- started: 2026-07-30T08:01:46.616000+00:00
-- ended: 2026-07-30T08:01:46.732000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
