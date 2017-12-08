# fomod Documentation

*A game-agnostic mod installer format.*

You can find the full documentation for this format at [fomod-docs.rtfd.io](https://fomod-docs.rtfd.io).

For simple issues use the [issue tracker at Github](https://github.com/GandaG/fomod-docs/issues).

There are a number of associated repositories that might be worth checking out:

- [fomod-schema](https://github.com/GandaG/fomod-schema),
  which maintains and develops the schema that governs this format.
- [fomod-validator](https://github.com/GandaG/fomod-validator),
  a very simple app that validates and checks installers for mistakes.
- [fomod-designer](https://github.com/GandaG/fomod-designer),
  an app that lets you build your installer in a simpler way with a graphical interface.
- [pyfomod](https://github.com/GandaG/pyfomod),
  for developers, a python package that forms the backbone of all apps listed here.


## Contributing
[![Build Status](https://img.shields.io/travis/GandaG/fomod-docs.svg?style=flat-square)](https://travis-ci.org/GandaG/fomod-docs)

If you're not familiar with the terms used, we have a [glossary](#glossary) at the end for you!
Try hovering over the unknown words, that might help too.

- Using [*git*](#git "git is a version control system") is no longer necessary since Github allows [commiting](#commit "Committing modifications to files creates a snapshot of your project") directly with the web interface. [Github has a pretty good guide on using their web interface](https://github.com/WGBH/pbucore/wiki/Contributing-to-the-project-through-Github-web-interface).

- Before submitting a [pull request](#pull-request "Pull requests allow you to ask for a set of changes to another repository") make sure to submit a [ticket in the issue tracker](#issue "Use these to leave feedback and suggestions!") and reference this ticket in the PR, so it can be discussed. Typos and other small changes are exempted.

- Any pull requests have to pass the tests run on travis (see badge above). These tests consist on passing any examples through an xml [linter](#lint "Linting documents is simply checking for errors").

- Pull requests without a proper description will not be accepted.


### Building the documentation

The documentation is automatically built and uploaded to ReadTheDocs whenever it's pushed to this repo,
however it may be useful to build locally to find typos and other errors before pushing.

These instructions are for Linux only, I don't have a Windows machine available to test building and I
never even came physically close to a Mac.


#### Setup

Follow the instructions on setting up a virtualenv from [here](https://askubuntu.com/questions/244641/how-to-set-up-and-use-a-virtual-python-environment-in-ubuntu)
and then:

```
sudo apt install -y make
make setup
```


#### Build

```
make
```

#### Cleanup

```
make clean
```


## Glossary

<dl>
  <dt><a name="git"></a>Git</dt>
  <dd>Git is a version control system. You can learn more about them and git <a href="https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control">here</a>.</dd>

  <dt><a name="commit"></a>Commit</dt>
  <dd>Committing modifications to files creates a snapshot of your project.
This is incredibly useful if you ever need to revert changes,
to look at who made some changes or to allow multiple people to work on something at the same time.
Like we're doing!</dd>

  <dt><a name="pull-request"></a>Pull Request</dt>
  <dd>Pull requests allow you to ask for a set of changes to another repository. You can learn more about them <a href="https://help.github.com/articles/about-pull-requests/">here</a>.</dd>

  <dt><a name="issue"></a>Issues, Tickets and Issue Tracker</dt>
  <dd>The issue tracker is the place where you can open a ticket aka issue. Use these to leave feedback and suggestions! You can learn more about them <a href="https://help.github.com/articles/about-issues/">here</a>.</dd>

  <dt><a name="lint"></a>Linting</dt>
  <dd>Linting documents is simply checking for errors. In our case, we check for compliance with a specific set of rules to enforce (the schemas). You can learn more about it <a href="https://stackoverflow.com/questions/8503559/what-is-linting">here</a>.</dd>
</dl>
