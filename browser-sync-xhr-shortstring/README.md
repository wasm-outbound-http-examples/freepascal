# Use Free Pascal (ShortString + sync XMLHTTPRequest) to send HTTP(s) requests from inside WASM

## Instructions for this devcontainer

Tested with FreePascal [v3.3.1 commit 8132ccd4](https://gitlab.com/freepascal.org/fpc/source/-/tree/8132ccd4).

#### Introduction

FreePascal's WASM RTL seems to have no support for strings yet, so just trying to experiment. 
`ShortString` works well, but it is limited to length of 255 bytes. 

### Preparation

1. Open this repo in devcontainer, e.g. using Github Codespaces.
   Type or copy/paste following commands to devcontainer's terminal.

### Building

1. `cd` into the folder of this example:

```sh
cd browser-sync-xhr-shortstring
```

2. Compile the example:

```sh
fpcwasm main.pp
```

### Test with browser

1. Run simple HTTP server to temporarily publish project to Web:

```sh
python3 -m http.server
```

Codespace will show you "Open in Browser" button. Just click that button or
obtain web address from "Forwarded Ports" tab.

2. As `index.html` and a 200kb-sized `main.wasm` are loaded into browser, refer to browser developer console
   to see the results.


### Finish

Perform your own experiments if desired.
