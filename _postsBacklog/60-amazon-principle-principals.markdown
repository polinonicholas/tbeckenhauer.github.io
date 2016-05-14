    [AT-A-GLANCE] Anyone should be able to understand what each line and function does at a glance. Otherwise the code is, objectively, too complicated.
    [UNIT TESTS?] Are there unit tests and have they been run? Are you automatically running unit tests on check-in and build? Have you tried property-based testing?
    [PREMATURE OPTIM?] Are there signs of premature optimization?
    [CONFIG DOCS?] Are the configuration settings documented? Do you have URLs in the documentation in the config files and vice-versa?
    [STYLE & LINT] The code should fit your group's style guidelines for indentation, spacing, naming conventions. Did you run lint & clang-format?
    [COVERAGE?] Do the unit tests adequately test the code and changes? Are you automatically running a code coverage tool with the builds?
    [EASY PERF?] Are there obvious performance or efficiency problems that are trivial to address, like copying immutable data instead of passing references?
    [BACKCOMPAT API?] Is the code backward compatible with its pre-existing API?
    [CONCISE?] Each function or method should fill not more than one page. Otherwise it is, objectively, too complicated.
    [THREADS?] Is it appropriately thread safe and re-entrant? Is the thread safety and concurrency documented so callers understand expected semantics?
    [TOO SLOW?] Does the code take much longer to execute even if most of the extra time is spent blocking and waiting?
    [BACKCOMPAT CFG?] Is the code backward compatible with its pre-existing configuration?
    [DOCUMENTED?] Is the code appropriately documented for others to understand without your help? Do you have URLs to documents in your code and vice-versa?
    [SENSIBLE?] Does the design obviously make sense (with or without changes)? If not, the code is, objectively, too complicated or just plain wrong.
    [PROFILED?] Did you profile at all? Did you check in profiling results, with URLs both ways?
    [BREAKING CHANGE?] Are there unnecessary backwards-incompatible breaking changes?
    [COMMENTS?] Are comments concise, complete, grammatical? Do they add value to the surrounding code, or do they just repeat in English what the code obviously says?
    [FITTING?] Do the changes fit the existing design? Did you add new responsibilities to a changed entity instead of creating new entities for new responsibilities?
    [OPERATIONAL?] Can this code be put into production immediately?
    [DEPLOYMENT PLAN] If there are breaking changes, how will you manage package builds and deployment?
    [INTENT?] Is each function's intent clear or would minimal comments describing expectations help?
    [DEFECTS?] Do the changes reveal deficiencies in the existing design? Did simple behavior change require complex code changes?
    [TRACEABLE?] How easy is it to know what the deployed code is doing?
    [NEW DEPENDENCIES] Are there new external dependencies that could introduce a new availability or operational risk?
    [DOXYGEN?] Are the API's documented with Javadoc or Doxygen or equivalent? Does the build process automatically generate these docs?
    [REQUIREMENTS?] Does this change fully address requirements? Is there ambiguity in interpreting requirements? Do you have URLs to requirements docs and vice-versa?
    [LOGGED?] Is there an appropriate amount of logging for all levels from error to debug to dash-boarding? Are log formats machine-readable or just human-readable?
    [UNNECESSARY DEPS] Is every old or new dependency required, or can you remove some and simplify the code and the build? Don't take on shiny new things.
    [WHY'S] Did you say why you made the design decisions you did? Document the more obvious code that ISN'T there because you left it out on purpose! (document the things that didn't work as well as the things that did)
    [COPY-PASTE?] If even a few lines of code are duplicated more than once within a module, you must refactor.
    [METRICS?] Is the code instrumented with performance metrics?
    [LIGHTER DEPS] Can you find alternative 'lighter weight' dependencies to use instead of existing ones?
    [TRICKS] Are you using unnecessary and/or obscure language tricks that may confuse readers, even if for only 30 seconds?
    [LIBRARIZE?] Is there local functionality that should be in a shared library?
    [SUFFICIENT LOGS?] Does each log message include sufficient info for someone to understand behavior of system from just reading logs?
    [GARBAGE RETURNS] Is the code resilient to garbage return values from any library or service that is called?
    [ONE LEVEL] Does each function bridge one level of abstraction, calling lower-level functions?
    [REMOVABLE CODE?] Is there code that could be completely removed or replaced with existing libraries? The best code is deleted code!
    [LOG LEVEL COND?] Are complex info/debug/verbose log statements wrapped in 'if (log level)' tests so as not to impact performance in the happy case?
    [GARBAGE IN] Are your functions and service endpoints resilient to garbage and null inputs?
    [RUN-ON?] Are there 'run-on' functions? They should be split into sub-functions.
    [CONFIGURABLE?] Does behavior switch on arbitrary constant values that should be configurable?
    [REMOTE METRICS?] Are there latency metrics around every remote call leaving the process and host? Are the metrics collected and monitored or dash-boarded?
    [EDGE CASES?] Does the code handle edge cases or just the happy path?
    [COMMENTED-OUT?] Is code commented out? This is seldom appropriate and can be hard to see and waste your reviewers' time. Do not assume everyone has syntax highlighting.
    [MAGIC?] Are there magic numbers or string constants sprinkled, or worse, repeated, across the code?
    [SQL] Is raw SQL built from user input? Explain plans checked in with URLs both ways? Backfills?
    [EXHAUSTIVE CASES] Does the code handle all possible error conditions? How do you exhaust the space of error conditions?
    [OBVIOUS BUGS?] Are there obvious bugs?
    [CONFIG DEFAULTS?] Are there default values, where possible, for all config settings? Does the code work with sensible defaults if the config file is missing?
    [INFOSEC] Snooping? Spoofing? Replay? Repudiation? Tampering? Please see Information Security's checklist.
    [EXCEPTION MECH] Is there a clear and consistent exception-handling strategy? Or do you sometimes throw and sometimes do 'if' analysis of return values?