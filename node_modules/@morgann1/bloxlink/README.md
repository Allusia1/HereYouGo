`@morgann1/bloxlink` - an unofficial NPM package to interact with the Bloxlink v3 API.

## Installation

With [Node Package Manager](https://www.npmjs.com/):

```bash
$ npm install @morgann1/bloxlink
```

With [Yarn](https://yarnpkg.com/)

```bash
$ yarn add @morgann1/bloxlink
```

## Usage (Setting up)

```js
const { Configuration, BloxlinkAPI } = require("@morgann1/bloxlink");

const configuration = new Configuration({
    apiKey: "your api key goes here"
});

const bloxlink = new BloxlinkAPI(configuration);
```

## Search API (Discord -> Roblox)

```js
(async () => {
    const result = await bloxlink.search("DISCORD ID", "GUILD ID (OPTIONAL)");
    console.log(result);
})();
```

The example above should log a response similar to the following:

```js
{
  success: true,
  user: { robloxId: '23587198', primaryAccount: '23587198' }
}
```

A bad response should not include any information in the user object:

```js
{
  success: true,
  user: {}
}
```

Alternatively, a bad response could also return a [429 Too Many Requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429)

## Reverse Searching (Roblox -> Discord)

```
Mentioned by John (Community Manager for Bloxlink):

Reminder, reverse API lookups are not for the public. It is limited to only certain large groups.
If you send an email requesting access, you will most likely be denied. Even for large groups, it’s very limited.
```