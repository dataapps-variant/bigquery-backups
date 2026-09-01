CREATE TABLE IF NOT EXISTS `variant-finance-data-project.zoom_tracker.raw_events` (
    event_id STRING,
    event_date DATE,
    event_type STRING,
    event_timestamp TIMESTAMP,
    meeting_id STRING,
    meeting_uuid STRING,
    participant_id STRING,
    participant_name STRING,
    participant_email STRING,
    breakout_room_uuid STRING,
    room_name STRING,
    action STRING,
    raw_payload STRING,
    inserted_at TIMESTAMP,
    gcs_path STRING
)
PARTITION BY event_date;

CREATE TABLE IF NOT EXISTS `variant-finance-data-project.zoom_tracker.room_mappings` (
    meeting_id STRING,
    meeting_uuid STRING,
    room_uuid STRING,
    room_name STRING,
    mapped_at TIMESTAMP,
    mapping_date DATE
)
PARTITION BY mapping_date;
