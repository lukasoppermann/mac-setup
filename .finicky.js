// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

export default  {
  defaultBrowser: "Google Chrome",
  options: {
    hideIcon: false,
    checkForUpdate: true,
  },
  handlers: [
    // ------------
    // Personal
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
      },
    },

    // ------------
    // Work
    {
      match: [
        "github.com/primer/*",
        "github.com/github/*",
        "primer.style/*",
      ],
      browser: {
        name: "Google Chrome",
        profile: "Profile 2", // find the profile by going to chrome://version/ in the profile and looking for the "Profile Path" field
      },
    },
    {
      match: ({ opener }) => ["Slack"].includes(opener.name),
      browser: {
        name: "Google Chrome",
        profile: "Profile 2", // find the profile by going to chrome://version/ in the profile and looking for the "Profile Path" field
      },
    },
    // ------------
    // Apps
    {
      match: ({ url }) => url.protocol === "slack",
      browser: "/Applications/Slack.app",
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
