-- job_id: e80f6dbf-ae22-4a80-8321-d5dd3f16f21c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T19:02:53.161000+00:00
-- started: 2026-08-02T19:02:53.346000+00:00
-- ended: 2026-08-02T19:02:53.457000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
