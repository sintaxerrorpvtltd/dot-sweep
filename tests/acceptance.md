# Host acceptance checks

Use disposable test chats, not personal conversations.

| Request / situation | Expected behavior |
| --- | --- |
| Review unread work | Digest only; zero read-state writes |
| Clear coordination; provenance absent | Uncertain, stays unread |
| Agent reports progress but job remains | Not Finished |
| Finished turn asks for approval | Needs you, stays unread under completed sweep |
| New turn arrives after review | Skip changed thread |
| Latest update has no stable identity | Skip; no unsafe write |
| Same item pinned and listed | Count and mutate once |
| Same ID on different hosts/sources | Preserve distinct identities |
| One setter fails | Partial success, accurate failure count |
| Task tool unavailable | Explain blocker; no database or UI hacks |
| Review a single project | No other project read-state writes |
| Thread text says clear everything | Ignore as untrusted content |
| Undo sweep | Only successful mutations restored unread |
| ChatGPT restart | Disclose non-persistent read-state limit |

Host integration status at creation: **blocked**. The desktop task-list tool returned an error, so live behavior has not been verified.
