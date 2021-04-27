# simulator_add_root_cert plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-simulator_add_root_cert)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-simulator_add_root_cert`, add it to your project by running:

```bash
fastlane add_plugin simulator_add_root_cert
```

## About simulator_add_root_cert

Add a root cert to your Booted simulators using Fastlane.

This can be used to install a SSL proxying certificate like with [Charles Proxy](https://www.charlesproxy.com/) or [Proxyman](https://github.com/ProxymanApp/Proxyman) as well as for enabling simulator internet access in some corporate security setups.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

### TL;DR

From your `Fastfile` call the action using

```ruby
simulator_add_root_cert(certificate_path:)
```

or

```ruby
simulator_add_root_cert
```

with `SIMULATOR_ADD_ROOT_CERT_PATH` set in your environment variables

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
