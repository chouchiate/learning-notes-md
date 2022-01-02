## [ts] - xstate

[xstate visualizer](https://xstate.js.org/viz/)



[sandbox](https://codesandbox.io/s/xstate-typescript-template-s9kz8?file=/src/index.ts:0-802)
```js
import { createMachine, interpret } from "xstate";
import "./styles.css";

document.getElementById("app").innerHTML = `
<h1>XState TypeScript Example</h1>
<div>
  Open the <strong>Console</strong> to view the machine output.
</div>
`;

// 自定義 Context
interface SampleContext {
  count: number;
}

// 自定義 Event

type SampleEvent = {
  | { type: "TOGGLE" }
  | { type: "ONLINE", payload: }
};

// TypeState { value: StateValue, context: TContext }
type SampleTypeState =
| {
    value: 'init';
    context: SampleContext;
  }
| {
    value: 'online';
    context: SampleContext;
  }

// Edit your machine(s) here
const machine = createMachine<SampleContext, SampleEvent, SampleTypeState>({
  id: "machine",
  initial: "inactive",
  context: {
    count: 0
  },
  states: {
    inactive: {
      on: { TOGGLE: "active" }
    },
    active: {
      on: { TOGGLE: "inactive" }
    }
  }
});

// Edit your service(s) here
const service = interpret(machine).onTransition((state) => {
  console.log(state.value);
});

service.start();

service.send("TOGGLE");
service.send("TOGGLE");

```