Workflow Engine
===============

- has methods for universal actions
        - complete, reopen, start
- has hooks for action definition
        - onComplete, onReopen, onStart
- the base universal actions do what they always do to progress workflow, and call do__ to do whatever stage level custom  stuff needs to happen.
- we may want extra beforeAction and afterAction hooks (?)
- hook for extra actions (ggArbitor?)

## questions

- how to know what definition?
- how to hook in team stuff?
- how to handle items? - separate engine(s)?

## fetching data

- does data just come from the workflowModule item thing?
- OR combo of that and the definition (for actions, validations, etc)
- How does the definition connect to the actual thing?
- How do we hold onto stage(s) state correctly?

