.PHONY: setup docs clean

all: clean docs

setup:
	pip install -r requirements.txt

docs/_static/ModuleConfig.html:
	curl https://raw.githubusercontent.com/GandaG/fomod-schema/5.0/ModuleConfig.xsd | xsltproc -o $@ docs/xsd2html.xsl -

docs: docs/*.md examples/* docs/_static/ModuleConfig.html
	$(MAKE) -C docs html

clean:
	$(MAKE) -C docs clean
