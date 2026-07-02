---
name: anki-mcp
description: Complete reference for calling the Anki MCP server. Use this when creating flashcards, syncing decks, conducting review sessions, managing notes/cards/tags/models, or working with FSRS scheduler params in Anki. ServerName for call_mcp_tool is always "anki".
---

# Anki MCP Skill

> **Server name**: `anki`  
> **How to call**: Use `call_mcp_tool` with `ServerName: "anki"` and `ToolName: "<tool_name>"`.

---

## ⚠️ Prerequisites (MUST READ FIRST)

### Plugin Registration (Critical)
The `anki` MCP server **must** be registered as a plugin, not just in the top-level `mcp_config.json`.

**Root cause (discovered 2026-06-15):** The agent framework only enables MCP servers registered inside plugin folders at:
```
/home/serein/.gemini/config/plugins/<plugin-name>/mcp_config.json
```

The top-level `/home/serein/.gemini/antigravity-cli/mcp_config.json` starts the process but does NOT make tools callable — `call_mcp_tool` returns `tool X is not enabled for server anki`.

**Fix (already applied):** Created `/home/serein/.gemini/config/plugins/anki-plugin/` with:
- `plugin.json` — plugin manifest
- `mcp_config.json` — registers `anki` server via `npx -y mcp-remote http://127.0.0.1:3141`

### Anki Must Be Running
- Port `3141` must be active (served by the Anki Python process)
- Confirm with: `ss -tlnp | grep 3141`
- The `mcp-remote` bridge will auto-start via `npx`

> **After a new session:** Restart the CLI tool for the plugin registration to take effect. The tools will then appear under `# anki` in the MCP servers section.

---

## 🚀 Common Workflows

### Create notes (flashcards)
1. `model_names` → see available note types + shortcuts (`basic`, `basicReversed`, `cloze`)
2. `model_field_names` → confirm required fields for chosen model
3. `list_decks` → confirm target deck exists (or `create_deck` first)
4. `add_note` (single) or `add_notes` (batch, same deck+model)

### Review session
1. `sync` → always sync FIRST
2. `get_due_cards` (deck_name required) → get next card
3. `present_card` (show_answer: false) → show question
4. Wait for user answer
5. `present_card` (show_answer: true) → show answer
6. Suggest rating 1–4, wait for user confirmation
7. `rate_card` → submit rating
8. Repeat from step 2; `sync` at END of session

### Find & edit existing notes
1. `find_notes` (Anki query string) → get note IDs
2. `notes_info` → get full note data (use `include_fields`/`exclude_fields` for efficiency)
3. `update_note_fields` (single) or `update_notes` (batch) → modify fields

---

## 📋 Tool Reference

### Notes & Cards

| Tool | Key Params | Notes |
|------|-----------|-------|
| `add_note` | `deck_name`, `model_name`, `fields` (obj), `tags?`, `allow_duplicate?` | Returns note ID |
| `add_notes` | `deck_name`, `model_name`, `notes[]` ({fields, tags?}), `tags?`, `allow_duplicate?` | Batch; atomic undo; partial success OK |
| `find_notes` | `query` (Anki syntax), `limit?` (max 500), `offset?` | Returns note IDs |
| `notes_info` | `notes` (int[]), `include_fields?`, `exclude_fields?` | Returns full note data + CSS |
| `update_note_fields` | `id`, `fields` (obj) | Partial update OK; close Anki browser first! |
| `update_notes` | `notes[]` ({id, fields}) | Batch; partial success OK |
| `delete_notes` | `notes` (int[]), `confirmDeletion: true`, `dry_run?` | Max 100; irreversible without dry_run |

### Decks

| Tool | Key Params | Notes |
|------|-----------|-------|
| `list_decks` | `include_stats?` | Returns deck_id, name, is_filtered, card counts |
| `create_deck` | `deck_name` | Use `Parent::Child` syntax; max 2 levels; won't overwrite |
| `filtered_deck` | `params.action` = one of below | Multi-action tool |

**filtered_deck actions:**
- `create_or_update`: `name`, `search_terms[]` ({search, limit?, order?}), `deck_id?` (0=new), `reschedule?`, `allow_empty?`
- `rebuild`: `deck_id`
- `empty`: `deck_id`
- `delete`: `deck_id`
- `get_info`: `deck_ids[]` (max 50)

### Review Tools

| Tool | Key Params | Notes |
|------|-----------|-------|
| `sync` | _(none)_ | Sync at start AND end of every review session |
| `get_due_cards` | `deck_name`, `skip_images?`, `skip_audio?` | Returns ONE card per call |
| `present_card` | `card_id`, `show_answer?` | Returns rendered HTML question/answer + scheduling info |
| `rate_card` | `card_id`, `rating` (1–4) | Only call AFTER user confirms rating |

**Rating scale**: 1=Again, 2=Hard, 3=Good, 4=Easy

### Models (Note Types)

| Tool | Key Params | Notes |
|------|-----------|-------|
| `model_names` | _(none)_ | Lists all models + commonTypes shortcuts |
| `model_field_names` | `model_name` | Lists field names + descriptions |
| `model_styling` | `model_name` | Returns CSS |
| `model_templates` | `model_name` | Returns Front/Back HTML templates |
| `create_model` | `model_name`, `in_order_fields[]`, `card_templates[]`, `css?`, `is_cloze?` | Creates custom note type |
| `update_model_styling` | `model_name`, `css` | Updates CSS; affects all cards of this type |
| `update_model_templates` | `model_name`, `templates` (obj: {CardName: {Front, Back}}) | Updates HTML templates |

### Tags

**All via `tag_management` tool** with `params.action`:

| Action | Key Params | Notes |
|--------|-----------|-------|
| `get_tags` | _(none)_ | All tags in collection |
| `add_tags` | `note_ids[]`, `tags` (space-separated string) | |
| `remove_tags` | `note_ids[]`, `tags` (space-separated string) | |
| `replace_tags` | `note_ids[]`, `old_tag`, `new_tag` | |
| `batch_tags` | `operations[]` ({type: 'add'/'remove', note_ids[], tags}) | Max 50 ops |
| `clear_unused_tags` | _(none)_ | Removes tags not attached to any note |

### FSRS Scheduler

| Tool | Key Params | Notes |
|------|-----------|-------|
| `get_fsrs_params` | `deck_name?` | Empty = all presets |
| `set_fsrs_params` | `preset_name`, `desired_retention?` (0.70–0.99), `fsrs_params?` (float[]), `max_interval?` | At least 1 param must change |
| `optimize_fsrs_params` | `preset_name`, `apply_results?` (default false) | Dry run by default; takes 5–30s |
| `get_card_memory_state` | `card_ids[]`, `recompute?` | Returns stability, difficulty, retrievability |

### Media

| Tool | Key Params | Notes |
|------|-----------|-------|
| `store_media_file` | `filename`, one of: `data` (base64), `path`, `url` | Saves to collection.media |
| `delete_media_file` | `filename` | Moves to trash (recoverable via Check Media) |
| `get_media_files_names` | `pattern?` (e.g. `*.mp3`) | Lists media files |

### GUI Tools (only when user explicitly asks)

| Tool | Params | Purpose |
|------|--------|---------|
| `gui_add_cards` | _(none)_ | Opens Add Cards dialog |
| `gui_browse` | `query` | Opens Card Browser |
| `gui_deck_browser` | _(none)_ | Opens Deck Browser |
| `gui_edit_note` | `note_id` | Opens note in editor |
| `gui_select_card` | `card_id` | Selects card in open browser |
| `gui_current_card` | _(none)_ | Gets current card in review GUI |
| `gui_show_question` | _(none)_ | Shows question in GUI review |
| `gui_show_answer` | _(none)_ | Shows answer in GUI review |
| `gui_undo` | _(none)_ | Undoes last GUI action |

---

## 🔍 Anki Query Syntax (for find_notes / gui_browse)

```
deck:DeckName          # notes in a deck
tag:tagname            # notes with tag
is:due                 # cards due for review
is:suspended           # suspended cards
added:1                # added today
added:7                # added last 7 days
prop:due<=2            # due within 2 days
flag:1                 # flagged red (1=red, 2=orange, 3=green, 4=blue)
front:hello            # front field contains "hello"
note:Basic             # notes of model "Basic"
```

---

## ✅ Key Rules & Gotchas

- **Always sync** at start AND end of review sessions
- `get_due_cards` returns **one card at a time** (by design, for correct scheduler interleaving)
- `rate_card` must only be called **after explicit user confirmation**
- `delete_notes` requires `confirmDeletion: true` — use `dry_run: true` first to preview
- `create_deck` with `Parent::Child` supports max **2 levels** of nesting
- Close Anki Browser before calling `update_note_fields` or fields won't save
- `add_notes` / `update_notes` support **partial success** — individual failures don't block the batch
- `store_media_file` accepts `data` (base64 string), local `path`, or `url`
- GUI tools are **only** for explicit user requests — never use them for automated review flows

---

## 📝 Card Type Fields Reference

### Basic
```json
{ "Front": "Question?", "Back": "Answer" }
```

### Cloze
```json
{ "Text": "This is a {{c1::cloze deletion}}.", "Back Extra": "Optional context" }
```

### Basic (and reversed card)
```json
{ "Front": "Question?", "Back": "Answer" }
```
> Creates 2 cards automatically (forward + reverse).

---

## 🗂️ Deck for Cultivate Vault

From AGENTS.md: target deck format is `Cultivate::Topics::[TopicName]`.
After syncing cards, update note frontmatter:
```yaml
anki_sync:
  synced_at: "YYYY-MM-DDTHH:mm:ss"
  card_ids: [123456789, ...]
```
