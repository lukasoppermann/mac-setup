---
name: issue
description: Turn a /issue request into a GitHub issue that acts as the contract for the work, before any code is written.
user-invocable: true
disable-model-invocation: false
---

The issue is the contract. It defines what gets done, what does not, and how we
know it worked. Nothing starts before the issue exists and the user approved it.
This covers investigations and audits too, not just code changes.

## 1. Triage

Run this skill only when the user wrote `/issue`. Do not trigger it based on
prompt length, request size, or perceived complexity.

Requests without `/issue` should just be handled normally. Rubber-ducking,
quick questions, long investigations, and substantial changes do not get the
interview unless the user explicitly starts with `/issue`.

Once triggered, there are no exemptions beyond the user writing `skip` or
`no issue`, or picking `Skip issue` in the interview. Not audits, not
investigations, not one-line fixes, not a missing git remote, not "this is
obviously correct". Do not investigate first and file the issue afterwards.

If you genuinely cannot create one (no remote, no `gh` auth), still run the
interview and write the issue body, then ask the user where to put it. Do not
start working because the issue could not be filed.

## 2. Interview

Never guess. Ask in short rounds, max 5 questions per round, most important
first, multiple choice where possible. Wait for answers between rounds.

Every question you ask in this skill, in every round, must offer
`Skip issue` as its final choice. If the user picks it, abandon the interview
immediately, create nothing, and carry on with their original request as if
this skill had never run. Do not argue, do not ask again for the rest of the
session, do not mention the issue afterwards.

Round 1, always:

- What outcome do you want, and who is it for?
- What is explicitly out of scope?
- How do we verify it works?

Later rounds, only what is still unclear:

- entry points, states (empty, loading, error), edge cases
- which files or directories should change, which must not be touched
- dependencies, migrations, rollout order, deferred work
- constraints already settled that I should not re-litigate

After each round, summarize what is settled and name any contradiction you see.
Recommend an option with tradeoffs when it is a judgment call. Stop when nothing
material is open.

## 3. Write the issue

Draft the body and show it before creating anything. Sections:

```markdown
## Goal
One or two sentences. The outcome, not the implementation.

## Context
Why now, prior art, links to related issues, docs, designs.

## Acceptance criteria
- [ ] Testable statements. Each one is observable pass/fail.

## Scope
In scope: specific files, directories, or behaviors.
Out of scope: what must not change. Be explicit, this is the guardrail.

## Verification
The exact command, test, or manual steps that prove it works.

## Size
One reviewable PR, or a listed breakdown if it is not.

## Open questions
Decisions still needed, with who decides.
```

Keep it short enough to be read. Prefer pointing at files over describing them.

Create with `gh issue create`, or `create_issue_artifact` when the session is
already linked to an issue. Report the issue number and stop for approval.

## 4. During the work

- Reference the issue in every branch and PR so GitHub links them. Use
  `Closes #N` in the PR body for the issue that finishes the work, and
  `Refs #N` for partial ones.
- When research, investigation, or a design decision produces something worth
  keeping, attach it to the issue. Use `create_issue_artifact` for longform
  output like root cause analyses, research notes, or plans. Use a comment for
  short findings and decision records.
- If the work drifts outside the stated scope, stop. Say what changed, and ask
  whether to update the issue or split off a new one. Do not silently widen.
