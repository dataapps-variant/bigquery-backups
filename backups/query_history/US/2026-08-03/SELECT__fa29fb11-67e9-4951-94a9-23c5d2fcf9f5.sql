-- job_id: fa29fb11-67e9-4951-94a9-23c5d2fcf9f5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:23.531000+00:00
-- started: 2026-08-03T10:10:23.606000+00:00
-- ended: 2026-08-03T10:10:23.789000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
