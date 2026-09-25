// @ts-check
/// <reference types="finicky" />

/** @type {import("finicky").Config} */
export default {
  defaultBrowser: "Google Chrome",
  options: {
    checkForUpdate: true,
  },
  handlers: [
    {
      match: [
        "to-do.live.com/*",
        "linkedin.com/*",
        "twitter.com/*",
        "bsky.app/*",
      ],
      browser: {
        name: "Google Chrome",
        profile: "Default",
        openInBackground: false,
      },
    },
    {
      match: "open.spotify.com/*",
      browser: "Spotify",
    },
    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },
  ],
};
