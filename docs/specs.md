# Specification

The *fomod* format initially arose from the need
to provide users with a simpler way of installing
mods without the need to download multiple files.

It was created and initially maintaned by a
currently unknown developer.

The *fomod* files (discussed below) can be thought
of as a blueprint for a mod manager or an independent
mod installer to create a GUI (graphical user interface)
to simplify user installation.


## Structure

A *fomod* installers requires a specific package
structure. Assuming the current directory (`.`)
is the package:

    .
    ├── example.plugin
    └── readme.txt

A `fomod` folder is needed and within it two files
that are going to be described below: [Info](#info-file)
and [Config](#config-file).

A final structure should resemble:

    .
    ├── fomod
    │   ├── info.xml
    │   └── ModuleConfig.xml
    ├── example.plugin
    └── readme.txt

## Info File

There is no defined schema for this file but it
is required anyway. A proposed schema to fit the
majority of mod managers could be:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" version="5.x">
    <xs:element name="fomod">
        <xs:annotation>
            <xs:documentation>
                The following tags are to be filled in according
                to their tags, shouldn't be hard to figure out.
            </xs:documentation>
        </xs:annotation>
        <xs:complexType>
            <xs:sequence>
                <xs:element name="Name" type="xs:string" minOccurs="0"/>
                <xs:element name="Author" type="xs:string" minOccurs="0"/>
                <xs:element name="Version" minOccurs="0">
                    <xs:complexType>
                        <xs:simpleContent>
                            <xs:extension base="xs:string">
                                <xs:attribute name="MachineVersion" type="xs:string"/>
                                    <xs:annotation>
                                        <xs:documentation>
                                            This attribute is used for providing a
                                            machine-readable version.
                                            Examples can be found here - https://en.wikipedia.org/wiki/Software_versioning

                                            Semantic versioning is recommended - https://semver.org/
                                        </xs:documentation>
                                    </xs:annotation>
                            </xs:extension>
                        </xs:simpleContent>
                    </xs:complexType>
                </xs:element>
                <xs:element name="Description" type="xs:string" minOccurs="0"/>
                <xs:element name="Website" type="xs:string" minOccurs="0"/>
                <xs:element name="Id" type="xs:string" minOccurs="0"/>
				<xs:any processContents="skip" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>
							This element is used solely for allowing extensions
							since this is merely a proposed schema.
						</xs:documentation>
					</xs:annotation>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```


## Config File

You can find a complete reference for this file [here](_static/ModuleConfig.html).
However, since it is generally easier to understand,
it is recommended that you look through the [actual schema](https://github.com/GandaG/fomod-schema/blob/5.1/ModuleConfig.xsd).
