.PHONY: setup docs clean schema

XSD_URL=https://raw.githubusercontent.com/GandaG/fomod-schema/5.1/ModuleConfig.xsd

all: clean docs

setup:
	sudo apt install -y libxml2-utils curl
	pip install -r requirements.txt

schema:
	curl $(XSD_URL) | xsltproc -o docs/_static/ModuleConfig.html docs/xsd2html.xsl -

docs/_build:
	$(MAKE) -C docs html

docs: docs/_build

clean:
	$(MAKE) -C docs clean
	rm -r docs/_build

test:
	curl -o fomod.xsd $(XSD_URL)
	find examples/ -name "ModuleConfig.xml" -print0 | xargs -0 -n1 xmllint --noout --schema fomod.xsd
	rm fomod.xsd
