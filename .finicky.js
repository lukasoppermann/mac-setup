// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Google Chrome",
  options: {
    hideIcon: false,
    checkForUpdate: true,
  },
  handlers: [
    {
      match: ({ opener }) =>
        ["Slack"].includes(opener.name),
        browser: {
          name: "Google Chrome",
          profile: "Profile 1",
        },
    },
    {
      match: ({ url }) => url.protocol === "slack",
      browser: "/Applications/Slack.app",
    },
    {
      match: "twitter.com/*",
      browser: {
        name: "Google Chrome",
        profile: "Default",
      },
    },
    {
      match: "linkedin.com/*",
      browser: {
        name: "Google Chrome",
        profile: "Default",
      },
    },
  ],
};
