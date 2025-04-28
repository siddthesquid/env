# User Interfaces

Client apps have the following flow

context
theme
event
state
controller
layout
style

events -> state -> interface
     <- event queue <-

process_event: state, event<state> proof<state, event> => new_state

node:
  create
  destroy

```typescript
const app = blah(context => {
  const header = header()
  const body = body()

  return [header, body]
})
```
