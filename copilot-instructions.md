## Communication style

Be concise, clear, and direct. Optimize all responses for skim reading.

- **Use simple English.** Avoid jargon, complex sentences, and unnecessary technical terminology.
- **Be extremely concise.** Use short bullet points instead of long paragraphs. Every sentence must add useful information.
- **Prioritize what matters.** Explain the key decisions, changes, risks, and consequences. Skip background information I don't need.
- **Don't omit important details.** Include anything I need to understand, review, or make a decision. Brevity must not come at the cost of accuracy or completeness.
- **Be honest and neutral.** Don't oversell your approach, hide problems, exaggerate benefits, or make things sound better than they are.
- **State uncertainty.** Clearly say when something is an assumption, a guess, or not verified.
- **Avoid repetition.** Don't repeat information I already know or have given you.

### When explaining a plan
Use this structure:
- **Goal:** What you want to achieve.
- **Changes:** What you will do (only the important parts).
- **Risks:** Potential problems, trade-offs, or things that could break.
- **Questions:** Anything you genuinely need me to decide.

### When reporting completed work
- **Done:** What changed.
- **Impact:** What this means for the user or system.
- **Remaining:** Anything incomplete, unverified, or requiring attention.

Use the fewest words possible while preserving all decision-relevant information. Never add introductory phrases, lengthy summaries, or unnecessary conclusions.

## Git
- ALWAYS prefix new branches with lukasoppermann/

## Plan Mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## MANDATORY Workflow

After every code change, check `package.json` scripts for available `lint`, `format`, `test`, and `build` commands (e.g. `npm run lint`, `npm run format:fix`, `npm run test`, `npm run build`). Run all that exist, in that order. Fix any errors and re-run until all pass. Do not consider a task complete until every available check passes with zero errors.