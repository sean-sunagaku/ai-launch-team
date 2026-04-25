#!/usr/bin/env bash
# launch.sh — orchestrator for the ai-launch-team agent loop.
#
# Phases:
#   pre-launch   — checklist (npm pack, README, CHANGELOG, badges)
#   assets       — asset-designer agent: avatar/OG/header SVG → PNG
#   copy         — copy-writer agent: fill all channel templates
#   strategy     — launch-strategist agent: review channel order + timing
#   publish      — distribution-publisher agent: execute releases & PRs
#   metrics      — metrics-tracker agent: poll HN / npm / GH for 7 days
#
# Each phase is callable independently:
#   ./launch.sh pre-launch
#   ./launch.sh copy
#   ./launch.sh                       # full pipeline (asks for confirmation between phases)

set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

# ---- args ----
PHASE="${1:-all}"
TARGET=""; REPO=""; PACKAGE=""; TAGLINE=""
while [[ $# -gt 1 ]]; do
  shift
  case "${1:-}" in
    --target)  TARGET="${2:-}"; shift ;;
    --repo)    REPO="${2:-}"; shift ;;
    --package) PACKAGE="${2:-}"; shift ;;
    --tagline) TAGLINE="${2:-}"; shift ;;
  esac
done

[[ -z "$TARGET" ]] && TARGET="${TARGET_DIR:-./target}"
[[ -z "$REPO" ]] && REPO="${REPO_SLUG:-}"
[[ -z "$PACKAGE" ]] && PACKAGE="${NPM_PACKAGE:-}"
[[ -z "$TAGLINE" ]] && TAGLINE="${TAGLINE:-}"

CTX="TARGET=$TARGET REPO=$REPO PACKAGE=$PACKAGE TAGLINE=$TAGLINE"

invoke_agent() {
  local agent="$1"; shift
  local instruction="$*"
  echo ""
  echo "── [$(date +%H:%M:%S)] $agent ──"
  # In Claude Code, this script is meant to be invoked from inside a session
  # where each phase is delegated to a sub-agent. The bash script just emits
  # the prompt; the surrounding orchestrator is expected to spawn the agent.
  cat <<EOF
SUBAGENT: $agent
CONTEXT:
  $CTX
INSTRUCTION:
$instruction
RESOURCES:
  - agents/$agent.md
  - templates/
  - playbooks/
EOF
}

phase_pre_launch() {
  echo "== pre-launch =="
  cat playbooks/pre-launch.md
}

phase_assets() {
  invoke_agent "asset-designer" "Generate avatar (256/400) + OG (1200x630) + X-header (1500x500) for the product. Place SVG sources and PNG outputs under target/docs/promo/assets/. Use the product tagline and the dominant brand color from the README. Refer to templates/x-account-spec.md for sizing."
}

phase_copy() {
  invoke_agent "copy-writer" "Fill every template under templates/*.md with the provided context (PRODUCT_NAME, REPO_URL, NPM_PACKAGE, TAGLINE). Save the rendered drafts to target/docs/promo/. Use real npm view + gh repo view output to derive numbers; never invent metrics. Run the product CLI and paste actual output where templates ask for command-output blocks."
}

phase_strategy() {
  invoke_agent "launch-strategist" "Read target/docs/promo/* + target/README.md + target/CHANGELOG.md. Decide the channel order (HN / X / Reddit / awesome-mcp / PH / Discussions). Pick a launch-day window (HN: weekday 6:30–9:00 PT). Identify the single largest remaining risk and any pre-launch blockers. Output: target/docs/promo/launch-plan.md."
}

phase_publish() {
  invoke_agent "distribution-publisher" "Execute the launch-plan.md sequentially. For each channel either (a) AI-side completes (gh release / gh pr / discussions / npm publish), or (b) emits a 1-click handoff doc with exact URL/title/body for human send. Never auto-post on personal social accounts unless the persona spec explicitly authorizes. Log every action to target/docs/promo/launch-log.md."
}

phase_metrics() {
  invoke_agent "metrics-tracker" "Poll HN points/comments, npm install count, GitHub stars, X impressions every 6 hours for 7 days post-launch. Append to target/docs/promo/metrics.jsonl. After 24h, write a Day-1 retrospective to target/docs/promo/day-1.md (target thresholds: HN 50+ pts, X 500+ impressions, npm 100+ DL, stars 50+)."
}

case "$PHASE" in
  pre-launch) phase_pre_launch ;;
  assets)     phase_assets ;;
  copy)       phase_copy ;;
  strategy)   phase_strategy ;;
  publish)    phase_publish ;;
  metrics)    phase_metrics ;;
  all)
    phase_pre_launch
    phase_assets
    phase_copy
    phase_strategy
    phase_publish
    phase_metrics
    ;;
  *)
    echo "Usage: $0 [pre-launch|assets|copy|strategy|publish|metrics|all] [--target DIR] [--repo OWNER/NAME] [--package NPM] [--tagline TEXT]"
    exit 2
    ;;
esac
