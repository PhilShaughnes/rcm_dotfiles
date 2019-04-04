Workflow Engine
===============

- has methods for universal actions
    - complete, reopen, start
- has hooks for action definition
    - onComplete, onReopen, onStart
- the base universal actions do what they always do to progress workflow, and call doThing to do whatever stage level custom  stuff needs to happen.
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

## Data discussion
- grab model from id, use the model to get the coresponding definition
- designate in definition, then loop and finde
- 


Grow.class -> GrowDefinition
Capa.class -> CapaDefinition

loop {
  > registry.on(definition.instanceType).then(context -> definition)
  registry.put(defintion.instanceType, definition)
}
registry.get(context.getType)

## Workflow Engine Duties
1) ID
2) validate
3) perform mutations/actions
