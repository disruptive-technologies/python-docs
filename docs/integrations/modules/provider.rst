.. _integrations_provider:

provider
========
This submodule contains information related to the various supported providers.

String Constants
----------------
The :code:`provider` module contains a string constant for each supported provider.

.. autoattribute:: dtintegrations.provider.FLASK
.. autoattribute:: dtintegrations.provider.DJANGO
.. autoattribute:: dtintegrations.provider.GCLOUD
.. autoattribute:: dtintegrations.provider.LAMBDA
.. autoattribute:: dtintegrations.provider.AZURE

This can be a useful alternative to writing the strings directly.

.. code-block:: python

   from dtintegrations import data_connector, provider

   event = data_connector.http_push.validate(
       request=request,
       provider=provider.FLASK,
       secret='test-secret',
   )
