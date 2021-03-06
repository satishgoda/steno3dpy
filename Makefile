
.PHONY: install publish docs coverage lint graphs tests

install:
	python setup.py install

publish:
	python setup.py sdist upload

docs:
	cd docs && make html

coverage:
	nosetests --logging-level=INFO --with-coverage --cover-package=steno3d --cover-html
	open cover/index.html

lint:
	pylint --output-format=html steno3d > pylint.html

graphs:
	pyreverse -my -A -o pdf -p steno3dpy steno3d/**.py steno3d/**/**.py

tests:
	nosetests --logging-level=INFO
