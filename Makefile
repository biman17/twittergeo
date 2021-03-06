# This file is part of twittergeo.
# https://github.com/fitnr/twittergeo

# Licensed under the GNU General Public License v3 (GPLv3) license:
# http://opensource.org/licenses/GPL-3.0
# Copyright (c) 2015, Neil Freeman <contact@fakeisthenewreal.org>
.PHONY: deploy clean

README.rst: README.md
	- pandoc $< -o $@
	@touch $@
	python setup.py check --restructuredtext --strict

deploy: README.rst | clean
	python setup.py sdist
	python3 setup.py bdist_wheel
	twine upload dist/*
	python setup.py register

clean: ; rm -rf dist build
