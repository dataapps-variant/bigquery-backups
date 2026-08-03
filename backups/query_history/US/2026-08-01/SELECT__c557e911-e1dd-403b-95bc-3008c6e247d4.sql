-- job_id: c557e911-e1dd-403b-95bc-3008c6e247d4
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:30:05.746000+00:00
-- started: 2026-08-01T12:30:05.907000+00:00
-- ended: 2026-08-01T12:30:06.385000+00:00


SELECT max(validation_run_timestamp) AS validation_run_timestamp, missing_in_table, field_name_in_missing_table, available_in_table, field_name_in_available_table, string_agg(missing_value, ", ") AS missing_values
FROM (
SELECT * FROM `variant-finance-data-project.Verifications.Verification_1-10` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_11-20` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_21-30` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_31-40` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_41-50` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_41-52` WHERE missing_value != '') AS d
GROUP BY missing_in_table, field_name_in_missing_table, available_in_table, field_name_in_available_table
