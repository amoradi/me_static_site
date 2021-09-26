+++

title = "JavaScript Modue Definitions: CJS, AMD, UMD, and ESM"
template = "notes.html"
description = "Quick points on module definitions."

+++

## CJS
- CJS is short for CommonJS
- Node uses CJS module format
- Will give you a **copy** of the imported object
- CJS will not work in the browser. It will have to be transpiled and bundled.

```js
//importing 
const doSomething = require('./doSomething.js'); 

//exporting
module.exports = function doSomething(n) {
  // do something
}
```

## AMD
- AMD stands for Asynchronous Module Definition
- AMD imports modules asynchronously
- AMD is made for frontend (when it was proposed) (while CJS backend)

```js
define(['dep1', 'dep2'], function (dep1, dep2) {
    //Define the module value by returning a value.
    return function () {};
});
```

## UMD

- UMD stands for Universal Module Definition
- UMD is usually used as a fallback module when using bundler like Rollup/ Webpack

```js
(function (root, factory) {
    if (typeof define === "function" && define.amd) {
        define(["jquery", "underscore"], factory);
    } else if (typeof exports === "object") {
        module.exports = factory(require("jquery"), require("underscore"));
    } else {
        root.Requester = factory(root.$, root._);
    }
}(this, function ($, _) {
    // this is where I defined my module implementation

    var Requester = { // ... };

    return Requester;
}));
```

## ESM
- ESM stands for ES Modules.
- It is Javascript's proposal to implement a standard module system
- It has the best of both worlds: CJS-like simple syntax and AMD's async
- Tree-shakeable, due to ES6's static module structure
- ESM allows bundlers like Rollup to remove unnecessary code, allowing sites to ship less codes to get faster load.
- Can be called in HTML, just do:

```js
<script type="module">
  import {func1} from 'my-lib';

  func1();
</script>
```

## Summary
- ESM is the best module format thanks to its simple syntax, async nature, and tree-shakeability.
- UMD works everywhere and usually used as a fallback in case ESM does not work
- CJS is synchronous and good for back end.
- AMD is asynchronous and good for front end.

reference: https://dev.to/iggredible/what-the-heck-are-cjs-amd-umd-and-esm-ikm
