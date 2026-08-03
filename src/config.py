"""Configuration loaded entirely from environment variables (.env supported)."""
from __future__ import annotations

import os
from dataclasses import dataclass, field
from pathlib import Path

from dotenv import load_dotenv

load_dotenv()


def _bool_env(name: str, default: bool) -> bool:
    value = os.environ.get(name)
    if value is None or value.strip() == "":
        return default
    return value.strip().lower() in ("1", "true", "yes", "on")


def _list_env(name: str) -> list[str]:
    value = os.environ.get(name, "")
    return [item.strip() for item in value.split(",") if item.strip()]


def _int_env(name: str, default: int) -> int:
    value = os.environ.get(name, "").strip()
    return int(value) if value else default


class ConfigError(RuntimeError):
    """Raised when required configuration is missing or invalid."""


@dataclass(frozen=True)
class Config:
    gcp_project_id: str
    google_application_credentials: str | None
    datasets_filter: list[str]
    bq_locations: list[str]

    query_history_enabled: bool
    query_history_days: int

    backup_root_dir: Path

    git_push_enabled: bool
    git_remote_url: str | None
    git_branch: str
    github_token: str | None
    git_user_name: str
    git_user_email: str
    commit_message_prefix: str

    log_level: str

    @staticmethod
    def from_env() -> "Config":
        project_id = os.environ.get("GCP_PROJECT_ID", "").strip()
        if not project_id:
            raise ConfigError(
                "GCP_PROJECT_ID is required. Set it in your environment or .env file."
            )

        creds = os.environ.get("GOOGLE_APPLICATION_CREDENTIALS", "").strip() or None
        if creds and not Path(creds).is_file():
            raise ConfigError(
                f"GOOGLE_APPLICATION_CREDENTIALS points to a missing file: {creds}"
            )

        git_push_enabled = _bool_env("GIT_PUSH_ENABLED", True)
        git_remote_url = os.environ.get("GIT_REMOTE_URL", "").strip() or None

        return Config(
            gcp_project_id=project_id,
            google_application_credentials=creds,
            datasets_filter=_list_env("BQ_DATASETS"),
            bq_locations=_list_env("BQ_LOCATIONS") or ["US"],
            query_history_enabled=_bool_env("QUERY_HISTORY_ENABLED", True),
            query_history_days=_int_env("QUERY_HISTORY_DAYS", 7),
            backup_root_dir=Path(os.environ.get("BACKUP_ROOT_DIR", "backups")),
            git_push_enabled=git_push_enabled,
            git_remote_url=git_remote_url,
            git_branch=os.environ.get("GIT_BRANCH", "main").strip() or "main",
            github_token=os.environ.get("GITHUB_TOKEN", "").strip() or None,
            git_user_name=os.environ.get("GIT_USER_NAME", "BigQuery Backup Bot"),
            git_user_email=os.environ.get(
                "GIT_USER_EMAIL", "bigquery-backup-bot@users.noreply.github.com"
            ),
            commit_message_prefix=os.environ.get(
                "GIT_COMMIT_MESSAGE_PREFIX", "Automated BigQuery backup"
            ),
            log_level=os.environ.get("LOG_LEVEL", "INFO").upper(),
        )
