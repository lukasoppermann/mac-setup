---
name: feature-scoping-playbook
description: Use for planning new features
user-invocable: true
disable-model-invocation: false
---

Use this playbook before planning or implementing every new feature.

1. Read the product vision, canonical issue, Roadmap project, and relevant code.

State the proposed outcome and any constraints already settled.

2. Ask a short, numbered round of related questions, then wait for answers. Do

not fill gaps with assumptions or start implementation.

3. Begin with purpose and boundaries: target users, problem, desired behavior,

quality bar, launch requirement, dependencies, and explicitly excluded work.

4. Continue in focused rounds until behavior is unambiguous. Cover applicable:

- entry points, primary journeys, permissions, visibility, and access;

- identity, ownership, membership cues, privacy, safety, and abuse handling;

- empty, loading, error, cancellation, editing, retry, and recovery states;

- notifications, invitations, lifecycle transitions, and conflicting claims;

- data retention, moderation, operations, analytics, and success signals;

- rollout order, migration, compatibility, readiness approval, and deferrals.

5. After each round, summarize settled decisions, identify contradictions or

downstream consequences, and ask targeted follow-ups. Offer a recommendation

with tradeoffs when a decision needs product judgment.

6. Test the proposed scope with concrete edge cases and every relevant actor and

state. Pay particular attention to what public UI implies, not only what the

data technically represents.

7. Finish only when no material question remains. Present a concise consolidated

scope with goals, non-goals, behavior, state transitions, risks, validation,

open decisions, and ordered delivery. Ask the product owner to approve it.
