.. _2nd_gen_temperature_sensor_example:

2.Gen Temperature Sensor
========================
In this example we will look at how to publish an emulated temperature event for the 2nd generation temperature sensor, then fetch and combine its event history.

Full Example
------------
The following snippet implements the example. Remember to set the environment variables.

.. code-block:: python

   import os
   from datetime import datetime, timedelta
   import disruptive as dt
   
   # Fetch credentials and device info from environment.
   key_id = os.getenv('DT_SERVICE_ACCOUNT_KEY_ID')
   secret = os.getenv('DT_SERVICE_ACCOUNT_SECRET')
   email = os.getenv('DT_SERVICE_ACCOUNT_EMAIL')
   device_id = os.getenv('DT_DEVICE_ID')
   
   # Authenticate the package using Service Account credentials.
   dt.default_auth = dt.Auth.service_account(key_id, secret, email)
   
   # Create initial values of temperature and time.
   timestamp_now = datetime.utcnow()
   temperature_now = 22.3
   
   # Generate a list of 5 temperature samples, spread evenly in time.
   samples = []
   n_samples = 5
   for i in range(n_samples):
       samples.append(dt.events.TemperatureSample(
           celsius=temperature_now-i,
           timestamp=timestamp_now-timedelta(seconds=int(i*((15*60)/n_samples))),
       ))
   
   # Publish an emulated temperature event with inter-heartbeat samples.
   dt.Emulator.publish_event(
       device_id=os.getenv('DT_DEVICE_ID'),
       project_id=os.getenv('DT_PROJECT_ID'),
       data=dt.events.Temperature(
           celsius=temperature_now,
           timestamp=timestamp_now,
           samples=samples,
       )
   )

   # Fetch a list of all temperature event within the last 7 days.
   events = dt.EventHistory.list_events(
       device_id=os.getenv('DT_DEVICE_ID'),
       project_id=os.getenv('DT_PROJECT_ID'),
       event_types=[dt.events.TEMPERATURE],
       start_time=datetime.utcnow()-timedelta(days=7),
   )
   
   # Create lists into which we will group all samples.
   timestamps = []
   values = []
   
   # Iterate through list of fetched events.
   for event in events:
       # Concatenate samples list to the total group.
       timestamps += [sample.timestamp for sample in event.data.samples]
       values += [sample.celsius for sample in event.data.samples]
   
   # Plot the output. This requires matplotlib to be installed.
   # import matplotlib.pyplot as plt
   # plt.plot(timestamps, values, '.-')
   # plt.show()

Explanation
-----------
Using `Service Account <https://developer.disruptive-technologies.com/docs/service-accounts/introduction-to-service-accounts>`_ credentials, the entire package can be authenticated at once by setting the :code:`dt.default_auth` variable with an Auth :ref:`authentication method <authmethods>`.

.. code-block:: python

   dt.default_auth = dt.Auth.service_account(key_id, secret, email)

Once authenticated, ...