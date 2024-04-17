.. _integrations_quickstart:

Quickstart
==========
The :code:`dtintegrations` package let's you integrate with services in only a single line of code.

Installation
------------
The package can be installed through pip:

.. code-block:: bash

   pip install --upgrade dtintegrations

Support is available for Python 3.8+.

Usage
-----
Methods are namespaced under various modules and can be accessed as required.

The following example validates the incoming request at a simple `flask <https://flask.palletsprojects.com/en/2.0.x/>`_ server.

.. code-block:: python

   from dtintegrations import data_connector, provider

   payload = data_connector.HttpPush.from_provider(
       request=request,
       provider_name=provider.FLASK,
       secret='<YOUR_SIGNATURE_SECRET>',
   )

See the :ref:`Examples <integrations_examples>` section for more in-depth integrations.
