#!/bin/sh

ft_make_html()
{
	echo "{% extends 'skeleton.html' %}
{% load i18n %}

{% block base_content %}
Home View
{% endblock %}" > templates/$1/home.html
}

ft_make_mods_available()
{
	echo "# -*- coding: utf-8 -*-

from django.conf.urls.i18n import i18n_patterns

urlpatterns = i18n_patterns('',
	url(r'^"$1"/', include('project."$1".urls')),
	) + urlpatterns" > mods_available/$1/urls.py

	echo "# -*- coding: utf-8 -*-

INSTALLED_APPS = add_to_tuple(INSTALLED_APPS, 'project."$1"')" > mods_available/$1/settings.py
}

ft_make_url()
{
	echo "# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url
from django.conf.urls.static import static
import views


urlpatterns = patterns('',
    url(r'^$', views.HomeView.as_view(), name='home_view'),
)" > $1/urls.py
}

ft_make_view()
{
	echo "from django.shortcuts import render
from django.views.generic import TemplateView


class HomeView(TemplateView):
    template_name = '"$1"/home.html'
" > $1/views.py
}

if [ $1 ]; then
	if [ $2 = 'create' ]; then
		paster create -t django $1 &&
		cd $1 ; make install &&
		echo "\033[34m project created with success" ||
		echo "\033[31m error on project creation"
	elif [ $2 = 'app' ]; then
		# App creation
		django-instance startapp $1 &&
		touch $1/admin.py &&
		touch $1/urls.py &&
		touch $1/forms.py &&
		ft_make_url $1 &&
		ft_make_view $1 &&
		echo "\033[34m app created with success" ||
		echo "\033[31m error on app creation"

		# Template creation
		mkdir templates/$1 &&
		touch templates/$1/home.html &&
		ft_make_html $1 &&
		echo "\033[34m template created with success" ||
		echo "\033[31m error on template creation"

		# Mods creation
		mkdir mods_available/$1 &&
		touch mods_available/$1/__init__.py &&
		touch mods_available/$1/settings.py &&
		touch mods_available/$1/urls.py &&
		ln -s ../mods_available/$1 mods_enabled/$1 &&
		ft_make_mods_available $1 &&
		echo "\033[34m mods created with success" ||
		echo "\033[31m error on mods creation"

	fi
else
	echo "Usage : epaster [AppName] [option]

Options :
	create : create new project
	app : create new app"
fi