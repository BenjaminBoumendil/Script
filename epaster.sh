#!/bin/sh

if [ $1 ] && [ $2 = 'create' ]; then
	cd $HOME/epaster ; source bin/activate ; cd -
	paster create -t django $1
	cd $1 ; make install
fi

if [ $1 ] && [ $2 = 'app' ]; then
	django-instance startapp $1
	touch $1/admin.py
	touch $1/urls.py
	touch $1/forms.py

	mkdir templates/$1
	touch templates/$1/home.html
	echo "{% extends 'skeleton.html' %}
{% load i18n %}

{% block base_content %}
Home View
{% endblock %}" > templates/$1/home.html

	mkdir mods_available/$1
	touch mods_available/$1/__init__.py
	touch mods_available/$1/settings.py
	touch mods_available/$1/urls.py
	cd mods_enabled ; ln -s ../mods_available/redir ; cd -
	echo "# -*- coding: utf-8 -*-

from django.conf.urls.i18n import i18n_patterns

urlpatterns = i18n_patterns('',
    url(r'^"$1"/', include('project."$1".urls')),
	) + urlpatterns" > mods_available/$1/urls.py

	echo "# -*- coding: utf-8 -*-

INSTALLED_APPS = add_to_tuple(INSTALLED_APPS, 'project."$1"')" > mods_available/$1/settings.py

	echo "# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url
from django.conf.urls.static import static
import views


urlpatterns = patterns('',
    url(r'^$', views.HomeView.as_view(), name='home_view'),
)" > $1/urls.py

	echo "from django.shortcuts import render
from django.views.generic import TemplateView


class HomeView(TemplateView):
    template_name = 'redir/home.html'
" > $1/views.py

	echo $1 "created with success"
fi