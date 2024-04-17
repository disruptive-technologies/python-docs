.. _client_quickstart:

Quickstart
==========
Our Python 3 API aims to be simple in use without compromising on functionality. Therefore, once authenticated, most functionality can be accessed with only a single line of code.

Installation
------------
The package can be installed through pip:

.. code-block:: bash

   pip install --upgrade disruptive

Support is available for Python 3.8+.

Authentication
--------------
Authenticate by providing `Service Account <https://developer.disruptive-technologies.com/docs/service-accounts/introduction-to-service-accounts>`_ credentials to the package.

.. code-block:: python

   import disruptive as dt
   
   dt.default_auth = dt.Auth.service_account(
       key_id="<SERVICE_ACCOUNT_KEY_ID>",
       secret="<SERVICE_ACCOUNT_SECRET>",
       email="<SERVICE_ACCOUNT_EMAIL>",
   )

See the :ref:`Authentication <client_authentication>` section for other methods of authentication.

Usage
-----
Once authenticated, most functionality can be accessed through resource methods on the following format.

.. code-block::

   disruptive.<Resource>.<method>()

A few common uses are showcased in the snippet below.

.. code-block:: python

   import disruptive as dt
   
   # Fetch a sensor, specified by its ID.
   sensor = dt.Device.get_device('<DEVICE_ID>')
   
   # Printing the returned object will list all attributes.
   print(sensor)
   
   # Set a new label on the sensor.
   dt.Device.set_label(sensor.device_id, sensor.project_id, key='nb', value='99')
   
   # Get touch- and temperature event history for the sensor.
   history = dt.EventHistory.list_events(
       sensor.device_id,
       sensor.project_id,
       event_types=[
           dt.events.TOUCH,
           dt.events.TEMPERATURE,
       ]
   )
   
   # Initiate an event stream for all devices in the sensor's project.
   for event in dt.Stream.event_stream(sensor.project_id):
       # Print new events data as they arrive.
       print(event.data)

See the :ref:`client_examples` section for more in-depth usage.
