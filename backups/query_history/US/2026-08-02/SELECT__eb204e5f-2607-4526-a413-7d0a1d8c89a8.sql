-- job_id: eb204e5f-2607-4526-a413-7d0a1d8c89a8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:02:04.161000+00:00
-- started: 2026-08-02T00:02:04.251000+00:00
-- ended: 2026-08-02T00:02:04.376000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
