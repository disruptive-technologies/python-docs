.. _client_examples:

********
Examples
********
The following examples are meant to help you get started using our Python API.

Environment Variables
---------------------
All examples authenticate as described in the :ref:`Authentication <client_authentication>` section, by setting Service Account in environment variables. 

.. code-block:: bash

   export DT_SERVICE_ACCOUNT_KEY_ID="<SERVICE_ACCOUNT_KEY_ID>"
   export DT_SERVICE_ACCOUNT_SECRET="<SERVICE_ACCOUNT_SECRET>"
   export DT_SERVICE_ACCOUNT_EMAIL="<SERVICE_ACCOUNT_EMAIL>"

Depending on the example, additional variables like :code:`DEVICE_ID` and :code:`PROJECT_ID` may be required.

List of Examples
----------------

- :ref:`Get Device <get_device_example>`
- :ref:`Plot Sensor Data <plot_sensor_data_example>`
- :ref:`Threaded Stream <threaded_stream_example>`
- :ref:`2.Gen Temperature Sensor <2nd_gen_temperature_sensor_example>`

.. toctree::
   :maxdepth: 1
   :hidden:
   
   examples/get_device
   examples/fetch_event_history
   examples/plot_sensor_data
   examples/threaded_stream
   examples/2nd_gen_temperature_sensor
