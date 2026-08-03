-- job_id: 4770646a-fe92-4281-9572-59019c13400d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:09.774000+00:00
-- started: 2026-08-03T09:13:09.900000+00:00
-- ended: 2026-08-03T09:13:10.061000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
