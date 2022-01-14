.. _fetch_event_history_example:

Fetch Event History
===================
In this example, a device's humidity events is fetched and printed for the past 7 days.

Full Example
------------
The following snippet implements the example. Remember to update user-defined variables.

.. code-block:: python

   from datetime import datetime, timedelta
   import disruptive as dt
   
   # User-defined variables.
   DEVICE_ID = '<YOUR_DEVICE_ID>'
   PROJECT_ID = '<YOUR_PROJECT_ID>'
   
   # Define the start-time from when events are fetched.
   seven_days_ago = datetime.now() - timedelta(7)
   
   # Fetch humidity events from the past 7 days.
   events = dt.EventHistory.list_events(
       device_id=DEVICE_ID,
       project_id=PROJECT_ID,
       event_types=[dt.events.HUMIDITY],
       start_time=seven_days_ago,
   )
   
   # Iterate through the list of fetched events.
   for event in events:
       # Isolate a few values contained within the event.
       event_id = event.event_id
       timestamp = event.data.timestamp
       humidity = event.data.humidity
   
       # Print a formatted string of the isolated information.
       print(f'{humidity}% humidity from event {event_id} at {timestamp}.')

This will produce an output similar to the following snippet.

.. code-block:: bash

   60% humidity from event c2f6e07km0nusv59v10g at 2021-05-14 12:03:12.500464+00:00.
   24% humidity from event c2f6dvvkm0nusv59v0vg at 2021-05-14 12:03:11.128840+00:00.
   24% humidity from event c2dre6vkm0nusv59od3g at 2021-05-12 11:08:11.833330+00:00.

Step-by-Step Explanation
------------------------
The package is authenticated as described in the :ref:`Authentication <client_authentication>` using environment variables.

Once authenticated, a the event history of a device can be fetched using the :code:`list_events()` resource method, but first we use the standard :code:`datetime` library to define our start time.

.. code-block:: python

   # Define the start-time from when events are fetched.
   seven_days_ago = datetime.now() - timedelta(7)

The start time is provided to the event history method, which executes the request.

.. code-block:: python
   
   # Fetch humidity events from the past 7 days.
   events = dt.EventHistory.list_events(
       device_id=DEVICE_ID,
       project_id=PROJECT_ID,
       event_types=[dt.events.HUMIDITY],
       start_time=seven_days_ago,
   )

The response is a list of :ref:`Events <client_events>` which we can iterate through in a loop. Within each event, various information is then extracted and printed.

.. code-block:: python

   for event in events:
       # Isolate a few values contained within the event.
       event_id = event.event_id
       timestamp = event.data.timestamp
       humidity = event.data.humidity
   
       # Print a formatted string of the isolated information.
       print(f'{humidity}% humidity from event {event_id} at {timestamp}.')
