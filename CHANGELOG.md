caddy CHANGELOG
===============

This file is used to list changes made in each version of the caddy cookbook.

0.5.2
-----
- Daniel Zabel - configurable binary name for github source use

0.5.1
-----
- Daniel Zabel - configurable download url and ark attributes
- Daniel Zabel - ulimit default value to 8192
- Daniel Zabel - fix rubocop style issues

0.5.0
-----
- Christian Fischer - Update Testsuite images and ports
- Gabriel Mazetto - Improve systemd compatibility
- Christian Fischer - Improve template generation
- Felix Simmendinger - Improve support for different OSes, add CentOS 6.7
- Felix Simmendinger - Add serverspec tests
- Felix Simmendinger - Make limit for open filehandles configurable using `node['caddy']['ulimit']`, defaults to `4096`.

0.4.0 
-----
- Gabriel Mazetto - Improved documentation and CHANGELOG
- Gabriel Mazetto - Foodcritic on Travis CI
- Gabriel Mazetto - Added subdirective to the template (to enable rewrite rules on hosts)
- Gabriel Mazetto - Use Upstart for Ubuntu LTS (14.04)
- Gabriel Mazetto - Repeated elements can now be used (see proxy_header example)
- Gabriel Mazetto - Improved template code and Chefspec 

0.3.0
-----
- Christian Fischer - Improved cookbook metadata
- Christian Fischer - Fixes for sysV init system

0.2.0
-----
- Christian Fischer - Caddyfile template generated based on cookbook attributes
- Christian Fischer - Init systems support (sysv systemd upstart)

0.1.0
-----
- Christian Fischer - Initial release of caddy cookbook

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
