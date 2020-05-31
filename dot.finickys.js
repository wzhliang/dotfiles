module.exports = {
  defaultBrowser: "Brave Browser",
  handlers: [
	  {
		  match: finicky.matchDomains([
			  "www.yuque.com",
			  "jira.wise2c.com",
			  "ted.com",
			  /.*\.medium.com$/,
			  "stackoverflow.com",
			  "dev.tencent.com",
			  "tower.im",
			  "mailing.dzone.com",
			  "lanhuapp.com",
		  ]),
		  browser: "Safari"
	  }
  ]
};
