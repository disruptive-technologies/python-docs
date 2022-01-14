.. _2nd_gen_temperature_sensor_example:

2.Gen Temp Sensor
===================
In this example we will look at how to publish an emulated temperature event for the 2nd generation temperature sensor, then fetch- and plot its event history.

Full Example
------------
The following snippet implements the example. Remember to update user-defined variables.

.. code-block:: python

   import matplotlib.pyplot as plt
   from datetime import datetime, timedelta
   import disruptive as dt
   
   # Fetch credentials and device info from environment.
   DEVICE_ID = '<YOUR_DEVICE_ID>'
   PROJECT_ID = '<YOUR_PROJECT_ID>'
   
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
       device_id=DEVICE_ID,
       project_id=PROJECT_ID,
       data=dt.events.Temperature(
           celsius=temperature_now,
           timestamp=timestamp_now,
           samples=samples,
       )
   )
   
   # Fetch a list of all temperature event within the last 7 days.
   events = dt.EventHistory.list_events(
       device_id=DEVICE_ID,
       project_id=PROJECT_ID,
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
   plt.plot(timestamps, values, '.-')
   plt.show()

.. image:: t2-temperature.png

Step-by-Step Explanation
------------------------
The package is authenticated as described in the :ref:`Authentication <client_authentication>` using environment variables.

Once authenticated, a list of 5 :ref:`TemperatureSample <temperature_sample_event>` events are generated, where the timestamps are evenly spaced assuming a 15 minute heartbeat. For simplicity, the Celsius values are simply a linear increase, but can of course be any value.

.. code-block:: python

   timestamp_now = datetime.utcnow()
   temperature_now = 22.3
   
   samples = []
   n_samples = 5
   for i in range(n_samples):
       samples.append(dt.events.TemperatureSample(
           celsius=temperature_now-i,
           timestamp=timestamp_now-timedelta(seconds=int(i*((15*60)/n_samples))),
       ))

Once the list is ready, publish the event to our emulated sensor. To represent how a real sensor would work, the :ref:`Temperature <temperature_event>` event timestamp- and celsius is set to the first elements of our samples list. However, this is not necessary when emulating events.

.. code-block:: python

   dt.Emulator.publish_event(
       device_id=DEVICE_ID,
       project_id=PROJECT_ID,
       data=dt.events.Temperature(
           celsius=temperature_now,
           timestamp=timestamp_now,
           samples=samples,
       )
   )

The event history for the previous 7 days are also fetched. We specify that only :ref:`Temperature <temperature_event>` events should be fetched, ignoring other common ones like :ref:`Touch <touch_event>`- and :ref:`NetworkStatus <networkstatus_event>` events.

.. code-block:: python

   events = dt.EventHistory.list_events(
       device_id=DEVICE_ID,
       project_id=PROJECT_ID,
       event_types=[dt.events.TEMPERATURE],
       start_time=datetime.utcnow()-timedelta(days=7),
   )

As we're dealing with a 2nd generation temperature sensor, if we want to examine all data in the event history, all samples must be unpacked. This can be done by iterating through each event, then using list comprehension to isolate the attributes of interest, like timestamp and celsius.

.. code-block:: python

   for event in events:
       timestamps += [sample.timestamp for sample in event.data.samples]
       values += [sample.celsius for sample in event.data.samples]

Once concatenated, the time- and celsius values can be plotted directly.

.. code-block:: python

   plt.plot(timestamps, values, '.-')
   plt.show()
