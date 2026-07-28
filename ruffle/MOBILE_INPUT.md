# Mobile release-to-swing input

This self-hosted Ruffle build is based on upstream commit
`9f1fffec3e1f4328d427bd24c3c55fbe761a45bd`
(`0.2.0-nightly.2026.5.3`). It adds the opt-in `releaseTouchClick` load
option used by this site.

When enabled, a touch pointer updates the Flash mouse position while it is
held. Ruffle does not send `MouseDown` at touch start. A short stationary tap
uses a normal immediate `MouseMove`, `MouseDown`, and `MouseUp` sequence so
the SWF menu buttons work normally. A hold of 350ms or more, or a drag of at
least 12 CSS pixels, sends the click at release and keeps it pressed for 500ms
to implement release-to-swing input. `pointercancel` clears the active finger
without sending a click. Only touch pointers use this path; mouse and other
desktop input keep the upstream behavior.

The page enables this option only when its device detection selects mobile:

```js
player.ruffle().load({
  url: "homerun.swf",
  releaseTouchClick: document.body.dataset.device === "mobile"
});
```

The build was generated with the upstream Web build process from that exact
commit using Rust `1.97.1`, `wasm-bindgen-cli 0.2.120`, Node.js, and
`npm run build` in `web/`. The standard Ruffle licenses remain in this
directory.
