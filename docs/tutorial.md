# A FOMOD Tutorial

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
    <Version>1.0</Version>
    <Description>
        This is a description!
    </Description>
</fomod>
```

See? It didn't hurt and now everyone else knows a little more about our mod!
It should be pretty much self-explanatory but if you need a reminder on xml
feel free to pause here and look at [W3Schools](http://www.w3schools.com/xml/).

There are a few more things we could add to **info.xml** but for now it's enough.
If you want to learn more about it, check out
[example 02](https://github.com/fomod-lang/fomod/blob/master/examples/02/fomod/info.xml).

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
