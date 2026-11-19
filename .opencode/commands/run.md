---
description: Run the layout-to-checker path for a club slide deck: Layout → Fill → Checker, saving each handoff to drafts/ and the final result to outputs/, stopping before the analyst's decision.
---

# Run: build a club slide deck (layout → fill → checker)

Runs the first path through the system map, from one input to one output, in order:
**Layout agent → Fill agent → Checker agent**, stopping before the analyst (the person who makes a call).

## 0. Check the inputs

Before anything else, confirm each required input exists. If any is missing, **stop** and report which one is missing, then ask the user with a recommendation for what to do next. Do not continue past a missing input.

| Input | Expected location | Used by |
| :---- | :---- | :---- |
| Analyst's section outline | `sources/` (e.g. `sources/outline.md`) | Layout, Fill |
| Club PowerPoint template | `sources/` (e.g. `sources/club-template.pptx`) | Layout, Checker |
| Design-rules file (fonts, colors, layouts) | `sources/` (e.g. `sources/design-rules.md`) | Layout, Checker |

If the **outline** is missing, stop and ask whether to (a) wait for the outline, (b) use a made-up/test outline for now, or (c) abort.
If the **template** or **design-rules file** is missing, stop and ask the user to provide it before running.

## 1. Layout agent → deck skeleton

Run the **Layout agent** (`.opencode/agents/layout.md`, using `layout-matching`).

- **Inputs:** the outline and the club template from `sources/`.
- **Output (handoff):** a deck skeleton — each slide assigned a template layout with empty placeholders.
- **Save the handoff** to `drafts/skeleton.pptx`.
- If the outline or template is missing, stop and ask (per step 0).

## 2. Fill agent → filled deck

Run the **Fill agent** (`.opencode/agents/fill.md`, using `point-mapping`).

- **Inputs:** the section outline from `sources/` and the skeleton at `drafts/skeleton.pptx`.
- **Output (handoff):** a filled deck — every box holds exactly one outline point, nothing extra.
- **Save the handoff** to `drafts/filled.pptx`.

## 3. Checker agent → pass/fail report

Run the **Checker agent** (`.opencode/agents/checker.md`, using `standards-checking`).

- **Inputs:** the filled deck at `drafts/filled.pptx`, plus the template and design-rules file from `sources/`.
- **Output:** a pass/fail report per standard 1–5 listing any failing slide.
- **Save the final result** to `outputs/pass-fail-report.md`.

## 4. Stop before the analyst

The path ends here. Do **not** fix failing slides and do not finalize the deck — fixing and any message/framing decisions belong to the **analyst** (the person who makes a call). Report that the deck and pass/fail report are ready for the analyst to review, and stop.

## Notes

- Each handoff is saved as a file in `drafts/`: `drafts/skeleton.pptx` (step 1) and `drafts/filled.pptx` (step 2).
- The finished result is saved in `outputs/`: `outputs/pass-fail-report.md` (step 3).
- The final deck itself is handed to the analyst from `drafts/filled.pptx` for their decision; the repository's finished result at this stop point is the pass/fail report.