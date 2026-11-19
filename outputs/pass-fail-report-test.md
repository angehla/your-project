# Pass/Fail Report — Filled Deck (test)

- **Draft inspected:** `drafts/filled-test.md`
- **Source of truth:** `sources/outline.md`
- **Checker:** read-only inspection; no edits made to the draft or outline.
- **Date:** Thu Nov 19 2026

## Result

| Standard | Result |
|----------|--------|
| 1. Fonts/colors | Not checked (template/design-rules unavailable) |
| 2. Template layout | Not checked (template unavailable) |
| 3. Overlaps/misalignment/clip art | Not checked (template unavailable) |
| 4. Every line from the outline | **FAIL** |
| 5. One point per box, no repeats | **FAIL** |

---

## Standard 1 — Fonts and colors from template only

**Result: Not checked (template/design-rules unavailable).**

The club template's font/color list is not available in this test, so text boxes could not be checked against it. Not failed; reported as not checked.

## Standard 2 — Template layout

**Result: Not checked (template unavailable).**

The club template's built-in layout names are not available in this test. Not failed; reported as not checked.

## Standard 3 — No overlaps, misalignment, or clip art

**Result: Not checked (template unavailable).**

Without geometry/layout data from the template or deck, overlaps, misalignment, and clip art could not be assessed. Not failed; reported as not checked.

## Standard 4 — Every line of text is from the outline (no filler)

**Result: FAIL**

All 10 outline points are present verbatim in the draft (Boxes 1–10 match Outline points 1–10 one-to-one). However, one box contains text that does **not** appear anywhere in the outline.

**Failing box:**

- **Box 11** — "Our company holds 72% of the mid-market segment, the largest share of any vendor."
  - This line is not in `sources/outline.md`. The outline contains no claim about "our company hold[ing] 72% of the mid-market segment" or any vendor share percentages. This is added filler text, in violation of Standard 4.

Scope of check: every box in the draft was compared against every line in the outline. Boxes 1–10 match the outline verbatim; Box 11 does not.

## Standard 5 — One point per box; no point repeated

**Result: FAIL**

Each of Boxes 1–10 holds exactly one distinct outline point, and none of the outline points 1–10 is repeated across the deck.

**Failing box:**

- **Box 11** — holds a point ("Our company holds 72% of the mid-market segment...") that does not correspond to any outline point. It is an extra outline point that should not exist, so the deck's box set does not match the outline's point set (10 outline points vs 11 boxes). Standard 5 requires each box to hold one outline point; Box 11 holds a point that is not in the outline.

---

## Summary

- **Standards 1–3:** not checked (template/design-rules unavailable — not a fail under test conditions).
- **Standard 4:** FAIL — Box 11 contains filler text not in the outline.
- **Standard 5:** FAIL — Box 11 holds a point that is not among the outline's points (extra box).

**No modifications were made to `drafts/filled-test.md` or `sources/outline.md`.** The deck stops here for the analyst's decision.