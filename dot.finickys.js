module.exports = {
  defaultBrowser: "Brave Browser",
  handlers: [
	  {
		  match: finicky.matchDomains([
			  "ted.com",
			  /.*\.medium.com$/,
			  "stackoverflow.com",
			  "dev.tencent.com",
			  "tower.im",
			  "mailing.dzone.com",
		  ]),
		  browser: "Safari"
	  },
    {
		  match: finicky.matchDomains([
			  "www.yuque.com",
			  "jira.wise2c.com",
			  "lanhuapp.com",
		  ]),
		  browser: "Vivaldi"
	  }
  ]
};
