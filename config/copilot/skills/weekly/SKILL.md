---
name: weekly
description: "Use /weekly to write a five-sentence update about work completed in the current session and its directly related work, from the user's perspective, emphasizing user impact and including plain issue and PR URLs."
---

# /weekly

Write a ready-to-paste work update, not an activity log. Explain what changed
and why that matters to the people using it.

## Find the work

Start with the current conversation and available session metadata. Identify
the actual fixes, improvements, changes, and completed outcomes, along with
their issue and pull request references.

If this session belongs to a larger piece of work, include directly related
completed work so the update describes the coherent outcome, not just this
session's fragment. Follow evidence such as a shared parent issue, explicitly
linked PRs, a PR stack, or connected sessions. Use available session history
and read-only repository or GitHub tools as needed to verify those connections
and the work's status. Do not collect unrelated work just because it shares a
repository, author, or date.

Despite the command's name, do not automatically restrict the update to the
last seven days. Summarize this session and the connected piece of work unless
the user explicitly supplies a reporting period.

Use evidence, not assumptions. Distinguish implemented, tested, merged, and
released work. A proposal is not an implementation, and an open PR is not a
shipped change. If related evidence is inaccessible, keep the update within
what is known and mention any material limitation within the five sentences.
Do not claim to have exhaustively reviewed material you could not access.

## Write the update

Write exactly five sentences in one plain paragraph, followed by related
issue and PR URLs as described below. Do not add a title, preamble, bullets,
numbering, or a closing offer.

Write in the user's voice, as an update they can paste as their own. Favor
natural action-led sentences such as "Fixed...", "Improved...", or "Changed..."
instead of starting every sentence with "I". An occasional "I" is fine.
Do not refer to "the user", "you", "the assistant", or "this session" when
describing who did the work. Do not take personal credit for other people's
contributions when summarizing the wider effort.

Focus on what was fixed, improved, changed, or completed, not the sequence of
tools, meetings, commits, or investigation steps. Describe research or planning
as such when that is the actual completed work.

Connect each meaningful change to a concrete user benefit where the evidence
supports it: fewer errors, less repeated work, clearer choices, faster
completion, or a previously blocked task becoming possible. Explain the
practical difference instead of saying something vague like "better UX".
Do not invent measurements, user feedback, or benefits. Describe expected
benefits as expected when they have not been demonstrated, and do not imply
users already have an unreleased change.

Use plain, concise language. Avoid jargon, hype, emojis, em dashes, en dashes,
and semicolons. Do not pad the update with invented achievements to reach five
sentences. If there is not enough evidence for a meaningful update, ask one
focused question before writing it.

## Include the references

After the paragraph, add a blank line and every verified issue and PR URL
directly related to the summarized work, including relevant parent issues and
connected PRs. Put each unique URL on its own line.

Use bare, full URLs only. Do not use Markdown link labels, angle brackets,
backticks, bullets, a "Links" heading, or trailing punctuation. These URL lines
are references and do not count toward the five sentences. Never invent a
URL. If there are no known related issues or PRs, omit the reference block.

## Check before responding

Silently check that the paragraph has exactly five sentences, the claims match
the evidence and completion status, the user impact is concrete and honest,
and all known directly related issue and PR links are included once as bare
URLs. Return only the update and its references.
