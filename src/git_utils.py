"""Minimal git wrapper: init/config the repo, commit changes, push to GitHub.

Shells out to the `git` executable rather than a git library so behavior
matches whatever `git` the user already has installed and configured.
"""
from __future__ import annotations

import logging
import subprocess
from pathlib import Path

from .config import Config

logger = logging.getLogger(__name__)


class GitError(RuntimeError):
    pass


def _run(args: list[str], cwd: Path, *, check: bool = True) -> subprocess.CompletedProcess:
    result = subprocess.run(
        ["git", *args],
        cwd=cwd,
        capture_output=True,
        text=True,
    )
    if check and result.returncode != 0:
        raise GitError(f"git {' '.join(args)} failed: {result.stderr.strip()}")
    return result


def ensure_repo(root: Path, config: Config) -> None:
    """Initialize the repo and local git identity if not already set up."""
    if not (root / ".git").is_dir():
        logger.info("No git repository found in %s — running git init", root)
        _run(["init"], root)
        _run(["checkout", "-b", config.git_branch], root, check=False)

    _run(["config", "user.name", config.git_user_name], root)
    _run(["config", "user.email", config.git_user_email], root)

    if config.git_remote_url:
        existing = _run(["remote", "get-url", "origin"], root, check=False)
        current_url = existing.stdout.strip() if existing.returncode == 0 else None
        if current_url != config.git_remote_url:
            if current_url is None:
                _run(["remote", "add", "origin", config.git_remote_url], root)
            else:
                _run(["remote", "set-url", "origin", config.git_remote_url], root)


def stage_all(root: Path) -> None:
    _run(["add", "-A"], root)


def has_staged_changes(root: Path) -> bool:
    result = _run(["status", "--porcelain"], root)
    return bool(result.stdout.strip())


def commit(root: Path, message: str) -> None:
    _run(["commit", "-m", message], root)


def _push_url(config: Config) -> str | None:
    """Return an explicit push URL with an embedded token, if applicable.

    Only used transiently as a git argument — never written to the repo's
    config on disk — so a PAT never lingers in .git/config.
    """
    if not config.git_remote_url or not config.github_token:
        return None
    if not config.git_remote_url.startswith("https://"):
        return None
    without_scheme = config.git_remote_url[len("https://"):]
    return f"https://x-access-token:{config.github_token}@{without_scheme}"


def push(root: Path, config: Config) -> None:
    branch = config.git_branch
    _run(["branch", "-M", branch], root, check=False)

    push_url = _push_url(config)
    if push_url:
        args = ["push", "-u", push_url, branch]
        logger.info("Pushing to remote (token-authenticated) branch %s", branch)
    else:
        args = ["push", "-u", "origin", branch]
        logger.info("Pushing to origin branch %s", branch)

    result = _run(args, root, check=False)
    if result.returncode != 0:
        raise GitError(f"git push failed: {result.stderr.strip()}")
