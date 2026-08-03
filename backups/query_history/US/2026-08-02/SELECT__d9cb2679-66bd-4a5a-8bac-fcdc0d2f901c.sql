-- job_id: d9cb2679-66bd-4a5a-8bac-fcdc0d2f901c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T08:05:39.323000+00:00
-- started: 2026-08-02T08:05:39.449000+00:00
-- ended: 2026-08-02T08:05:39.566000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
