---
name: standards-checking
description: Method the Checker agent follows to inspect the finished deck against all five quality standards and report each slide that fails, without editing the deck.
---

# standards-checking

Method used by the Checker agent. _Source: Part 3, Skill 3._

## What it's for

Inspect the finished deck against the quality standards and report each slide that fails.

## Rules

1. **Fonts/colors.** Check every text box against the template's font and color list; fail any box not on the list.
   _(Quality standard 1.)_
2. **Layout.** Check each slide uses a template layout or a clean original arrangement; fail only if neither.
3. **Clean arrangement.** Check for overlapping boxes, misaligned columns, and clip art; fail any slide with these.
   _(Quality standard 3.)_
4. **Text source.** Compare every line of slide text to the outline; fail any line not matching.
   _(Quality standard 4.)_
5. **Box/point count.** Count boxes and match each to an outline point; fail any box with more than one point or repeated point.
   _(Quality standard 5.)_
6. **Fresh layout.** Check that the layout of each slide differs from the sample decks and from the last run's output; fail if it's a copy.
7. **Report, don't edit.** Output a pass/fail report per standard and per slide, without editing the deck.

## Output

A pass/fail report per standard 1–5, listing any failing slide, saved to `outputs/` and handed to the analyst. The Checker saves the report and stops before the analyst's decision.

## Sources

Quality standards 1–5 (Part 1); Research log 3; proposed standard 6 (fresh layout).