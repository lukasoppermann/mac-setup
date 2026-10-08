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
      match: (_url, { opener }) => opener?.bundleId === "com.tinyspeck.slackmacgap",
      browser: {
        name: "Google Chrome",
        profile: "Profile 2",
        openInBackground: false,
      },
    },
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
  rewrite: [
    {
      match: "amazon.com/*",
      url: (url) => {
        url.host = "smile.amazon.com";
        return url;
      },
    },
  ],
};
