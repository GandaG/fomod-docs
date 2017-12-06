.PHONY: setup docs clean

all: clean docs

setup:
	sudo apt install -y libxml2-utils curl
	pip install -r requirements.txt

docs/_static/ModuleConfig.html:
	curl https://raw.githubusercontent.com/GandaG/fomod-schema/5.0/ModuleConfig.xsd | xsltproc -o $@ docs/xsd2html.xsl -

docs: docs/*.md examples/* docs/_static/ModuleConfig.html
	$(MAKE) -C docs html

clean:
	$(MAKE) -C docs clean

test:
	curl -o fomod.xsd https://raw.githubusercontent.com/GandaG/fomod-schema/5.0/ModuleConfig.xsd
	find examples/ -name "ModuleConfig.xml" -print0 | xargs -0 -n1 xmllint --noout --schema fomod.xsd
	rm fomod.xsd
