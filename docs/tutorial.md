# A FOMOD Tutorial

At the end of each section there will be a link to an example
package where you can see all that was discussed so far.

Let's jump right in - we have finished our mod and we need to provide
an installer.


## A Simple Installer

We'll start with a simple example, here's how our package looks:

    .
    ├── example.plugin
    ├── readme.txt

Don't forget that the . (dot) simbolizes our current directory.

So we need to install our **example.plugin** to wherever plugins are
installed for this game. We don't really care where exactly that is,
we'll leave that to the actual installer to figure out.
From now on, let's call this destination folder, **dest**.

We start by creating a folder named **fomod** and then creating two
files under it named **info.xml** and **ModuleConfig.xml**. Your
package should now look like:

    .
    ├── fomod
    │   ├── info.xml
    │   └── ModuleConfig.xml
    ├── example.plugin
    ├── readme.txt

Start with **info.xml**. You could type this in and be done with it:

```xml
<fomod/>
```

... but that's not really helpful, is it? The purpose of the **info.xml**
file is to provide extra metadata for your package, so other people and
apps understand what it is about. So let's fill it in properly:

```xml
<fomod>
    <Name>Example Mod</Name>

    <Author>Example Author</Author>

    <Version MachineVersion="1.2.3">
        1.2.3
    </Version>

    <Description>
        This is an example mod.
    </Description>

    <Website>
        https://example.website.com/example-mod
    </Website>
</fomod>
```

See? It didn't hurt and now everyone else knows a little more about our mod!
It should be pretty much self-explanatory but if you need a reminder on xml
feel free to pause here and look at [W3Schools](http://www.w3schools.com/xml/).

Moving on! The **ModuleConfig.xml** is where the magic happens. Coincidentally,
it's also the more complex and mind-numbing of the two. So we'll start slow and
build our way through all the options. At least the more useful ones.

```xml
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="http://qconsulting.ca/fo3/ModConfig5.0.xsd">

    <moduleName>Example Mod</moduleName>

    <requiredInstallFiles>
        <file source="example.plugin"/>
    </requiredInstallFiles>

</config>
```

Ok, bit of a mouthful. The *config* tag has the url of the schema as an attribute
and it serves as the root of the entire tree. *moduleName* should be pretty much
self-explanatory, no?

Now, *requiredInstallFiles*. This tag serves as a root to any files and folders
that are ALWAYS installed with your mod. Simple enough. That's all we want for now.
The *file* tag under it specifies what to install. The attribute *source* says where
the source file will be found. If you needed to install a folder, instead of listing
all files in that folder you could use the *folder* tag, it has exactly the same
attributes as *file*.

And that's it. We've just made a tiny installer that will successfully install
**example.plugin** for our users.

[Example 01](https://github.com/GandaG/fomod-docs/tree/master/examples/01)


## Dependencies Network

Right, our installer is a little too simple. Let's say you added a few more
things to your plugin, that depended on another plugin. Why waste time reiventing
the wheel?

So now you need to make sure the other mod is installed before your own or it won't
work. Let's say our plugin depends on **depend1.plugin**:

```xml
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="http://qconsulting.ca/fo3/ModConfig5.0.xsd">

    <moduleName>Example Mod</moduleName>

    <moduleDependencies operator="And">
        <fileDependency file="depend1.plugin" state="Active"/>
    </moduleDependencies>

    <requiredInstallFiles>
        <file source="example.plugin"/>
    </requiredInstallFiles>

</config>
```

(Pay attention to the order of the tags! It's important!)

*moduleDependencies* lists all the dependencies our mod needs fulfilled. It is
the first thing the actual installer will check, even before installing the files
in *requiredInstallFiles*. This dependency list is actually a shared format
(meaning other tags will follow the same rules, even if their tag is different),
so we'll refer back here whenever another shows up.

The *operator* attribute shows how the dependencies will be resolved:

- "And", every single dependency needs to be met
- "Or", at least one dependency needs to be met

*fileDependency*, much like the *file* tag, specifies a file, which in this case
needs to exist in the **dest** folder. The *file* attribute is, unsurprisingly,
the file to depend on, and *state* is which state the file can be in ("Active",
"Inactive" and "Missing").

And that's it, you now successfully depen... Awww shucks. You forgot another dependency!

You also depend on another mod, but here the author was a bit messy. He changed
the name of the installed file when he updated the version! You should never, ever,
do this, but not everyone is as amazing, beautiful and articulate as we are.

So now you depend on another two files, **depend2v1.plugin** and **depend2v2.plugin**.
But your mod works with both, so you don't really care which the user has installed
and you can't put both under the "And" operator since the user will only have one of them
installed. Now we enter the domain of nested dependencies:

```xml
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="http://qconsulting.ca/fo3/ModConfig5.0.xsd">

    <moduleName>Example Mod</moduleName>

    <moduleDependencies operator="And">
        <fileDependency file="depend1.plugin" state="Active"/>
        <dependencies operator="Or">
            <fileDependency file="depend2v1.plugin" state="Active"/>
            <fileDependency file="depend2v2.plugin" state="Active"/>
        </dependencies>
    </moduleDependencies>

    <requiredInstallFiles>
        <file source="example.plugin"/>
    </requiredInstallFiles>

</config>
```

The *dependencies* tag works exactly like *moduleDependencies* (remember what
I said before?). It has the same attribute (*operator*, and it works the same way),
the same possible children. You can even have another *dependencies* within it!

So how does it all resolve? Let's start from the top:

- *moduleDependencies*'s *operator* is "And" so we need to meet all dependencies;
- First, the dependency on **depend1.plugin** is always mandatory;
- Second, the nested *dependencies* has to be met too, so we go down:
    - This *operator* is "Or" so at least on of these files has to exist;
    - If either **depend2v1.plugin** or **depend2v2.plugin** exist, this is met.
- And we go back up and check if if they're all met. If they are, installation moves on
and if not, installation stops here and the actual installer complains!

To finish off this section, there might be another useful tag to use with
*moduleDependencies*: *gameDependency*. It's used like this:

```xml
<moduleDependencies>
    <gameDependency version="1.0"/>
</moduleDependencies>
```

It pretty much just specifies a minimum version of the game that the mod needs to be
able to run.

And finally, you now successfully depend on two other mods to install!

[Example 02](https://github.com/GandaG/fomod-docs/tree/master/examples/02)
