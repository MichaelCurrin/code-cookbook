# Configure
> How to set up a Netlify build using the UI or a config file


### Why use a config file

You don't need a config file. You can configure values in the UI including build command and output directory.

But for repeatable builds (across Netlify accounts or sites) and for keeping the value in version control, a config file in your repo is great. It will override the UI options.

Note that either way you don't need to specify an install command or caching dependencies - Netlify will do this for you based on the presence of a package file - Gemfile or yarn.lock file for example.


### Resources

See Netlify's docs to configure builds

- [Get started](https://docs.netlify.com/configure-builds/get-started/)
- [File-based configuration](https://docs.netlify.com/configure-builds/file-based-configuration/)
- [Common Configurations](https://docs.netlify.com/configure-builds/common-configurations/)
- [YAML and JSON file support](https://docs.netlify.com/configure-builds/file-based-configuration/#json-and-yaml-configuration-files)
