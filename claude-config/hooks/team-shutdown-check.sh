#!/usr/bin/env bash
# team-shutdown-check.sh — Stop hook (global)
# 활성 팀이 남아있으면 종료 리마인더 출력

set -euo pipefail

TEAMS_DIR="$HOME/.claude/teams"

# 팀 디렉토리가 없거나 비어있으면 통과
if [ ! -d "$TEAMS_DIR" ]; then
  echo '{"decision":"approve"}'
  exit 0
fi

TEAM_FILES=$(find "$TEAMS_DIR" -maxdepth 1 -name "*.json" 2>/dev/null | head -20)

if [ -z "$TEAM_FILES" ]; then
  echo '{"decision":"approve"}'
  exit 0
fi

# 활성 팀 이름 수집
TEAM_NAMES=""
while IFS= read -r f; do
  name=$(basename "$f" .json)
  if [ -n "$TEAM_NAMES" ]; then
    TEAM_NAMES="$TEAM_NAMES, $name"
  else
    TEAM_NAMES="$name"
  fi
done <<< "$TEAM_FILES"

python3 -c "
import json
result = {
    'decision': 'approve',
    'reason': '[team-check] 활성 팀 감지: ${TEAM_NAMES}. 작업이 완료되었다면 팀을 종료하세요 (SendMessage → shutdown_request).'
}
print(json.dumps(result, ensure_ascii=False))
"
