# Chocolatey Packages

[![](https://ci.appveyor.com/api/projects/status/github/puppetlabs/puppet-chocolatey-packages?svg=true)](https://ci.appveyor.com/project/puppetlabs/puppet-chocolatey-packages)
[Update status](https://gist.github.com/puppet-chocolatey-bot/07d26b70044a34c1d9aa5576057d515e)

## Chocolatey Packages

This project contains the automatic updating packages for the public community chocolatey feed;

[https://chocolatey.org/profiles/Puppet](https://chocolatey.org/profiles/Puppet)

## Package List

* [pdk](https://chocolatey.org/packages/pdk)
* [pe-client-tools](https://chocolatey.org/packages/pe-client-tools)
* [puppet-agent](https://chocolatey.org/packages/puppet-agent)
* [puppet-bolt](https://chocolatey.org/packages/puppet-bolt)

## Development

### Folder Structure

* automatic - where automatic packaging and packages are kept. These are packages that are automatically maintained using [chocolatey-AU](https://github.com/chocolatey-community/chocolatey-au).

* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.

* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)


#### AU

* PowerShell v5+.
* The [chocolatey-AU module](https://github.com/chocolatey-community/chocolatey-au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).

---

## The long version

### Goal

To publish windows based installers from Puppet into the community chocolatey feed for our users to consume

### Requirements

* "Supported" method by chocolatey, that is, try not to roll our own code to do this
* Fully automated, that is, requires no human intervention to run
* Zero additional infrastructure required, that is, use only existing infrastructure

### Solution

Puppet publishes its Windows based installers in the Chocolatey community feed (https://chocolatey.org/profiles/Puppet).  Normally these packages would be created as part of the vanagon build process, however as yet, vanagon doesn't support building Nuget packages easily.  To this end we can use the Chocolatey Automatic Package Updater Module (AU) to post process the released MSI.  The AU module is used by hundreds of chocolatey packages, and is used by the core packages maintainers themselves.  Then by using Appveyor with scheduled builds, this could be automated to run every day, resulting in a lag of up to 24 hours between something being released by Puppet and then being available on chocolatey.

The TLDR is the AU module will web scrape the download sites looking for new MSIs and then package and push the templated chocolatey packages.

There are instructions in the repository which describe how to run AU locally.

### Repository

[https://github.com/puppetlabs/puppet-chocolatey-packages](https://github.com/puppetlabs/puppet-chocolatey-packages)

* This repository contains the web scraping code and the templating information used to create the packages.
* Each package has a directory inside the `automatic` directory, for example puppet-agent is `automatic/puppet-agent`
* Once a day Appveyor will run the Automatic Updater in update mode (This was configured via the Appveyor project settings and can not be set via Appveyor.yaml).  Normal repository pushes will still generate the packages but no package pushes or git commits will be performed

The AU module has indepth documentation on how it works but here's a quick summary;

1. The update.ps1 file in each package contains a function called global:au_GetLatest.  This function scrapes the download locations and outputs a hash table which contains the latest version in each stream.  A stream is used to group similar versions together.  Typically a stream is the major and minor version.  For example the puppet-agent output would look like;

``` json
{
    "Streams":  {
                    "5.5":  {
                                "URL64":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.0-x64.msi",
                                "Version":  "5.5.0",
                                "URL32":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.0-x86.msi"
                            },
                    "5.4":  {
                                "URL64":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.4.0-x64.msi",
                                "Version":  "5.4.0",
                                "URL32":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.4.0-x86.msi"
                            },
                    "5.3":  {
                                "URL64":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.3.5-x64.msi",
                                "Version":  "5.3.5",
                                "URL32":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.3.5-x86.msi"
                            },
                    "5.2":  {
                                "URL64":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.2.0-x64.msi",
                                "Version":  "5.2.0",
                                "URL32":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.2.0-x86.msi"
                            },
                    "5.1":  {
                                "URL64":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.1.0-x64.msi",
                                "Version":  "5.1.0",
                                "URL32":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.1.0-x86.msi"
                            },
                    "5.0":  {
                                "URL64":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.0.1-x64.msi",
                                "Version":  "5.0.1",
                                "URL32":  "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.0.1-x86.msi"
                            },
                    "1.10":  {
                                 "URL64":  "https://downloads.puppetlabs.com/windows/puppet-agent-1.10.10-x64.msi",
                                 "Version":  "1.10.10",
                                 "URL32":  "https://downloads.puppetlabs.com/windows/puppet-agent-1.10.10-x86.msi"
                             },
...
```

2. The AU module then uses this hashtable to query chocolatey to see if the package is already published.  If not it starts to create a chocolatey package for each new version

3. The AU module will automatically download the installer assets and generate the SHA256 hashes

4. The AU module will then modify the template and generate the chocolatey packages

5. If needed, the AU module will then push the chocolatey packages and git commits if it's running it's daily cycle.  Example commit is at [https://github.com/puppetlabs/puppet-chocolatey-packages/commit/43f32d06446124f4bc61c806b6e888d1cbf35b8d](https://github.com/puppetlabs/puppet-chocolatey-packages/commit/43f32d06446124f4bc61c806b6e888d1cbf35b8d)

5. The AU module maintains a list of latest packages in the `<package-name>.json` file.  For example the `puppet-agent.json` file would look like;

``` json
{
    "1.0":  "1.0.1",
    "1.1":  "1.1.1",
    "1.2":  "1.2.7",
    "1.3":  "1.3.6",
    "1.4":  "1.4.2",
    "1.5":  "1.5.3",
    "1.6":  "1.6.2",
    "1.7":  "1.7.2",
    "1.8":  "1.8.3",
    "1.9":  "1.9.3",
    "1.10":  "1.10.10",
    "5.0":  "5.0.1",
    "5.1":  "5.1.0",
    "5.2":  "5.2.0",
    "5.3":  "5.3.5",
    "5.4":  "5.4.0",
    "5.5":  "5.5.0"
}
```

### Secrets
The AU module needs a github account and Chocolatey API key in order to push packages and commits.  These are secured using the standard Appveyor secrets encryption ([https://ci.appveyor.com/tools/encrypt](https://ci.appveyor.com/tools/encrypt)) and are held in the Release Engineering 1Password vault.

The git commits are performed using the [puppet-chocolatey-bot](https://github.com/puppet-chocolatey-bot) github account

### Debugging the automated process

The latest update run will output its results to the following gist;

[https://gist.github.com/puppet-chocolatey-bot/07d26b70044a34c1d9aa5576057d515e](https://gist.github.com/puppet-chocolatey-bot/07d26b70044a34c1d9aa5576057d515e)

### Adding a new package

The quickest way to add a new package is to;

1. Copy an existing package directory
2. Modify the update.ps1 file to webscrape the versions correctly
3. Modify the `<package>.nuspec` and `tools/chocolateyinstall.ps1` files with the correct information
4. Run `update.ps1` to generate the chocolatey package and then test them on a different system e.g. a VM from VMPooler

Examples of adding a package

* [PDK](https://github.com/puppetlabs/puppet-chocolatey-packages/commit/64663759fb1c7f198d97b54fe766d94139875bb8)
* [Puppet Bolt](https://github.com/puppetlabs/puppet-chocolatey-packages/commit/39f76edf078e423a698672230d375a03064185ee)
