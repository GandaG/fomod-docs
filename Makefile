.PHONY: clean

docs/_build/* : docs/*.md examples/* docs/_static/ModuleConfig.html
	$(MAKE) -C docs html

docs/_static/ModuleConfig.html:
	curl https://raw.githubusercontent.com/GandaG/fomod-schema/5.0/ModuleConfig.xsd | xsltproc -o $@ docs/xsd2html.xsl -

clean:
	$(MAKE) -C docs clean
