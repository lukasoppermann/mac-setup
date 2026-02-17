## Plan Mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## MANDATORY Workflow

After every code change, check `package.json` scripts for available `lint`, `format`, `test`, and `build` commands (e.g. `npm run lint`, `npm run format:fix`, `npm run test`, `npm run build`). Run all that exist, in that order. Fix any errors and re-run until all pass. Do not consider a task complete until every available check passes with zero errors.